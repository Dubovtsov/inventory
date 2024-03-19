import { Controller } from "@hotwired/stimulus"
// <%= render "shared/modal", model: @certificate, title: "Изменение сертификата" %>
// Connects to data-controller="modal"
export default class extends Controller {

  hideModal() {
    this.element.parentElement.removeAttribute("src")
    this.element.remove()
  }

  submitEnd() {
    this.hideModal()
  }
}
