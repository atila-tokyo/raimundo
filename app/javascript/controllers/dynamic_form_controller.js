import { Controller } from "stimulus";

export default class extends Controller {
    static targets = ["value"]
    connect() {
        console.log(this.valueTarget);
    }
}