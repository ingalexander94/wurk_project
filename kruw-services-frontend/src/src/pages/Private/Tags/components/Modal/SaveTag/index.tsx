import { useContext, useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { useFormik } from "formik";
import { TagContext } from "src/context";
import { TagValidatorForm } from "src/validators";
import useAxios from "src/hooks/useAxios";
import { TagService } from "src/services";
import { privateRoutes } from "src/models";
import logo from "src/assets/kruw.webp";
import styles from "../modal.module.css";

const SaveTag = () => {
  useEffect(() => {
    document.body.style.overflow = "hidden";

    return () => {
      document.body.style.overflow = "scroll";
    };
  }, []);

  const { tagState, setTagActive, toggleRefresh } = useContext(TagContext);
  const [loading, setLoading] = useState<boolean>(false);
  const { callEndpoint } = useAxios();
  const navigate = useNavigate();

  const formik = useFormik({
    initialValues: tagState.tagActive!,
    validationSchema: TagValidatorForm.validatorSchemaTag,
    validateOnMount: true,
    onSubmit: async (values) => {
      if (formik.isValid) {
        setLoading(true);
        const res = await callEndpoint(TagService.saveTag(values));
        if (res) {
          const { data } = res.data;
          if (values.id === 0) {
            navigate(
              `/${privateRoutes.PRIVATE}/${privateRoutes.TAGS}?q=tarjetas&page=${data.last_page}`
            );
          }
          toggleRefresh();
          handleClose();
        }
        setLoading(false);
      }
    },
  });

  const handleClose = () => {
    setTagActive(null);
  };

  return (
    <div className={styles.modal_wrapper}>
      <div className={styles.lightbox} onClick={handleClose}></div>
      <form onSubmit={formik.handleSubmit} autoComplete="off">
        <img src={logo} alt="logo kruw" />
        <h3> {!tagState.tagActive ? "Añadir" : "Editar"} tarjeta</h3>
        <p>
          Lorem ipsum dolor sit amet consectetur adipisicing elit. Tenetur
          repellat, officia praesentium explicabo ipsa quo ad laudantium ipsam
          laborum iusto, eum temporibus totam, distinctio velit fugit corrupti
          aperiam id eos.
        </p>
        <div className={styles.form_input}>
          <input
            type="text"
            name="number"
            id="number"
            disabled={loading}
            maxLength={45}
            value={formik.values.number}
            onChange={formik.handleChange}
            onBlur={formik.handleBlur}
            placeholder="Escribe el número de la tarjeta"
          />
          <p>{formik.touched.number && formik.errors.number}</p>
        </div>
        <div className={styles.form_input}>
          <input
            type="text"
            name="code"
            id="code"
            disabled={loading}
            maxLength={10}
            value={formik.values.code}
            onChange={formik.handleChange}
            onBlur={formik.handleBlur}
            placeholder="Escribe el código de la tarjeta"
          />
          <p>{formik.touched.code && formik.errors.code}</p>
        </div>
        {tagState.tagActive!.id > 0 && (
          <div className={styles.form_input}>
            <select
              name="status"
              id="status"
              value={formik.values.status}
              onChange={formik.handleChange}
              onBlur={formik.handleBlur}
            >
              <option value="ACTIVO">ACTIVO</option>
              <option value="INACTIVO">INACTIVO</option>
              <option value="PERDIDA">PERDIDA</option>
              <option value="DAÑADA">DAÑADA</option>
            </select>
          </div>
        )}
        <div className={styles.form_actions}>
          <button className="btn_secondary" type="button" onClick={handleClose}>
            Cancelar
          </button>
          <button type="submit" disabled={!formik.isValid || loading}>
            Guardar
            {loading && <i className="fas fa-spinner fa-pulse"></i>}
          </button>
        </div>
      </form>
    </div>
  );
};

export default SaveTag;
