import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="close-button"
export default class extends Controller {
  static targets = [ "parent" ]
  connect() {
    console.log(this.parentTarget)
  }
  hideEl() {
    console.log(this.parentTarget)
    this.parentTarget.remove()
  }
}
