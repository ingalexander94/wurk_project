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

ALTER TABLE device
ADD COLUMN code_device VARCHAR(10) DEFAULT NULL;

UPDATE device SET code_device = "D-0001" WHERE id_device = 1;
UPDATE device SET code_device = "D-0002" WHERE id_device = 2;

ALTER TABLE device
ADD COLUMN state_device BIT DEFAULT 1 NOT NULL COMMENT "0: Inactivo, 1: Activo";

ALTER TABLE tag
ADD COLUMN tag_status VARCHAR(20) DEFAULT "INACTIVO" NOT NULL;

ALTER TABLE tag
ADD COLUMN tag_date_creation TIMESTAMP DEFAULT NOW();

ALTER TABLE tag
ADD COLUMN tag_date_status TIMESTAMP DEFAULT NOW();

ALTER TABLE tag
ADD COLUMN tag_state BIT DEFAULT 1 NOT NULL COMMENT "0: Inactivo, 1: Activo";

UPDATE tag SET tag_status = "ACTIVO" WHERE id_tag = 1;
UPDATE tag SET tag_status = "ACTIVO" WHERE id_tag = 2;