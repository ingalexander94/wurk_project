import Pagination from "src/components/UI/Pagination";
import Empty from "src/components/UI/Empty";
import editIcon from "src/assets/icon/edit.svg";
import deleteIcon from "src/assets/icon/delete.svg";
import styles from "./table.module.css";

const Table = () => {
  return (
    <div className={styles.table}>
      <Empty
        title="¡Aún no tienes roles agregados!"
        text="En esta pantalla encontrarás todos los roles agregados. Desde aquí puedes acceder a la información de cada rol asignado y gestionar la información de cada uno de los roles."
      />
      <>
        <div className={styles.table_head}>
          <ul>
            <li>Id</li>
            <li>Nombre del rol</li>
            <li>Descripción</li>
            <li>Acciones</li>
          </ul>
        </div>
        <div className={styles.table_content}>
          <ul>
            <li>1</li>
            <li>Wieder</li>
            <li>Colaborador wiedii</li>
            <li>
              <button className={styles.edit} title="Editar">
                <img src={editIcon} alt="edit icon" />
              </button>
              <button className={styles.disable} title="Desactivar">
                <img src={deleteIcon} alt="edit icon" />
              </button>
            </li>
          </ul>
          <ul>
            <li>1</li>
            <li>Independiente</li>
            <li>Usuario independiente para el edificio</li>
            <li>
              <button className={styles.edit} title="Editar">
                <img src={editIcon} alt="edit icon" />
              </button>
              <button className={styles.disable} title="Desactivar">
                <img src={deleteIcon} alt="edit icon" />
              </button>
            </li>
          </ul>
          <ul>
            <li>1</li>
            <li>Visitante</li>
            <li>Visitante del edifición para reunión</li>
            <li>
              <button className={styles.edit} title="Editar">
                <img src={editIcon} alt="edit icon" />
              </button>
              <button className={styles.disable} title="Desactivar">
                <img src={deleteIcon} alt="edit icon" />
              </button>
            </li>
          </ul>
          <ul>
            <li>1</li>
            <li>Visitante</li>
            <li>Visitante del edifición para reunión</li>
            <li>
              <button className={styles.edit} title="Editar">
                <img src={editIcon} alt="edit icon" />
              </button>
              <button className={styles.disable} title="Desactivar">
                <img src={deleteIcon} alt="edit icon" />
              </button>
            </li>
          </ul>
          <ul>
            <li>1</li>
            <li>Visitante</li>
            <li>Visitante del edifición para reunión</li>
            <li>
              <button className={styles.edit} title="Editar">
                <img src={editIcon} alt="edit icon" />
              </button>
              <button className={styles.disable} title="Desactivar">
                <img src={deleteIcon} alt="edit icon" />
              </button>
            </li>
          </ul>
          <ul>
            <li>1</li>
            <li>Visitante</li>
            <li>Visitante del edifición para reunión</li>
            <li>
              <button className={styles.edit} title="Editar">
                <img src={editIcon} alt="edit icon" />
              </button>
              <button className={styles.disable} title="Desactivar">
                <img src={deleteIcon} alt="edit icon" />
              </button>
            </li>
          </ul>
          <ul>
            <li>1</li>
            <li>Visitante</li>
            <li>Visitante del edifición para reunión</li>
            <li>
              <button className={styles.edit} title="Editar">
                <img src={editIcon} alt="edit icon" />
              </button>
              <button className={styles.disable} title="Desactivar">
                <img src={deleteIcon} alt="edit icon" />
              </button>
            </li>
          </ul>
          <ul>
            <li>1</li>
            <li>Visitante</li>
            <li>Visitante del edifición para reunión</li>
            <li>
              <button className={styles.edit} title="Editar">
                <img src={editIcon} alt="edit icon" />
              </button>
              <button className={styles.disable} title="Desactivar">
                <img src={deleteIcon} alt="edit icon" />
              </button>
            </li>
          </ul>
          <ul>
            <li>1</li>
            <li>Visitante</li>
            <li>Visitante del edifición para reunión</li>
            <li>
              <button className={styles.edit} title="Editar">
                <img src={editIcon} alt="edit icon" />
              </button>
              <button className={styles.disable} title="Desactivar">
                <img src={deleteIcon} alt="edit icon" />
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
