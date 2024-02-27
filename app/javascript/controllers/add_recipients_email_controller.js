import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-recipients-email"
export default class extends Controller {
  static targets = ["input", "list"];

  connect() {
    console.log("email controller connected");  
  }

  add(event) {
    // Empecher la soumission
    event.preventDefault();

    // Récupérer la valeur de l'e-mail
    console.log("trying to add email");
    const email = this.inputTarget.value;
    if (!email) {
      return;
    }

    // Créer un nouvel élément de liste pour l'e-mail
    const listItem = document.createElement("li");
    listItem.textContent = email;
  

    // Ajouter un bouton pour supprimer l'e-mail
    const deleteButton = document.createElement("button");
    deleteButton.textContent = "Delete";
    deleteButton.dataset.action = "click->email#delete";
    listItem.appendChild(deleteButton);

    // Ajouter l'e-mail à la liste
    this.listTarget.appendChild(listItem);

    // Effacer le champ de saisie
    this.inputTarget.value = "";
  }

  delete(event) {
    console.log("delete")
    event.preventDefault();
    // Supprimer l'e-mail de la liste
    event.target.closest("li").remove();
  }
}