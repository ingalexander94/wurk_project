import Pagination from "src/components/UI/Pagination";
import Empty from "src/components/UI/Empty";
import editIcon from "src/assets/icon/edit.svg";
import styles from "./table.module.css";

const Table = () => {
  return (
    <div className={styles.table}>
      <Empty
        title="¡Aún no tienes usuarios agregados!"
        text="En esta pantalla encontrarás todos los usuarios agregados. Desde aquí puedes acceder a la información de cada usuario y gestionar la información de cada uno."
      />
      <>
        <div className={styles.table_head}>
          <ul>
            <li>#</li>
            <li>Documento</li>
            <li>Nombres</li>
            <li>Apellidos</li>
            <li>Correo</li>
            <li>Teléfono</li>
            <li>Tarjeta</li>
            <li>Acciones</li>
          </ul>
        </div>
        <div className={styles.table_content}>
          <ul>
            <li>1</li>
            <li>CC 1090494143</li>
            <li>Luis Alexander</li>
            <li>Peñaloza Romero</li>
            <li title="luisalexanderpr@ufps.edu.co">luis.penaloza@wiedii.co</li>
            <li>3213568479</li>
            <li>ABC123456</li>
            <li>
              <button className={styles.edit} title="Editar">
                <img src={editIcon} alt="edit icon" />
              </button>
              <button className={styles.disable} title="Desactivar">
                <i className="fas fa-lock"></i>
              </button>
            </li>
          </ul>
          <ul>
            <li>1</li>
            <li>CC 1090494143</li>
            <li>Luis Alexander</li>
            <li>Peñaloza Romero</li>
            <li title="luisalexanderpr@ufps.edu.co">luis.penaloza@wiedii.co</li>
            <li>3213568479</li>
            <li>ABC123456</li>
            <li>
              <button className={styles.edit} title="Editar">
                <img src={editIcon} alt="edit icon" />
              </button>
              <button className={styles.disable} title="Desactivar">
                <i className="fas fa-lock"></i>
              </button>
            </li>
          </ul>
          <ul>
            <li>1</li>
            <li>CC 1090494143</li>
            <li>Luis Alexander</li>
            <li>Peñaloza Romero</li>
            <li title="luisalexanderpr@ufps.edu.co">luis.penaloza@wiedii.co</li>
            <li>3213568479</li>
            <li>ABC123456</li>
            <li>
              <button className={styles.edit} title="Editar">
                <img src={editIcon} alt="edit icon" />
              </button>
              <button className={styles.disable} title="Desactivar">
                <i className="fas fa-lock"></i>
                {/* <i className="fas fa-lock-open"></i> */}
              </button>
            </li>
          </ul>
          <ul>
            <li>1</li>
            <li>CC 1090494143</li>
            <li>Luis Alexander</li>
            <li>Peñaloza Romero</li>
            <li title="luisalexanderpr@ufps.edu.co">luis.penaloza@wiedii.co</li>
            <li>3213568479</li>
            <li>ABC123456</li>
            <li>
              <button className={styles.edit} title="Editar">
                <img src={editIcon} alt="edit icon" />
              </button>
              <button className={styles.disable} title="Desactivar">
                <i className="fas fa-lock"></i>
                {/* <i className="fas fa-lock-open"></i> */}
              </button>
            </li>
          </ul>
          <ul>
            <li>1</li>
            <li>CC 1090494143</li>
            <li>Luis Alexander</li>
            <li>Peñaloza Romero</li>
            <li title="luisalexanderpr@ufps.edu.co">luis.penaloza@wiedii.co</li>
            <li>3213568479</li>
            <li>ABC123456</li>
            <li>
              <button className={styles.edit} title="Editar">
                <img src={editIcon} alt="edit icon" />
              </button>
              <button className={styles.disable} title="Desactivar">
                <i className="fas fa-lock"></i>
                {/* <i className="fas fa-lock-open"></i> */}
              </button>
            </li>
          </ul>
          <ul>
            <li>1</li>
            <li>CC 1090494143</li>
            <li>Luis Alexander</li>
            <li>Peñaloza Romero</li>
            <li title="luisalexanderpr@ufps.edu.co">luis.penaloza@wiedii.co</li>
            <li>3213568479</li>
            <li>ABC123456</li>
            <li>
              <button className={styles.edit} title="Editar">
                <img src={editIcon} alt="edit icon" />
              </button>
              <button className={styles.disable} title="Desactivar">
                <i className="fas fa-lock"></i>
                {/* <i className="fas fa-lock-open"></i> */}
              </button>
            </li>
          </ul>
          <ul>
            <li>1</li>
            <li>CC 1090494143</li>
            <li>Luis Alexander</li>
            <li>Peñaloza Romero</li>
            <li title="luisalexanderpr@ufps.edu.co">luis.penaloza@wiedii.co</li>
            <li>3213568479</li>
            <li>ABC123456</li>
            <li>
              <button className={styles.edit} title="Editar">
                <img src={editIcon} alt="edit icon" />
              </button>
              <button className={styles.disable} title="Desactivar">
                <i className="fas fa-lock"></i>
                {/* <i className="fas fa-lock-open"></i> */}
              </button>
            </li>
          </ul>
          <ul>
            <li>1</li>
            <li>CC 1090494143</li>
            <li>Luis Alexander</li>
            <li>Peñaloza Romero</li>
            <li title="luisalexanderpr@ufps.edu.co">luis.penaloza@wiedii.co</li>
            <li>3213568479</li>
            <li>ABC123456</li>
            <li>
              <button className={styles.edit} title="Editar">
                <img src={editIcon} alt="edit icon" />
              </button>
              <button className={styles.disable} title="Desactivar">
                <i className="fas fa-lock"></i>
                {/* <i className="fas fa-lock-open"></i> */}
              </button>
            </li>
          </ul>
        </div>
        <div className={styles.pagination}>
          <Pagination pages={1} />
        </div>
      </>
    </div>
  );
};

export default Table;
