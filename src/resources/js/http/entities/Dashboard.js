import { BASE_URL } from "../../constants";
import Entity from "./Entity";

export class Dashboard extends Entity {
    constructor() {
        super();
    }

    async getReviewFromUser() {
        return await this.handlePost(`${BASE_URL}/u/dashboard/review`);
    }

    async getReview() {
        return await this.handlePost(`${BASE_URL}/a/dashboard/review`);
    }
}
