import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  connect() {
    console.log('toggle')
  }

  toggleDisplay() {
    // Hide all capsules
    this.capsuleTarget.forEach(capsule => {
      capsule.classList.toggle("d-none");
    });
  }
}
