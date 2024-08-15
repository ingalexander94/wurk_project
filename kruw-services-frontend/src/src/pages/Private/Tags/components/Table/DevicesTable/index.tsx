import { useContext, useEffect, useState } from "react";
import { useLocation } from "react-router-dom";
import Empty from "src/components/UI/Empty";
import { TagContext, UIContext } from "src/context";
import useAxios from "src/hooks/useAxios";
import { DeviceService } from "src/services";
import editIcon from "src/assets/icon/edit.svg";
import styles from "../table.module.css";
import { IDevice } from "src/interfaces";

const DevicesTable = () => {
  const location = useLocation();
  const [loading, setLoading] = useState<boolean>(true);
  const params = new URLSearchParams(location.search);
  const page = params.get("page") || "1";
  const { tagState, setDevices, setTotal, setTotalPages, setDeviceActive } =
    useContext(TagContext);
  const { callEndpoint } = useAxios();
  const { toggleCheking } = useContext(UIContext);

  useEffect(() => {
    const getTags = async () => {
      toggleCheking();
      setLoading(true);
      const res = await callEndpoint(DeviceService.getDevices(page));
      if (res) {
        const { data } = res.data;
        setDevices(data.devices);
        setTotal(data.total);
        setTotalPages(data.total_pages);
      }
      setLoading(false);
      toggleCheking();
    };

    getTags();

    return () => {};
  }, [page, tagState.refresh]);

  const handleOpenEdit = (device: IDevice) => {
    setDeviceActive(device);
  };

  return (
    <div className={styles.table}>
      {!tagState.devices.length ? (
        <Empty
          loading={loading}
          title="¡Aún no tienes dispositivos agregados!"
          text="En esta pantalla encontrarás todos los dispositivos agregados. Desde aquí puedes acceder a la información de cada dispositivo y gestionar la información de cada uno."
        />
      ) : (
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
            {tagState.devices.map((device) => (
              <ul
                key={device.id}
                style={{ gridTemplateColumns: "1fr 1fr 1fr 1fr" }}
              >
                <li>{device.id}</li>
                <li>{device.number}</li>
                <li>{device.code}</li>
                <li>
                  <button
                    className={styles.edit}
                    title="Editar"
                    type="button"
                    onClick={() => handleOpenEdit(device)}
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

export default DevicesTable;
