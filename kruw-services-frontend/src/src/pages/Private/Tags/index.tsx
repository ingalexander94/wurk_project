import MenuFilter from "src/components/UI/MenuFilter";
import { Menu } from "src/interfaces";
import { privateRoutes } from "src/models";
import Layout from "./Layout";
import styles from "./tags.module.css";

const menu: Menu[] = [
  {
    id: 1,
    name: "Tarjetas",
    path: `/${privateRoutes.PRIVATE}/${privateRoutes.TAGS}?q=tarjetas`,
  },
  {
    id: 2,
    name: "Dispositivos",
    path: `/${privateRoutes.PRIVATE}/${privateRoutes.TAGS}?q=dispositivos`,
  },
];

const Tags = () => {
  return (
    <div className={styles.tags}>
      <MenuFilter menu={menu} />
      <Layout />
    </div>
  );
};

export default Tags;
