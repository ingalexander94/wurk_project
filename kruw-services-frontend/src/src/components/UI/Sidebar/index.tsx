import { NavLink } from "react-router-dom";
import { modulesAdminRoutes } from "src/models";
import logo from "src/assets/logo.webp";
import styles from "./sidebar.module.css";

const Sidebar = () => {
  return (
    <aside className={styles.sidebar}>
      <img src={logo} alt="logo" />
      <nav className={styles.sidebar__modules}>
        <div>
          <span>Menú</span>
          <ul>
            {modulesAdminRoutes.map((route) => (
              <li key={route.id}>
                <NavLink
                  to={route.path}
                  className={({ isActive }) => (isActive ? styles.active : "")}
                >
                  <img src={route.icon} alt={`Icono de ${route.title}`} />
                  {route.title}
                </NavLink>
              </li>
            ))}
          </ul>
        </div>
      </nav>
    </aside>
  );
};

export default Sidebar;
