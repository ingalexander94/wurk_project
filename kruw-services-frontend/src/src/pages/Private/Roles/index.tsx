import { RolesProvider } from "src/context/roles";
import Filter from "./components/Filter";
import Table from "./components/Table";
import styles from "./roles.module.css";

const Roles = () => {
  return (
    <RolesProvider>
      <div className={styles.roles_wrapper}>
        <Filter />
        <Table />
      </div>
    </RolesProvider>
  );
};

export default Roles;
