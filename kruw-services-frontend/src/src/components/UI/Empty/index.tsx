import styles from "./empty.module.css";

type Props = {
  title: string;
  text: string;
};

const Empty = ({ title, text }: Props) => {
  return (
    <div className={styles.empty}>
      <div>
        <h4>{title}</h4>
        <p>{text}</p>
      </div>
    </div>
  );
};

export default Empty;
