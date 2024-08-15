import { useContext, useEffect, useState } from "react";
import { useLocation } from "react-router-dom";
import { TagContext, UIContext } from "src/context";
import Empty from "src/components/UI/Empty";
import useAxios from "src/hooks/useAxios";
import { TagService } from "src/services";
import editIcon from "src/assets/icon/edit.svg";
import styles from "../table.module.css";
import { ITag } from "src/interfaces";

const TagsTable = () => {
  const location = useLocation();
  const [loading, setLoading] = useState<boolean>(true);
  const params = new URLSearchParams(location.search);
  const page = params.get("page") || "1";
  const { tagState, setTags, setTotal, setTotalPages, setTagActive } =
    useContext(TagContext);
  const { callEndpoint } = useAxios();
  const { toggleCheking } = useContext(UIContext);

  useEffect(() => {
    const getTags = async () => {
      toggleCheking();
      setLoading(true);
      const res = await callEndpoint(TagService.getTags(page));
      if (res) {
        const { data } = res.data;
        setTags(data.tags);
        setTotal(data.total);
        setTotalPages(data.total_pages);
      }
      setLoading(false);
      toggleCheking();
    };

    getTags();

    return () => {};
  }, [page, tagState.refresh]);

  const handleOpenEdit = (tag: ITag) => {
    setTagActive(tag);
  };

  return (
    <div className={styles.table}>
      {!tagState.tags.length ? (
        <Empty
          loading={loading}
          title="¡Aún no tienes tarjetas agregadas!"
          text="En esta pantalla encontrarás todos las tarjetas agregadas. Desde aquí puedes acceder a la información de cada tarjeta y gestionar la información de cada una."
        />
      ) : (
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
            {tagState.tags.map((tag) => (
              <ul
                key={tag.id}
                style={{ gridTemplateColumns: "1fr 1fr 1fr 1fr 1fr 1fr" }}
              >
                <li>{tag.id}</li>
                <li>{tag.number}</li>
                <li>{tag.code}</li>
                <li>{tag.date}</li>
                <li>{tag.status}</li>
                <li>
                  <button
                    className={styles.edit}
                    title="Editar"
                    type="button"
                    onClick={() => handleOpenEdit(tag)}
                  >
                    <img src={editIcon} alt="edit icon" />
                  </button>
                  {/* <button className={styles.disable} title="Desactivar">
                    <i className="fas fa-lock"></i>
                  </button> */}
                </li>
              </ul>
            ))}
          </div>
        </>
      )}
    </div>
  );
};

export default TagsTable;
