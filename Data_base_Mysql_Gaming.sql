CREATE DATABASE ubisoft;

use ubisoft;

CREATE TABLE add_users(
    id_users int PRIMARY KEY AUTO_INCREMENT,
    name_and_surname varchar(150) not null,
    correo varchar(50) not null,
    contrasena varchar(50),
    fecha_nacimiento datetime not null
);
CREATE TABLE emvio(
    id_emvio int PRIMARY KEY AUTO_INCREMENT,
    id_users int,
    codigo_postal int not null,
    calle varchar(100) not null,
    numero_telefonico varchar(12),
    FOREIGN KEY (id_users) REFERENCES add_users (id_users)
);

create table historial_users(
    id_historial_users int PRIMARY KEY AUTO_INCREMENT,
    id_users int,
    id_emvio int,
    FOREIGN KEY (id_users) REFERENCES add_users(id_users),
    FOREIGN KEY (id_emvio) REFERENCES emvio (id_emvio)
);

CREATE TABLE categorias(
    id_categoria int PRIMARY KEY AUTO_INCREMENT,
    categoria varchar(50) not null,
    descripcion varchar(50) not null
);
CREATE TABLE productos(
    id_productos int PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(100) not null unique,
    descripcion text not null,
    id_categoria int, 
    fecha_registro datetime not null,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);
CREATE TABLE precios(
    id_precios int PRIMARY KEY AUTO_INCREMENT,
    id_productos int,
    costo_compra float not null,
    costo_venta float not null,
    FOREIGN KEY (id_productos) REFERENCES productos(id_productos)
);
CREATE TABLE historial_venta(
    id_historial_venta int PRIMARY KEY AUTO_INCREMENT,
    id_precios int,
    id_historial_users int,
    FOREIGN KEY (id_precios) REFERENCES precios(id_precios),
    FOREIGN KEY (id_historial_users) REFERENCES historial_users(id_historial_users)
);
CREATE TABLE ofertas(
    id_ofertas int PRIMARY KEY AUTO_INCREMENT,
    descuento float not null,
    descripcion varchar(100),
    id_productos int,
    FOREIGN KEY (id_productos) REFERENCES productos(id_productos)
);