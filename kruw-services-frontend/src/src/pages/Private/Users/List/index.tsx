import MenuFilter from "src/components/UI/MenuFilter";
import { Menu } from "src/interfaces";
import Filter from "./components/Filter";
import Table from "./components/Table";
import styles from "./list.module.css";
import { privateRoutes } from "src/models";

const menu: Menu[] = [
  {
    id: 1,
    name: "Wiedii",
    path: `/${privateRoutes.PRIVATE}/${privateRoutes.USERS}?q=wiedii`,
  },
  {
    id: 2,
    name: "Externos",
    path: `/${privateRoutes.PRIVATE}/${privateRoutes.USERS}?q=externos`,
  },
];

const List = () => {
  return (
    <div className={styles.user}>
      <MenuFilter menu={menu} />
      <div className={styles.user_wrapper}>
        <Filter />
        <Table />
      </div>
    </div>
  );
};

export default List;
