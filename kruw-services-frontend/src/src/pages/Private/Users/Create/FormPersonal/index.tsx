import { privateRoutes } from "src/models";
import Breadcum from "src/components/UI/Breadcum";
import styles from "../create.module.css";
import { useLocation } from "react-router-dom";

const FormPersonal = () => {
  const location = useLocation();

  return (
    <div className={styles.form_personal}>
      <Breadcum
        path={`/${privateRoutes.PRIVATE}/${privateRoutes.USERS}`}
        title="Usuarios"
        subtitle={`Guardar usuario ${
          location.pathname.toLowerCase().includes("wiedii")
            ? "de wiedii"
            : "independiente"
        }`}
      />
    </div>
  );
};

export default FormPersonal;
