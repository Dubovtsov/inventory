import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="menu"
export default class extends Controller {
  static targets = [ "button", "menu" ]

  toggle(event) {
    event.preventDefault()
    let button =  event.currentTarget
    this.menuTargets.forEach((el) => {
      if(el == button.nextElementSibling) {
        el.classList.toggle("-translate-x-0")
        el.classList.toggle("-translate-x-full")
      } else {
        el.classList.add("-translate-x-full")
      }
    })
  }
}
