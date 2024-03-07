import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["capsule", "tabBtn", "message", "toggleIcon"]

  connect() {
    console.log('Toggle controller connected')
  }

  toggleNavTab() {
    this.capsuleTargets.forEach(capsule => {
      capsule.classList.toggle("d-none")
    });
    this.tabBtnTargets.forEach(target => {
      target.classList.toggle("tab-active")
    })
  }

  toggleMessages() {
    this.messageTargets.forEach(message => {
      message.classList.toggle("d-none")
    })
    this.toggleIconTarget.style.transform = 'rotate(180deg)'
  }
}
