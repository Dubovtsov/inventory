import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["m", "buttonText"]

  connect() {
    if (window.location.search.includes('?client_id')) {
      this.restoreButtonText();
    }
    document.addEventListener("click", this.outsideClick.bind(this));
  }

  disconnect() {
    document.removeEventListener("click", this.outsideClick.bind(this));
  }

  updateButtonText(event) {
    let filterName = event.target.innerText;
    this.buttonTextTarget.innerText = filterName;
    localStorage.setItem("selectedFilter", filterName); // Сохранение выбранного фильтра
  }

  restoreButtonText() {
    const savedFilter = localStorage.getItem("selectedFilter");
    if (savedFilter) {
      this.buttonTextTarget.innerText = savedFilter;
    }
  }

  outsideClick(event) {
    if (!this.element.contains(event.target)) { // Проверка, что клик был вне элемента
      this.mTarget.classList.add("hidden")
    }
  }

  toggle() {
    this.mTarget.classList.toggle("hidden")
  }
}