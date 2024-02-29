import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="recipients"
export default class extends Controller {
  static targets = ["input", "list"];

  connect() {
    console.log("Recipients controller connected");
  }

  add(event) {
    event.preventDefault();
    const email = this.inputTarget.value;
    if (email) {
      const listItem = document.createElement("li");
      listItem.textContent = email;

      const deleteButton = document.createElement("button");
      deleteButton.textContent = "Delete";
      deleteButton.dataset.action = "click->email#delete";
      listItem.appendChild(deleteButton);

      this.listTarget.appendChild(listItem);

      this.inputTarget.value = "";
    } else {
      return
    }

  }

  delete(event) {
    event.preventDefault();
    event.target.closest("li").remove();
  }
}