import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ["button", "content"]

  toggle() {
    this.contentTarget.classList.toggle("hidden")
  }
  
}