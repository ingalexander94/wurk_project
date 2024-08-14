import { useState } from "react";
import { useLocation } from "react-router-dom";
import searchIcon from "src/assets/icon/search.svg";
import errorIcon from "src/assets/icon/error.svg";
import styles from "./filter.module.css";

const Filter = () => {
  const { search } = useLocation();
  const queryParams = new URLSearchParams(search);
  const optionQuery = queryParams.get("q") || "tarjetas";

  const [text, setText] = useState<string>("");

  const handleClean = () => {
    setText("");
  };

  return (
    <div className={styles.filter}>
      <label htmlFor="search_user">
        Listado de {optionQuery} - Total: 1
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
        <button>
          <i className="fas fa-plus-circle fa-lg"></i>Añadir {optionQuery}
        </button>
        <button className="btn_secondary">Descargar .xlsx</button>
      </div>
    </div>
  );
};

export default Filter;
