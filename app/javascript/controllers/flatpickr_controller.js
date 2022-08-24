import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";
// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = ["rentStartDate", "rentEndDate"]

  connect() {
    console.log(this.rentStartDateTarget);
    flatpickr(this.rentStartDateTarget, {
      mode: 'range',
      minDate: "today",
      dateFormat: "Y-m-d",
      "plugins": [new rangePlugin({ input: this.rentEndDateTarget})]
    })
  }

}
