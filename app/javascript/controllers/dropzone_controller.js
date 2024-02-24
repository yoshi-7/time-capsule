import { Controller } from "@hotwired/stimulus"
import { Dropzone } from "dropzone";

// Connects to data-controller="dropzone"
export default class extends Controller {
  static targets = ["photoInput", "photoThumbnails", "photoWrapper"]

  connect() {
    console.log('dropzone connected')
  }

  photoUpload() {
    console.log('uploading...')
    // const formData = new FormData(this.formTarget)
    // Array.from(this.inputTarget.files).forEach((file) => {
    //   formData.append(`capsule[photos][]`, file)
    }

    // const uploadEndpoint = this.formTarget.action

    // fetch(uploadEndpoint, {
    //   method: 'POST',
    //   body: formData,
    //   headers: {
    //     'X-CSRF-Token': document.querySelector("[name='csrf-token']").getAttribute('content'),
    //   },
    //   credentials: 'same-origin'
    // })
    // .then(response => response.text())
    // .then(html => {
    //   this.thumbnailsTarget.innerHTML += html
    // })
}
