import { lazy, Suspense } from "react";
import { Navigate, Route } from "react-router-dom";
import { privateRoutes } from "src/models";
import RoutesWithNotFound from "src/components/RoutesWithNotFound";
import Loading from "src/components/UI/Loading";
import Sidebar from "src/components/UI/Sidebar";
import Header from "src/components/UI/Header";
import styles from "./private.module.css";

const Private = () => {
  const Users = lazy(() => import("src/pages/Private/Users"));
  const Tags = lazy(() => import("src/pages/Private/Tags"));
  const Access = lazy(() => import("src/pages/Private/Access"));
  const Roles = lazy(() => import("src/pages/Private/Roles"));
  const Registers = lazy(() => import("src/pages/Private/Registers"));

  return (
    <Suspense fallback={<Loading />}>
      <Sidebar />
      <Header />
      <div className={styles.wrapper__private}>
        <RoutesWithNotFound validateAuth={false}>
          <Route path="/" element={<Navigate to={privateRoutes.USERS} />} />
          <Route path={`${privateRoutes.USERS}/*`} element={<Users />} />
          <Route path={privateRoutes.ROLES} element={<Roles />} />
          <Route path={privateRoutes.TAGS} element={<Tags />} />
          <Route path={privateRoutes.CONTROL} element={<Access />} />
          <Route path={privateRoutes.REGISTERS} element={<Registers />} />
        </RoutesWithNotFound>
      </div>
    </Suspense>
  );
};

export default Private;
