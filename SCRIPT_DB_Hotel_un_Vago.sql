CREATE SCHEMA IF NOT EXISTS Hotel_un_Vago;

USE Hotel_un_Vago;



-- Tabla Usuario
CREATE TABLE Usuario

(

idUsuario INT NOT NULL AUTO_INCREMENT,

Nombre VARCHAR(45) NOT NULL,

Apellido VARCHAR(45) NOT NULL,

Correo VARCHAR(45) NOT NULL,

Nickname VARCHAR(20) NOT NULL,

Contrasena VARCHAR(20) NOT NULL,

Rol ENUM('Admin', 'Cliente') NOT NULL DEFAULT 'Cliente',

PRIMARY KEY (idUsuario)

);



INSERT INTO Usuario(Nombre, Apellido, Correo, Nickname, Contrasena, Rol) 
VALUES ('Brayn', 'Avila', 'braynavilah@gmail.com', 'Brayn', '123456', 1);


INSERT INTO Usuario(Nombre, Apellido, Correo, Nickname, Contrasena, Rol) 
VALUES ('Sergio', 'Montealegre', 'serlegre@gmail.com', 'Sermonte', 'qwerty', 2);


INSERT INTO Usuario(Nombre, Apellido, Correo, Nickname, Contrasena, Rol) 
VALUES ('Cristian', 'Espitia', 'cristianespitia2506@gmail.com', 'CrisEs2506', 'cris2506', 1);


INSERT INTO Usuario(Nombre, Apellido, Correo, Nickname, Contrasena, Rol) 
VALUES ('David', 'Peña', 'penalu@gmail.com', 'Penalu', 'asdfg', 2);



SELECT * FROM Usuario;



-- Tabla Hotel

CREATE TABLE Hotel

(
  
idHotel INT NOT NULL,

NombreHotel VARCHAR(45) NOT NULL,

Ciudad VARCHAR(45) NOT NULL,

Direccion VARCHAR(45) NOT NULL,

Correo VARCHAR(45) NOT NULL,

Telefono VARCHAR(45) NOT NULL,

Descripcion VARCHAR(200) NOT NULL,

PRIMARY KEY (idHotel)

);



INSERT INTO Hotel(idHotel, NombreHotel, Ciudad, Direccion, Correo, Telefono, Descripcion) 
VALUES (1, 'Hotel Cartagena', 'Cartagena', 'Avenida 17C - 25', 'hotelcartagena@unvago.com', '6732564', 'Aquí hay hospedaje en Cartagena');


INSERT INTO Hotel(idHotel, NombreHotel, Ciudad, Direccion, Correo, Telefono, Descripcion) 
VALUES (2, 'Hotel Santa Marta', 'Santa Marta', 'Carrera 25A - 36', 'hotelsantamarta@unvago.com', '3238754', 'Aquí hay hospedaje en Santa Marta, Sigan Sigan!');



SELECT * FROM Hotel;



-- Tabla Habitacion

CREATE TABLE Habitacion

(
  
idHabitacion INT NOT NULL,

NumeroHabitacion INT NOT NULL,

NumeroPersonas INT NOT NULL,

TipoHabitacion VARCHAR(45) NOT NULL,

Descripcion VARCHAR(200) NOT NULL,

Valor INT NOT NULL,

idHotel_FK INT NOT NULL,

PRIMARY KEY (idHabitacion),

FOREIGN KEY (idHotel_FK) REFERENCES Hotel (idHotel)

);



INSERT INTO Habitacion(idHabitacion, NumeroHabitacion, NumeroPersonas, TipoHabitacion, Descripcion, Valor, idHotel_FK)
VALUES (1001, 1, 2, 'Doble', 'Camas muy Cómodas', 100000, 1);


INSERT INTO Habitacion(idHabitacion, NumeroHabitacion, NumeroPersonas, TipoHabitacion, Descripcion, Valor, idHotel_FK)
VALUES (1002, 2, 1, 'Sencilla', 'Camas muy Cómodas', 65000, 1);


INSERT INTO Habitacion(idHabitacion, NumeroHabitacion, NumeroPersonas, TipoHabitacion, Descripcion, Valor, idHotel_FK)
VALUES (2001, 2, 2, 'Doble', 'Vista al Mar', 80000, 2);


INSERT INTO Habitacion(idHabitacion, NumeroHabitacion, NumeroPersonas, TipoHabitacion, Descripcion, Valor, idHotel_FK)
VALUES (2002, 2, 1, 'Sencilla', 'Vista al Mar', 50000, 2);



SELECT * FROM Habitacion;
-- Tabla Reserva

CREATE TABLE Reserva

(

idReserva INT NOT NULL AUTO_INCREMENT,

CheckIn DATE NOT NULL,

CheckOut DATE NOT NULL,

idHabitacion_FK INT NOT NULL,

idUsuario_FK INT NOT NULL,

Total INT NOT NULL,

PRIMARY KEY (idReserva),

FOREIGN KEY (idHabitacion_FK) REFERENCES Habitacion (idHabitacion),

FOREIGN KEY (idUsuario_FK) REFERENCES Usuario (idUsuario)

);

INSERT Reserva(CheckIn, CheckOut, idHabitacion_FK, idUsuario_FK)
VALUES ('2021-10-15', '2021-10-18', 1001, 2);


INSERT Reserva(CheckIn, CheckOut, idHabitacion_FK, idUsuario_FK)
VALUES ('2021-10-28', '2021-10-31', 2002, 4);



SELECT * FROM Reserva;





