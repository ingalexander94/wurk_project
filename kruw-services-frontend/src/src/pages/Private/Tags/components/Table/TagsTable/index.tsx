import Empty from "src/components/UI/Empty";
import editIcon from "src/assets/icon/edit.svg";
import styles from "../table.module.css";

const TagsTable = () => {
  return (
    <div className={styles.table}>
      <Empty
        title="¡Aún no tienes tarjetas agregadas!"
        text="En esta pantalla encontrarás todos las tarjetas agregadas. Desde aquí puedes acceder a la información de cada tarjeta y gestionar la información de cada una."
      />
      <>
        <div className={styles.table_head}>
          <ul style={{ gridTemplateColumns: "1fr 1fr 1fr 1fr 1fr 1fr" }}>
            <li>#</li>
            <li>Número</li>
            <li>Código</li>
            <li>Fecha de creación</li>
            <li>Estado</li>
            <li>Acciones</li>
          </ul>
        </div>
        <div className={styles.table_content}>
          <ul style={{ gridTemplateColumns: "1fr 1fr 1fr 1fr 1fr 1fr" }}>
            <li>1</li>
            <li>195253132245</li>
            <li>1151163</li>
            <li>14/12/2024</li>
            <li>PERDIDA</li>
            <li>
              <button className={styles.edit} title="Editar">
                <img src={editIcon} alt="edit icon" />
              </button>
              <button className={styles.disable} title="Desactivar">
                <i className="fas fa-lock"></i>
              </button>
            </li>
          </ul>
        </div>
      </>
    </div>
  );
};

export default TagsTable;
