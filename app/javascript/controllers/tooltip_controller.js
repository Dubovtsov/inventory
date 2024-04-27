import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["tooltip"]

  connect() {
    this.tooltipTarget.title = this.element.dataset.tooltipTitle
  }

  show() {
    this.tooltipTarget.classList.remove("invisible")
    this.tooltipTarget.classList.remove("opacity-0")
  }

  hide() {
    this.tooltipTarget.classList.add("invisible")
    this.tooltipTarget.classList.add("opacity-0")
  }
}