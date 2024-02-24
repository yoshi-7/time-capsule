import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["capsule", "tabBtn", "partial"];

  connect() {
    console.log('toggle')
  }

  toggleNavTab() {
    this.capsuleTargets.forEach(capsule => {
      console.log(capsule)
      capsule.classList.toggle("d-none");
    });
    this.tabBtnTargets.forEach(target => {
      target.classList.toggle("tab-active");
    })
  }

  toggleCaspuleDataPartial() {
    this.partialTargets.forEach(page => {
      page.classList.toggle("d-none");
     })
  }
}
