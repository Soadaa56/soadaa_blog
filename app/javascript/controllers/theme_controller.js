import { Controller } from "@hotwired/stimulus"
import { useClickOutside } from 'stimulus-use'

export default class extends Controller {
  static targets = [ "selection" ]

  connect() {
    useClickOutside(this)
    const saved = localStorage.getItem("theme")
    
    if (saved) {
      document.body.classList.add(saved)
    } else {
      document.body.classList.add("dark")
    }
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
    this.selectionTargets.forEach(element => {
      element.classList.toggle("hidden")
    })
  }

  close() {
    this.selectionTargets.forEach(element => {
      element.classList.toggle("hidden")
    })
  }
}