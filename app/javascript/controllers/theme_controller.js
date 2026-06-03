import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "selection" ]

  connect() {
    const saved = localStorage.getItem("theme")
    if (saved) document.body.classList.add(saved)
  }

  selectTheme(event) {
    const theme = event.target.dataset.themeValue
    document.body.classList.remove("dark", "light", "milk", "neon")
    document.body.classList.add(theme)
    localStorage.setItem("theme", theme)
  }

  menu() {
    this.selectionTargets.forEach(element => {
      element.classList.toggle("hidden")
    })
  }
}