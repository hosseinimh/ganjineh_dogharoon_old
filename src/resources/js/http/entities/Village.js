import { BASE_URL } from "../../constants";
import utils from "../../utils/Utils";
import Entity from "./Entity";

export class Village extends Entity {
    constructor() {
        super();
    }

    async getPaginate(districtId = 0) {
        return await this.handlePost(`${BASE_URL}/u/villages`, {
            district_id: districtId,
        });
    }

    async getVillage(id) {
        return await this.handlePost(`${BASE_URL}/u/villages/show/${id}`);
    }

    async store(districtId, name) {
        return await this.handlePost(`${BASE_URL}/a/villages/store`, {
            district_id: districtId,
            name: name,
        });
    }

    async update(id, districtId, name) {
        return await this.handlePost(`${BASE_URL}/a/villages/update/${id}`, {
            district_id: districtId,
            name: name,
        });
    }
}
