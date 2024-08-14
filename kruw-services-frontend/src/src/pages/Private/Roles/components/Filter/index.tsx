import { useState } from "react";
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
        Listado de roles
        <input
          id="search_user"
          name="search_user"
          type="text"
          defaultValue={text}
          autoComplete="off"
          placeholder="Buscar roles"
        />
        <img
          className={text.length ? styles.clean : ""}
          onClick={handleClean}
          src={!text.length ? searchIcon : errorIcon}
          alt="search icon"
        />
      </label>
      <div>
        <button>
          <i className="fas fa-plus-circle fa-lg"></i>Añadir Roles
        </button>
      </div>
    </div>
  );
};

export default Filter;
