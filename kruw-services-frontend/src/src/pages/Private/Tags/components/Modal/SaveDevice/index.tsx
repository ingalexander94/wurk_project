import { useContext, useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { useFormik } from "formik";
import { TagContext } from "src/context";
import useAxios from "src/hooks/useAxios";
import { DeviceService } from "src/services";
import { DeviceValidatorForm } from "src/validators";
import { privateRoutes } from "src/models";
import logo from "src/assets/kruw.webp";
import styles from "../modal.module.css";

const SaveDevice = () => {
  useEffect(() => {
    document.body.style.overflow = "hidden";

    return () => {
      document.body.style.overflow = "scroll";
    };
  }, []);

  const navigate = useNavigate();
  const { tagState, setDeviceActive, toggleRefresh } = useContext(TagContext);
  const [loading, setLoading] = useState<boolean>(false);
  const { callEndpoint } = useAxios();

  const formik = useFormik({
    initialValues: tagState.deviceActive!,
    validationSchema: DeviceValidatorForm.validatorSchemaDevice,
    validateOnMount: true,
    onSubmit: async (values) => {
      if (formik.isValid) {
        setLoading(true);
        const res = await callEndpoint(DeviceService.saveDevice(values));
        if (res) {
          const { data } = res.data;
          if (values.id === 0) {
            navigate(
              `/${privateRoutes.PRIVATE}/${privateRoutes.TAGS}?q=dispositivos&page=${data.last_page}`
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
    setDeviceActive(null);
  };

  return (
    <div className={styles.modal_wrapper}>
      <div className={styles.lightbox} onClick={handleClose}></div>
      <form onSubmit={formik.handleSubmit} autoComplete="off">
        <img src={logo} alt="logo kruw" />
        <h3>
          {tagState.deviceActive!.id === 0 ? "Añadir" : "Editar"} dispositivo
        </h3>
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
            placeholder="Escribe el número del dispositivo"
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
            placeholder="Escribe el código del dispositivo"
          />
          <p>{formik.touched.code && formik.errors.code}</p>
        </div>
        <div className={styles.form_actions}>
          <button className="btn_secondary" type="button" onClick={handleClose}>
            Cancelar
          </button>
          <button type="submit" disabled={!formik.isValid || loading}>
            Guardar {loading && <i className="fas fa-spinner fa-pulse"></i>}
          </button>
        </div>
      </form>
    </div>
  );
};

export default SaveDevice;
