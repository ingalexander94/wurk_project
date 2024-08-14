import { privateRoutes } from "src/models";
import Breadcum from "src/components/UI/Breadcum";
import styles from "../create.module.css";

const FormCompany = () => {
  return (
    <div className={styles.form_company}>
      <Breadcum
        path={`/${privateRoutes.PRIVATE}/${privateRoutes.USERS}`}
        title="Usuarios"
        subtitle="Guardar usuario de empresa"
      />
    </div>
  );
};

export default FormCompany;
