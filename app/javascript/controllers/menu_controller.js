import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="menu"
export default class extends Controller {
  static targets = [ "button", "menu" ]

  toggle(event) {
    console.log("eboy")
    event.preventDefault()
    let button =  event.currentTarget
    console.log("eboy")
    this.menuTargets.forEach((el) => {
      if(el == button.nextElementSibling) {
        el.classList.toggle("hidden")
      } else {
        el.classList.add("hidden")
      }
    })
  }
}
