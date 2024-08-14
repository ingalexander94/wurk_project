import { useLocation } from "react-router-dom";
import Pagination from "src/components/UI/Pagination";
import Filter from "../components/Filter";
import DevicesTable from "../components/Table/DevicesTable";
import TagsTable from "../components/Table/TagsTable";
import styles from "./layout.module.css";
// import SaveDevice from "../components/Modal/SaveDevice";

const Layout = () => {
  const { search } = useLocation();
  const queryParams = new URLSearchParams(search);
  const optionQuery = queryParams.get("q") || "tarjetas";

  return (
    <>
      <div className={styles.layout}>
        <Filter />
        {optionQuery === "tarjetas" ? <TagsTable /> : <DevicesTable />}
        <div className={styles.pagination}>
          <Pagination pages={1} />
        </div>
      </div>
      {/* <SaveDevice /> */}
    </>
  );
};

export default Layout;
