import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content", "input", "list"]

  connect() {
    console.log(this.contentTarget)
    console.log(this.inputTarget)
    console.log(this.listTarget)
  }
}
