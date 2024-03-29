import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "button", "actions" ]

  toggle(event) {
    event.preventDefault()
    let button =  event.currentTarget
    this.actionsTargets.forEach((el) => {
      if(el == button.nextElementSibling) {
        el.classList.toggle("-translate-x-0")
        el.classList.toggle("-translate-x-full")
        el.classList.toggle("hidden")
      } else {
        el.classList.add("-translate-x-full")
      }
    })
  }
}
