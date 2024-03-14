import { Controller } from "@hotwired/stimulus"

let count = 0

// Connects to data-controller="recipients"

export default class extends Controller {
  static targets = ["input", "list", "nextBtn"];
  connect() {
    console.log("Recipients controller connected");
  }

  add(event) {
    event.preventDefault();
    const regexp = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/
    const email = this.inputTarget.value;
    const isEmailValid = email.match(regexp)

    if (isEmailValid) {
      count += 1
      const element = `
      <div class='d-flex align-items-center py-1 px-3 gap-2 bg-brand rounded-pill'>
        <p class="mb-0">${email}</p>
        <span class="material-symbols-outlined" data-action="click->recipients#delete">close</span>
        <input type="hidden" name="confirmation[email-${count}]" value="${email}">
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
