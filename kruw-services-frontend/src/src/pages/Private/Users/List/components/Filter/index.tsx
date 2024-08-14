import { useState } from "react";
import { Link } from "react-router-dom";
import { privateRoutes, userRoutes } from "src/models";
import searchIcon from "src/assets/icon/search.svg";
import errorIcon from "src/assets/icon/error.svg";
import styles from "./filter.module.css";

const Filter = () => {
  const [text, setText] = useState<string>("");

  const handleClean = () => {
    setText("");
  };

  return (
    <div className={styles.filter}>
      <label htmlFor="search_user">
        Listado de personal - Total: 8
        <input
          id="search_user"
          name="search_user"
          type="text"
          defaultValue={text}
          autoComplete="off"
          placeholder="Buscar..."
        />
        <img
          className={text.length ? styles.clean : ""}
          onClick={handleClean}
          src={!text.length ? searchIcon : errorIcon}
          alt="search icon"
        />
      </label>
      <div className={styles.filter_actions}>
        <label htmlFor="add_user">
          <i className="fas fa-plus-circle fa-lg"></i>Añadir usuario
          <input type="checkbox" name="add_user" id="add_user" />
          <ul>
            <li>
              <Link
                to={`/${privateRoutes.PRIVATE}/${privateRoutes.USERS}/${userRoutes.SAVE_WIEDER}`}
              >
                Wiedii
              </Link>
            </li>
            <li>
              <Link
                to={`/${privateRoutes.PRIVATE}/${privateRoutes.USERS}/${userRoutes.SAVE_COMPANY}`}
              >
                Externos
              </Link>
            </li>
          </ul>
        </label>
        <button className="btn_secondary">Descargar .xlsx</button>
      </div>
    </div>
  );
};

export default Filter;
