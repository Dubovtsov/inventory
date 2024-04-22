import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["bat", "content"]

  connect() {
    const activeTab = localStorage.getItem('activeTab');
    if (activeTab) {
      this.batTargets[activeTab].click();
    } else {
      this.batTargets[0].classList.add("bg-gray-200")
      this.contentTargets[0].style.display = "block"
    }
  }

  showTab(event) {
    event.preventDefault()
    const index = this.batTargets.indexOf(event.currentTarget);
    this.batTargets.forEach((bat, i) => {
      bat.classList.toggle("bg-gray-200", i === index);
      this.contentTargets[i].style.display = i === index ? "block" : "none";
      if (i === index) {
        localStorage.setItem('activeTab', index.toString());
      }
    })
  }
}
