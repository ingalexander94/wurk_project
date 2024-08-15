import * as Yup from "yup";

export class TagValidatorForm {
  static validatorSchemaTag = Yup.object({
    number: Yup.string()
      .trim()
      .required("* El número de la tarjeta es obligatorio"),
    code: Yup.string()
      .trim()
      .required("* El código de la tarjeta es obligatorio"),
  });
}
