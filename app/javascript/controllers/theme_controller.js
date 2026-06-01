import { Controller } from "@hotwired/stimulus"
import { useClickOutside } from 'stimulus-use'

export default class extends Controller {
  static targets = [ "selection" ]

  connect() {
    useClickOutside(this)
    const saved = localStorage.getItem("theme")
    if (saved) document.body.classList.add(saved)
  }

  clickOutside(event) {
    this.close()
  }

  selectTheme(event) {
    const theme = event.target.dataset.themeValue
    document.body.classList.remove("dark", "light", "milk", "neon")
    document.body.classList.add(theme)
    localStorage.setItem("theme", theme)
  }

  menu() {
    this.selectionTarget.classList.toggle("hidden")
  }

  close() {
    this.selectionTarget.classList.add("hidden")
  }
}