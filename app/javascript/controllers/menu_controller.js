import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="menu"
export default class extends Controller {
  static targets = [ "list" ]

  connect() {
    console.log("Menu controller loaded", this.element)
  }

  toggle() {
    let hiddenClass = "hidden"
    this.listTarget.classList.toggle(hiddenClass);
  }
}
