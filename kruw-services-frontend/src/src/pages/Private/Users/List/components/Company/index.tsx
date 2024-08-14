import { useContext, useEffect, useRef } from "react";
import { Link, useLocation } from "react-router-dom";
import { privateRoutes } from "src/models";
import { UserContext } from "src/context";
import useAxios from "src/hooks/useAxios";
import { UserService } from "src/services";
import styles from "./company.module.css";

const Company = () => {
  const companyRef = useRef<HTMLUListElement>(null);
  const isInitialized = useRef<boolean>(false);
  const { callEndpoint } = useAxios();
  const { search } = useLocation();
  const queryParams = new URLSearchParams(search);
  const companyQuery = queryParams.get("company") || "Wiedii";

  const {
    userState: { companies },
    setCompanies,
  } = useContext(UserContext);

  useEffect(() => {
    if (!isInitialized.current) {
      isInitialized.current = true;
      const getCompanies = async () => {
        const res = await callEndpoint(UserService.getCompanies());
        if (res) {
          const { data } = res.data;
          setCompanies(data);
        }
      };
      getCompanies();
    }
    return () => {};
  }, []);

  return (
    <section className={styles.company}>
      <div className={styles.company_filter}>
        <p>Selecciona la empresa</p>
        <div className={styles.grid_columns_v3}>
          <ul ref={companyRef}>
            {companies.map((company) => (
              <li
                className={company.name === companyQuery ? styles.active : ""}
                key={company.id}
              >
                <Link
                  to={`/${privateRoutes.PRIVATE}/${privateRoutes.USERS}?company=${company.name}`}
                >
                  {company.name}
                </Link>
              </li>
            ))}
          </ul>
        </div>
      </div>
    </section>
  );
};

export default Company;
