import logo from "src/assets/logo.webp";
import kruw from "src/assets/kruw.webp";
import styles from "./responsive.module.css";

const Responsive = () => {
  return (
    <article className={styles.responsive}>
      <img src={logo} alt="logo kruw" />
      <section>
        <img src={kruw} alt="kruw" />
        <h3>La plataforma se ve mejor en versión de escritorio</h3>
        <p>
          Parece que estás intentando acceder desde un dispositivo móvil, y
          nuestra plataforma se siente más cómoda en una pantalla más amplia.{" "}
          <br /> <br />
          Te invitamos a volver desde un computador para aprovechar al máximo
          todas las herramientas y funcionalidades que tenemos preparadas para
          ti. ¡Nos vemos en la versión de escritorio para hacer tu proceso más
          sencillo y eficiente!
        </p>
      </section>
    </article>
  );
};

export default Responsive;
