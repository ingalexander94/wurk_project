import { RouteUI } from "src/interfaces";
import userIcon from "src/assets/icon/user.svg";
import registersIcon from "src/assets/icon/register.svg";
import tagIcon from "src/assets/icon/tag.svg";
import controlIcon from "src/assets/icon/control.svg";
import rolesIcon from "src/assets/icon/roles.svg";

export const publicRoutes = {
  LOGIN: "iniciar-sesion",
  RECOVERY: "recuperar-clave",
  FORGOT: "cambiar-clave",
  NOT_FOUND: "404",
};

export const privateRoutes = {
  PRIVATE: "administrador",
  USERS: "usuarios",
  ROLES: "roles-y-permisos",
  TAGS: "tarjetas-y-dispositivos",
  REGISTERS: "registros",
  CONTROL: "control-de-accesos",
};

export const userRoutes = {
  SAVE_COMPANY: "guardar-usuario-de-empresa",
  SAVE_WIEDER: "guardar-usuario-de-wiedii",
  SAVE_INDEPENDENT: "guardar-usuario-independiente",
};

export const modulesAdminRoutes: RouteUI[] = [
  {
    id: 1,
    path: `/${privateRoutes.PRIVATE}/${privateRoutes.USERS}`,
    icon: userIcon,
    title: "Usuarios",
  },
  {
    id: 2,
    path: `/${privateRoutes.PRIVATE}/${privateRoutes.ROLES}`,
    icon: rolesIcon,
    title: "Roles y permisos",
  },
  {
    id: 3,
    path: `/${privateRoutes.PRIVATE}/${privateRoutes.TAGS}`,
    icon: tagIcon,
    title: "Tarjetas y dispositivos",
  },
  {
    id: 4,
    path: `/${privateRoutes.PRIVATE}/${privateRoutes.CONTROL}`,
    icon: controlIcon,
    title: "Control de accesos",
  },
  {
    id: 5,
    path: `/${privateRoutes.PRIVATE}/${privateRoutes.REGISTERS}`,
    icon: registersIcon,
    title: "Registros",
  },
];

export const getRouteTitle = (search: string): string => {
  const route =
    modulesAdminRoutes.find(({ path }) => search.includes(path))?.title ??
    "Kruw";
  return route;
};
