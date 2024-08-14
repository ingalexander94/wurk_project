import { useEffect } from "react";
import logo from "src/assets/kruw.webp";
import styles from "../modal.module.css";

const SaveTag = () => {
  useEffect(() => {
    document.body.style.overflow = "hidden";

    return () => {
      document.body.style.overflow = "scroll";
    };
  }, []);

  return (
    <div className={styles.modal_wrapper}>
      <div className={styles.lightbox}></div>
      <form>
        <img src={logo} alt="logo kruw" />
        <h3>Titulo</h3>
        <p>
          Lorem ipsum dolor sit amet consectetur adipisicing elit. Tenetur
          repellat, officia praesentium explicabo ipsa quo ad laudantium ipsam
          laborum iusto, eum temporibus totam, distinctio velit fugit corrupti
          aperiam id eos.
        </p>
        <div className={styles.form_input}>
          <input type="text" placeholder="texto" />
          <p>* Error</p>
        </div>
        <div className={styles.form_input}>
          <input type="text" placeholder="texto" />
          <p>* Error</p>
        </div>
        <div className={styles.form_actions}>
          <button className="btn_secondary" type="button">
            Cancelar
          </button>
          <button type="submit">Guardar</button>
        </div>
      </form>
    </div>
  );
};

export default SaveTag;
