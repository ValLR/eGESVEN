-- Generado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   en:        2026-06-29 01:26:09 CLT
--   sitio:      Oracle Database 21c
--   tipo:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE Administrador 
    ( 
     idAdministrador INTEGER  NOT NULL , 
     nivelAcceso     VARCHAR2 (50 CHAR)  NOT NULL 
    ) 
;

ALTER TABLE Administrador 
    ADD CONSTRAINT Administrador_PK PRIMARY KEY ( idAdministrador ) ;

CREATE TABLE CarritoCompras 
    ( 
     idCarrito         INTEGER  NOT NULL , 
     Cliente_idCliente INTEGER  NOT NULL , 
     total             NUMBER (10,2)  NOT NULL 
    ) 
;

ALTER TABLE CarritoCompras 
    ADD CONSTRAINT CarritoCompras_PK PRIMARY KEY ( idCarrito ) ;

CREATE TABLE Cliente 
    ( 
     idCliente       INTEGER  NOT NULL , 
     Comuna_idComuna INTEGER  NOT NULL , 
     nombre          VARCHAR2 (50 CHAR)  NOT NULL , 
     email           VARCHAR2 (50 CHAR)  NOT NULL , 
     password        VARCHAR2 (255 CHAR)  NOT NULL 
    ) 
;

ALTER TABLE Cliente 
    ADD CONSTRAINT Cliente_PK PRIMARY KEY ( idCliente ) ;

CREATE TABLE Comuna 
    ( 
     idComuna        INTEGER  NOT NULL , 
     Region_idRegion INTEGER  NOT NULL , 
     nombre          VARCHAR2 (50 CHAR)  NOT NULL 
    ) 
;

ALTER TABLE Comuna 
    ADD CONSTRAINT Comuna_PK PRIMARY KEY ( idComuna ) ;

CREATE TABLE Despacho 
    ( 
     idDespacho        INTEGER  NOT NULL , 
     Pedido_idPedido   INTEGER  NOT NULL , 
     empresaTransporte VARCHAR2 (50 CHAR)  NOT NULL , 
     tracking          VARCHAR2 (100 CHAR)  NOT NULL 
    ) 
;

ALTER TABLE Despacho 
    ADD CONSTRAINT Despacho_PK PRIMARY KEY ( idDespacho ) ;

CREATE TABLE DetalleCarrito 
    ( 
     idDetalleCarrito         INTEGER  NOT NULL , 
     CarritoCompras_idCarrito INTEGER  NOT NULL , 
     Producto_idProducto      INTEGER  NOT NULL , 
     cantidad                 INTEGER  NOT NULL 
    ) 
;

ALTER TABLE DetalleCarrito 
    ADD CONSTRAINT DetalleCarrito_PK PRIMARY KEY ( idDetalleCarrito ) ;

CREATE TABLE DetallePedido 
    ( 
     idDetallePedido     INTEGER  NOT NULL , 
     Pedido_idPedido     INTEGER  NOT NULL , 
     Producto_idProducto INTEGER  NOT NULL , 
     precioUnitario      NUMBER (10,2)  NOT NULL , 
     cantidad            INTEGER  NOT NULL 
    ) 
;

ALTER TABLE DetallePedido 
    ADD CONSTRAINT DetallePedido_PK PRIMARY KEY ( idDetallePedido ) ;

CREATE TABLE Pago 
    ( 
     idPago          INTEGER  NOT NULL , 
     Pedido_idPedido INTEGER  NOT NULL , 
     monto           NUMBER (10,2)  NOT NULL , 
     medioPago       VARCHAR2 (50 CHAR)  NOT NULL 
    ) 
;

ALTER TABLE Pago 
    ADD CONSTRAINT Pago_PK PRIMARY KEY ( idPago ) ;

CREATE TABLE Pedido 
    ( 
     idPedido                      INTEGER  NOT NULL , 
     Cliente_idCliente             INTEGER  NOT NULL , 
     Administrador_idAdministrador INTEGER , 
     fecha                         DATE  NOT NULL , 
     estado                        VARCHAR2 (50 CHAR)  NOT NULL , 
     total                         NUMBER (10,2)  NOT NULL 
    ) 
;

ALTER TABLE Pedido 
    ADD CONSTRAINT Pedido_PK PRIMARY KEY ( idPedido ) ;

CREATE TABLE Producto 
    ( 
     idProducto  INTEGER  NOT NULL , 
     nombre      VARCHAR2 (100 CHAR)  NOT NULL , 
     descripcion VARCHAR2 (255 CHAR) , 
     precio      NUMBER (10,2)  NOT NULL , 
     stock       INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Producto 
    ADD CONSTRAINT Producto_PK PRIMARY KEY ( idProducto ) ;

CREATE TABLE Region 
    ( 
     idRegion INTEGER  NOT NULL , 
     nombre   VARCHAR2 (100 CHAR)  NOT NULL 
    ) 
;

ALTER TABLE Region 
    ADD CONSTRAINT Region_PK PRIMARY KEY ( idRegion ) ;

ALTER TABLE CarritoCompras 
    ADD CONSTRAINT CarritoCompras_Cliente_FK FOREIGN KEY 
    ( 
     Cliente_idCliente
    ) 
    REFERENCES Cliente 
    ( 
     idCliente
    ) 
;

ALTER TABLE Cliente 
    ADD CONSTRAINT Cliente_Comuna_FK FOREIGN KEY 
    ( 
     Comuna_idComuna
    ) 
    REFERENCES Comuna 
    ( 
     idComuna
    ) 
;

ALTER TABLE Comuna 
    ADD CONSTRAINT Comuna_Region_FK FOREIGN KEY 
    ( 
     Region_idRegion
    ) 
    REFERENCES Region 
    ( 
     idRegion
    ) 
;

ALTER TABLE Despacho 
    ADD CONSTRAINT Despacho_Pedido_FK FOREIGN KEY 
    ( 
     Pedido_idPedido
    ) 
    REFERENCES Pedido 
    ( 
     idPedido
    ) 
;

ALTER TABLE DetalleCarrito 
    ADD CONSTRAINT DetalleCarrito_Producto_FK FOREIGN KEY 
    ( 
     Producto_idProducto
    ) 
    REFERENCES Producto 
    ( 
     idProducto
    ) 
;

ALTER TABLE DetallePedido 
    ADD CONSTRAINT DetallePedido_Pedido_FK FOREIGN KEY 
    ( 
     Pedido_idPedido
    ) 
    REFERENCES Pedido 
    ( 
     idPedido
    ) 
;

ALTER TABLE DetallePedido 
    ADD CONSTRAINT DetallePedido_Producto_FK FOREIGN KEY 
    ( 
     Producto_idProducto
    ) 
    REFERENCES Producto 
    ( 
     idProducto
    ) 
;

ALTER TABLE DetalleCarrito 
    ADD CONSTRAINT DetCarrito_CarritoCompras_FK FOREIGN KEY 
    ( 
     CarritoCompras_idCarrito
    ) 
    REFERENCES CarritoCompras 
    ( 
     idCarrito
    ) 
;

ALTER TABLE Pago 
    ADD CONSTRAINT Pago_Pedido_FK FOREIGN KEY 
    ( 
     Pedido_idPedido
    ) 
    REFERENCES Pedido 
    ( 
     idPedido
    ) 
;

ALTER TABLE Pedido 
    ADD CONSTRAINT Pedido_Administrador_FK FOREIGN KEY 
    ( 
     Administrador_idAdministrador
    ) 
    REFERENCES Administrador 
    ( 
     idAdministrador
    ) 
;

ALTER TABLE Pedido 
    ADD CONSTRAINT Pedido_Cliente_FK FOREIGN KEY 
    ( 
     Cliente_idCliente
    ) 
    REFERENCES Cliente 
    ( 
     idCliente
    ) 
;



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            11
-- CREATE INDEX                             0
-- ALTER TABLE                             22
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
