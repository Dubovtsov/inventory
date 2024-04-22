import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="close-button"
export default class extends Controller {
  static targets = [ "parent" ]
  connect() {
  }
  hideEl() {
    this.parentTarget.remove()
  }
}
