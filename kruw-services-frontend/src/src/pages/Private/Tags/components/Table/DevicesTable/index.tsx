import Empty from "src/components/UI/Empty";
import editIcon from "src/assets/icon/edit.svg";
import styles from "../table.module.css";

const DevicesTable = () => {
  return (
    <div className={styles.table}>
      <Empty
        title="¡Aún no tienes dispositivos agregados!"
        text="En esta pantalla encontrarás todos los dispositivos agregados. Desde aquí puedes acceder a la información de cada dispositivo y gestionar la información de cada uno."
      />
      <>
        <div className={styles.table_head}>
          <ul style={{ gridTemplateColumns: "1fr 1fr 1fr 1fr" }}>
            <li>#</li>
            <li>Número</li>
            <li>Código</li>
            <li>Acciones</li>
          </ul>
        </div>
        <div className={styles.table_content}>
          <ul style={{ gridTemplateColumns: "1fr 1fr 1fr 1fr" }}>
            <li>1</li>
            <li>C8:C9:A3:35:E4:EF</li>
            <li>1151163</li>
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

export default DevicesTable;
