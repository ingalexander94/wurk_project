import { useContext } from "react";
import { useLocation } from "react-router-dom";
import { TagContext } from "src/context";
import Pagination from "src/components/UI/Pagination";
import Filter from "../components/Filter";
import SaveDevice from "../components/Modal/SaveDevice";
import SaveTag from "../components/Modal/SaveTag";
import DevicesTable from "../components/Table/DevicesTable";
import TagsTable from "../components/Table/TagsTable";
import styles from "./layout.module.css";

const Layout = () => {
  const { search } = useLocation();
  const queryParams = new URLSearchParams(search);
  const optionQuery = queryParams.get("q") || "tarjetas";
  const { tagState } = useContext(TagContext);

  return (
    <>
      <div className={styles.layout}>
        <Filter />
        {optionQuery === "tarjetas" ? <TagsTable /> : <DevicesTable />}
        {tagState.total_pages > 1 && (
          <div className={styles.pagination}>
            <Pagination pages={tagState.total_pages} />
          </div>
        )}
      </div>
      {tagState.tagActive && <SaveTag />}
      {tagState.deviceActive && <SaveDevice />}
    </>
  );
};

export default Layout;
