import * as Yup from "yup";

export class DeviceValidatorForm {
  static validatorSchemaDevice = Yup.object({
    number: Yup.string()
      .trim()
      .required("* El número del dispositivo es obligatorio"),
    code: Yup.string()
      .trim()
      .required("* El código del dispositivo es obligatorio"),
  });
}
