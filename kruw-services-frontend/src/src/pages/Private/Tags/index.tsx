import MenuFilter from "src/components/UI/MenuFilter";
import { Menu } from "src/interfaces";
import { privateRoutes } from "src/models";
import Layout from "./Layout";
import { TagProvider } from "src/context";
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
    <TagProvider>
      <div className={styles.tags}>
        <MenuFilter menu={menu} />
        <Layout />
      </div>
    </TagProvider>
  );
};

export default Tags;
