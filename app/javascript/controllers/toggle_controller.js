import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["capsule", "tabBtn", "message", "toggleIcon", "rocketIcon"]

  connect() {
    console.log('Toggle controller connected')
  }

  toggleNavTab() {
    console.log(this.capsuleTargets)
    this.capsuleTargets.forEach(target => {
      target.classList.toggle("d-none")
    })
    this.tabBtnTargets.forEach(target => {
      target.classList.toggle("tab-active")
    })
    this.rocketIconTargets.forEach(target => {
      target.classList.toggle("d-none")
    })
  }

  toggleMessages() {
    this.messageTargets.forEach(message => {
      message.classList.toggle("d-none")
    })
    this.toggleIconTarget.style.transform = 'rotate(180deg)'
  }
}
