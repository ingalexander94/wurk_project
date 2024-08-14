ALTER TABLE user
ADD COLUMN code VARCHAR(6) DEFAULT NULL;

ALTER TABLE profile
ADD COLUMN profile_description VARCHAR(100) DEFAULT NULL;

ALTER TABLE profile
ADD COLUMN profile_state BIT DEFAULT 1 NOT NULL COMMENT "0: Inactivo, 1: Activo";

ALTER TABLE profile
CHANGE description profile_name VARCHAR(100) NOT NULL;

CREATE TABLE IF NOT EXISTS modules (
    id_module INT AUTO_INCREMENT PRIMARY KEY,
    module_name VARCHAR(100) NOT NULL,
    module_state BIT DEFAULT 1 NOT NULL COMMENT "0: Inactivo, 1: Activo"
);

INSERT INTO modules (module_name) VALUES ("Usuarios"), ("Roles y permisos"), ("Tarjetas y dispositivos"), ("Control de accesos"), ("Registros");

CREATE TABLE IF NOT EXISTS permissions (
    id_permission INT AUTO_INCREMENT PRIMARY KEY,
    profile INT NOT NULL,
    module INT NOT NULL,
    FOREIGN KEY (profile) REFERENCES profile(id_profile) ON DELETE CASCADE,
    FOREIGN KEY (module) REFERENCES modules(id_module) ON DELETE CASCADE
);