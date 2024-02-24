import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["capsule", "tabBtn", "draft", "finalize"];

  connect() {
    console.log('toggle')
  }

  toggleDisplay() {
    // Hide all capsules
    this.capsuleTarget.forEach(capsule => {
      capsule.classList.toggle("d-none");
    });
  }

  toggleFinalize() {
    this.draftTarget.classList.toggle("d-none");
    this.finalizeTarget.classList.toggle("d-none");
  }
}
