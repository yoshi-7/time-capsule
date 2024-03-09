import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="autosave"
export default class extends Controller {
  static targets = ["form"];

  connect() {
    console.log('Autosave controller connected')
  }

  save() {
    // this.formTarget.submit()
    const form = this.formTarget
    const formData = new FormData(form)
    fetch(form.action, {
      method: form.method,
      body: formData
    })
  }
}
