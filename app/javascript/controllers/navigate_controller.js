import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navigate"
export default class extends Controller {
  static targets = ["transactionType", "destinationField"]

  connect() {
    this.toggleDestinationField()
  }

  to(e) {
    this.toggleDestinationField()
  }

  toggleDestinationField() {
    const transactionType = this.transactionTypeTarget.value
    if (transactionType === "transfer") {
      this.destinationFieldTarget.style.display = "block"
    } else {
      this.destinationFieldTarget.style.display = "none"
    }
  }
}