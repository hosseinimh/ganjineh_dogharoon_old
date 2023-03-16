import { BASE_URL } from "../../constants";
import Entity from "./Entity";

export class Bank extends Entity {
    constructor() {
        super();
    }

    async getPaginate(districtId = 0) {
        return await this.handlePost(`${BASE_URL}/u/banks`, {
            district_id: districtId,
        });
    }

    async getBank(id) {
        return await this.handlePost(`${BASE_URL}/u/banks/show/${id}`);
    }

    async store(name) {
        return await this.handlePost(`${BASE_URL}/a/banks/store`, {
            name: name,
        });
    }

    async update(id, name) {
        return await this.handlePost(`${BASE_URL}/a/banks/update/${id}`, {
            name: name,
        });
    }
}
