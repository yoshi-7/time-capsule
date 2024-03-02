import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="recipients"
export default class extends Controller {
  static targets = ["input", "list"];

  connect() {
    console.log("Recipients controller connected");
  }

  add(event) {
    event.preventDefault();
    const regexp = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/
    const email = this.inputTarget.value;
    const isEmailValid = email.match(regexp)

    if (isEmailValid) {
      const element = `
      <div class='d-flex gap-2'>
        <p>${email}</p>
        <span class="material-symbols-outlined" data-action="click->recipients#delete">close</span>
      </div>`;
      this.listTarget.insertAdjacentHTML('beforeend', element);
      this.inputTarget.value = "";

    } else {
      alert('This is not a valid email')
      this.inputTarget.value = "";
    }

  }

  delete(event) {
    event.preventDefault();
    event.target.closest("div").remove();
  }
}
