import * as yup from "yup";
import {
    validation,
    addVillagePage as strings,
} from "../../../constants/strings";

const addVillageSchema = yup.object().shape({
    district: yup
        .number()
        .typeError(
            validation.requiredMessage.replace(":field", strings.district)
        )
        .required(
            validation.requiredMessage.replace(":field", strings.district)
        ),
    name: yup
        .string(validation.stringMessage.replace(":field", strings.name))
        .min(
            3,
            validation.minMessage
                .replace(":field", strings.name)
                .replace(":min", "2")
        )
        .max(
            50,
            validation.maxMessage
                .replace(":field", strings.name)
                .replace(":max", "50")
        )
        .required(validation.requiredMessage.replace(":field", strings.name)),
});

export default addVillageSchema;
