import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["capsule", "tabBtn", "draft", "finalize"];
  
  connect() {
    console.log('toggle')
  }

  toggleDisplay() {
    this.capsuleTargets.forEach(capsule => {
      console.log(capsule)
      capsule.classList.toggle("d-none");
    });
    this.tabBtnTargets.forEach(target => {
      target.classList.toggle("tab-active");
    })
  }

  toggleFinalize() {
    this.draftTarget.classList.toggle("d-none");
    this.finalizeTarget.classList.toggle("d-none");
  }
}
