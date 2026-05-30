import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "selection" ]



  menu() {
    this.selectionTarget.classList.toggle("hidden")
  }
}