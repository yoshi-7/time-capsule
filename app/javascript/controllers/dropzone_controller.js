import { Controller } from "@hotwired/stimulus";
import { DirectUpload } from "@rails/activestorage";
import Dropzone from "dropzone";

Dropzone.autoDiscover = false; // necessary quirk for Dropzone error in console

export default class extends Controller {
  static targets = ["input", "messageSpinner"];

  connect() {
    console.log("Dropzone connected");
    this.dropZone = createDropZone(this);
    this.hideFileInput();
    this.bindEvents();
  }

  // Private
  hideFileInput() {
    this.inputTarget.disabled = true;
    this.inputTarget.style.display = "none";
  }

  bindEvents() {
    this.dropZone.on("addedfile", file => {
      setTimeout(() => {
        file.accepted && createDirectUploadController(this, file).start();
      }, 500);
    });

    this.dropZone.on("removedfile", file => {
      file.controller && removeElement(file.controller.hiddenInput);
    });

    this.dropZone.on("queuecomplete", (file) => {
      this.form.submit()
    })
  }

  get headers() { return { "X-CSRF-Token": getMetaValue("csrf-token") }; }

  get url() { return this.inputTarget.getAttribute("data-direct-upload-url"); }

  get maxFiles() { return this.data.get("maxFiles") || 200; }

  get maxFileSize() { return this.data.get("maxFileSize") || 256; }

  get acceptedFiles() { return this.data.get("acceptedFiles"); }

  get addRemoveLinks() { return this.data.get("addRemoveLinks") || true; }

  get form() { return this.element.closest("form") }

  get submitButton() { return findElement(this.form, "input[type=submit], button[type=submit]") }
}

//4 HELPERS

export function getMetaValue(name) {
  const element = findElement(document.head, `meta[name="${name}"]`);
  if (element) {
    return element.getAttribute("content");
  }
}

export function findElement(root, selector) {
  if (typeof root == "string") {
    selector = root;
    root = document;
  }
  return root.querySelector(selector);
}

export function toArray(value) {
  if (Array.isArray(value)) {
    return value;
  } else if (Array.from) {
    return Array.from(value);
  } else {
    return [].slice.call(value);
  }
}

export function removeElement(el) {
  if (el && el.parentNode) {
    el.parentNode.removeChild(el);
  }
}

export function insertAfter(el, referenceNode) {
  return referenceNode.parentNode.insertBefore(el, referenceNode.nextSibling);
}

class DirectUploadController {
  constructor(source, file) {
    this.directUpload = createDirectUpload(file, source.url, this);
    this.source = source;
    this.file = file;
  }

  start() {
    this.file.controller = this;
    this.hiddenInput = this.createHiddenInput();
    this.directUpload.create((error, attributes) => {
      if (error) {
        removeElement(this.hiddenInput);
        this.emitDropzoneError(error);
      } else {
        this.hiddenInput.value = attributes.signed_id;
        this.emitDropzoneSuccess();
      }
    });
  }

  createHiddenInput() {
    const input = document.createElement("input");
    input.type = "hidden";
    input.name = this.source.inputTarget.name;
    insertAfter(input, this.source.inputTarget);
    return input;
  }

  directUploadWillStoreFileWithXHR(xhr) {
    this.bindProgressEvent(xhr);
    this.emitDropzoneUploading();
  }

  bindProgressEvent(xhr) {
    this.xhr = xhr;
    this.xhr.upload.addEventListener("progress", event =>
    this.uploadRequestDidProgress(event)
    );
  }

  uploadRequestDidProgress(event) {
    const progress = (event.loaded / event.total) * 100;
    findElement(
      this.file.previewTemplate,
      ".dz-upload"
    ).style.width = `${progress}%`;
  }

  emitDropzoneUploading() {
    this.file.status = Dropzone.UPLOADING;
    this.source.dropZone.emit("processing", this.file);
  }

  emitDropzoneError(error) {
    this.file.status = Dropzone.ERROR;
    this.source.dropZone.emit("error", this.file, error);
    this.source.dropZone.emit("complete", this.file);
  }

  emitDropzoneSuccess() {
    this.file.status = Dropzone.SUCCESS;
    this.source.dropZone.emit("success", this.file);
    this.source.dropZone.emit("complete", this.file);
  }
}

function createDirectUploadController(source, file) {
  return new DirectUploadController(source, file);
}

function createDirectUpload(file, url, controller) {
  return new DirectUpload(file, url, controller);
}

function createDropZone(controller) {
  return new Dropzone(controller.element, {
    url: controller.url,
    headers: controller.headers,
    maxFiles: controller.maxFiles,
    maxFilesize: controller.maxFileSize,
    acceptedFiles: controller.acceptedFiles,
    autoQueue: false
  });
}
