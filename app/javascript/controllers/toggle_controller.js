import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["capsule", "tabBtn", "capsuleInput"]

  connect() {
    console.log('Toggle controller connected')
    console.log(this.capsuleInputTargets)
  }

  toggleNavTab() {
    this.capsuleTargets.forEach(capsule => {
      capsule.classList.toggle("d-none")
    });
    this.tabBtnTargets.forEach(target => {
      target.classList.toggle("tab-active")
    })
  }

  toggleInputs() {
    console.log(this.capsuleInputTargets)
    this.capsuleInputTargets.forEach(input => {
      input.classList.toggle("d-none")
     })
  }
}
