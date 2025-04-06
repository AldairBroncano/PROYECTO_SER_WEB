create database BDProyecto;
go

drop database BDProyecto;

use BDProyecto;
go

use master;





-- Creacion de las Tablas
CREATE TABLE Categorias
(
	cod_cat int not null primary key,
	des_cat varchar(50) not null
)
GO

CREATE TABLE Productos (
	cod_prod char (5) NOT NULL Primary key,
	nom_prod varchar (50) NOT NULL ,
	cod_cat int NOT NULL references Categorias,
	pre_prod decimal(7,2) NULL ,
	stk_prod int NULL )
GO

CREATE TABLE Distritos (
	cod_dist int primary key,
	nom_dist varchar(35) not null
)
GO

drop table Clientes;

CREATE TABLE Clientes (
	cod_cli char (5) NOT NULL Primary Key check(cod_cli like 'C[0-9][0-9][0-9][0-9]'),
	nom_cli varchar(50) NOT NULL Unique,
	tel_cli varchar(10) default('Sin telefono'),
	cor_cli varchar(50) default('Sin correo electronico') , --correo electronico
	dir_cli varchar (50) default('Sin direccion'),
    cred_cli int default(1000),
	fec_nac date default('10/03/2000'),
	cod_dist int references Distritos)
GO



-- tambien se puede alterar la tabla cuando se ha creado
--Alter Table Clientes
--add
--CONSTRAINT CK_Cliente_Telefono CHECK (Cli_tel like '[2345][0-9][0-9]-[0-9][0-9][0-9][0-9]')
--go

CREATE TABLE Ventas_Cab (
	num_vta char (5) NOT NULL Primary Key,
	fec_vta date NULL ,
	cod_cli char (5) NULL ,
    cod_ven int  )
GO

CREATE TABLE Ventas_Deta (
	num_vta char (5) NOT NULL ,
	cod_prod char (5) NOT NULL  ,
	cantidad  int NULL , 
        Primary Key(num_vta,cod_prod))
GO

CREATE TABLE Vendedor(
	cod_ven int identity(1,1) not null primary key,
	nom_ven varchar (50) NULL ,
	fecing_ven date NULL --fecha de ingreso 
)
GO

-- Ingreso de Data a las Tablas
set dateformat dmy
set language spanish
go



INSERT INTO Categorias (cod_cat, des_cat)
VALUES
    (1, 'Bebidas'),
    (2, 'Alimentos'),
    (3, 'Limpieza'),
    (4, 'Cuidado Personal'),
    (5, 'Mascotas');


select * from categorias
go


INSERT INTO Productos (cod_prod, nom_prod, cod_cat, pre_prod, stk_prod) VALUES
('P0001', 'Agua cielo', 1, 12.50, 100),
('P0002', 'Arroz Blanco 5kg', 2, 25.00, 50),
('P0003', 'Azúcar Rubia 1kg', 2, 6.50, 80),
('P0004', 'Leche Evaporada 400ml', 2, 3.80, 200),
('P0005', 'Harina de Trigo 1kg', 2, 4.50, 60),
('P0006', 'Fideos Spaghetti 500g', 2, 3.20, 70),
('P0007', 'Pan Molde Blanco 450g', 3, 5.80, 90),
('P0008', 'Huevos de Gallina Docena', 3, 12.00, 120),
('P0009', 'Sal de Mesa 500g', 1, 2.00, 150),
('P0010', 'Café Instantáneo 200g', 1, 18.50, 40),
('P0011', 'Galletas de Chocolate 250g', 2, 8.00, 100),
('P0012', 'Mermelada de Fresa 500g', 2, 10.50, 50),
('P0013', 'Detergente en Polvo 1kg', 3, 15.00, 80),
('P0014', 'Papel Higiénico Pack x4', 3, 18.00, 60),
('P0015', 'Jabón de Tocador 150g', 3, 4.00, 200);
GO



INSERT INTO Distritos VALUES (1, 'Lima'),
	(2, 'Los Olivos'),(3, 'Magdalena'),(4, 'Pueblo Libre'),
	(5, 'Rimac'),(6, 'San Martin de Porres'),(7, 'Jesus Maria'),
	(8, 'Lince'),(9, 'Miraflores'),(10, 'Surco')
GO

select * from Clientes;
go



INSERT INTO clientes VALUES ('C0001','Alvarez Peña, Angel','981234567','importa@hotmail.com','Av. La Marina 1234',3500,default,1)
INSERT INTO clientes VALUES ('C0002','Ponte Gomez, Alejandro','6584503','alex@yahoo.com','Av. Pardo 456  ',2800,'15/10/1999',2)
INSERT INTO clientes VALUES ('C0003','Zuñiga Mateo, Carlos','5674566',default,'Av. Principal 123 ',1200,'21/03/1998',3)
INSERT INTO clientes VALUES ('C0004','Tucto de Souza, Bernardo','5634166',default,'Av. Principal 123 ',1200,'5/12/1998',4)
INSERT INTO clientes VALUES ('C0005','Vilela Bustamante, Percy','4568596' ,'obando@hotmail.com','Calle San Pedro 134',1600,'15/10/1999',5)
INSERT INTO clientes VALUES ('C0006','Garcia Robles, Armando','5894126','importa06@hotmail.com','Jr. Naranjos 5689',3100,'12/01/1999',6)
INSERT INTO clientes VALUES ('C0007','Montes Diaz, Miguel','5678356','importa06@hotmail.com','Jr. Naranjos 5689',3100,'15/07/1998',7)
INSERT INTO clientes VALUES ('C0008','Rojas Gallo, Jorge','7894568','importa22@yahoo.com','Av. Habich 543',2700,'22/03/1999',8)
INSERT INTO clientes VALUES ('C0009','Garcia La Riva, Yuliana','7894073','conde@idat.com','Av. Iquitos 228',3400,'8/10/1997',9)
INSERT INTO clientes VALUES ('C0010','Malpartida Romero, Susana','7596258','importa10@hotmail.com','Jr. Naranjos 5689',3100,default,10)
INSERT INTO clientes VALUES ('C0011','Wong Atoccsa, Israel','7685704',default,'Calle Cueva 432',2000,'15/10/1999',1)
INSERT INTO clientes VALUES ('C0012','Liñan Arias, Fernando','98564125','redondo@hotmail.com','Av. Javier Prado 114',1600,default,2)
INSERT INTO clientes VALUES ('C0013','Vergara Hidalgo, Jose','5678466','importa03@hotmail.com','Jr. Pio XII 112',2500,'15/10/1999',3)
INSERT INTO clientes VALUES ('C0014','Bustamante Moptta, Diego','5674566',default,'Av. Principal 123',1200,'15/10/1999',4)
INSERT INTO clientes VALUES ('C0015','Alvarado Cueva, Rosa','4563457','campos@yahoo.com','Jr. Dominicos 554',5000,'15/10/1999',6)
INSERT INTO clientes VALUES ('C0016','Antero Flores, Gregorio','7460647','ramirez@idat.com','Jr. Salavery 876',2100,'15/10/1999',5)
INSERT INTO clientes VALUES ('C0017','Diaz Mal Partida, Jose','5674566',default,'Av. Guardia Civil 123 ',1200,'15/10/1999',9)
INSERT INTO clientes VALUES ('C0018','Gutierrez Pazos, Mauricio','988425783','importa04@hotmail.com','Av. Habich 4567',1800,default,7)
INSERT INTO clientes VALUES ('C0019','Mendoza Ramirez, Esther','989583569','importa05@yahoo.com','Av. Wilson 678',2600,default,8)
INSERT INTO clientes VALUES ('C0020','Salazar Santiago, Marlon','6546534','pardo@walla.com','Av. Pardo 567',4100,'15/10/1999',10)
INSERT INTO clientes VALUES ('C0021','Carrasco Lee, Laura','2678958','importa05@hotmail.com','Av. Wilson 1267',2700,default,3)


INSERT INTO Ventas_Cab VALUES ('V0001','02/03/2020','C0007',1)
INSERT INTO Ventas_Cab VALUES ('V0002','02/03/2020','C0005',2)
INSERT INTO Ventas_Cab VALUES ('V0003','02/03/2020','C0016',2)
INSERT INTO Ventas_Cab VALUES ('V0004','08/05/2020','C0002',1)
INSERT INTO Ventas_Cab VALUES ('V0005','08/05/2020','C0005',3)
INSERT INTO Ventas_Cab VALUES ('V0006','08/05/2020','C0004',4)
INSERT INTO Ventas_Cab VALUES ('V0007','10/07/2020','C0016',5)
INSERT INTO Ventas_Cab VALUES ('V0008','10/07/2020','C0005',5)
INSERT INTO Ventas_Cab VALUES ('V0009','12/08/2020','C0020',6)
INSERT INTO Ventas_Cab VALUES ('V0010','01/08/2020','C0005',7)
INSERT INTO Ventas_Cab VALUES ('V0011','01/09/2020','C0012',10)
INSERT INTO Ventas_Cab VALUES ('V0012','01/09/2020','C0012',7)
INSERT INTO Ventas_Cab VALUES ('V0013','02/10/2020','C0002',6)
INSERT INTO Ventas_Cab VALUES ('V0014','02/10/2020','C0011',1)
INSERT INTO Ventas_Cab VALUES ('V0015','02/10/2020','C0018',2)
INSERT INTO Ventas_Cab VALUES ('V0016','03/12/2020','C0012',1)
INSERT INTO Ventas_Cab VALUES ('V0017','03/12/2020','C0001',3)


INSERT INTO Ventas_Deta VALUES ('V0001','P0007',3)
INSERT INTO Ventas_Deta VALUES ('V0001','P0001', 2)
INSERT INTO Ventas_Deta VALUES ('V0002','P0002',16)
INSERT INTO Ventas_Deta VALUES ('V0002','P0004', 4)
INSERT INTO Ventas_Deta VALUES ('V0002','P0005', 6)
INSERT INTO Ventas_Deta VALUES ('V0003','P0004', 5)
INSERT INTO Ventas_Deta VALUES ('V0004','P0007',3)
INSERT INTO Ventas_Deta VALUES ('V0004','P0002',2)
INSERT INTO Ventas_Deta VALUES ('V0005','P0006', 12)
INSERT INTO Ventas_Deta VALUES ('V0005','P0010',11)
INSERT INTO Ventas_Deta VALUES ('V0005','P0011', 4)
INSERT INTO Ventas_Deta VALUES ('V0005','P0014',11)
INSERT INTO Ventas_Deta VALUES ('V0006','P0007',13)
INSERT INTO Ventas_Deta VALUES ('V0007','P0020', 23)
INSERT INTO Ventas_Deta VALUES ('V0008','P0020', 2)
INSERT INTO Ventas_Deta VALUES ('V0009','P0001', 2)
INSERT INTO Ventas_Deta VALUES ('V0010','P0006', 8)
INSERT INTO Ventas_Deta VALUES ('V0010','P0005', 7)
INSERT INTO Ventas_Deta VALUES ('V0010','P0011', 5)
INSERT INTO Ventas_Deta VALUES ('V0011','P0005', 6)
INSERT INTO Ventas_Deta VALUES ('V0011','P0004', 4)
INSERT INTO Ventas_Deta VALUES ('V0011','P0010',13)
INSERT INTO Ventas_Deta VALUES ('V0012','P0002',14)
INSERT INTO Ventas_Deta VALUES ('V0013','P0014',21)
INSERT INTO Ventas_Deta VALUES ('V0014','P0014',2)
INSERT INTO Ventas_Deta VALUES ('V0015','P0007',3)
INSERT INTO Ventas_Deta VALUES ('V0016','P0014',2)
INSERT INTO Ventas_Deta VALUES ('V0016','P0006', 5)
INSERT INTO Ventas_Deta VALUES ('V0017','P0006', 7)
INSERT INTO Ventas_Deta VALUES ('V0017','P0011', 5)
INSERT INTO Ventas_Deta VALUES ('V0018','P0012', 4)
INSERT INTO Ventas_Deta VALUES ('V0018','P0002', 1)
INSERT INTO Ventas_Deta VALUES ('V0018','P0004', 4)
INSERT INTO Ventas_Deta VALUES ('V0018','P0005', 11)
INSERT INTO Ventas_Deta VALUES ('V0019','P0008', 13)
INSERT INTO Ventas_Deta VALUES ('V0019','P0007', 6)
INSERT INTO Ventas_Deta VALUES ('V0019','P0006', 7)
INSERT INTO Ventas_Deta VALUES ('V0020','P0007', 6)
INSERT INTO Ventas_Deta VALUES ('V0020','P0009', 15)
INSERT INTO Ventas_Deta VALUES ('V0021','P0009', 11)
INSERT INTO Ventas_Deta VALUES ('V0021','P0004', 2)
INSERT INTO Ventas_Deta VALUES ('V0021','P0007', 3)
INSERT INTO Ventas_Deta VALUES ('V0022','P0001', 4)
INSERT INTO Ventas_Deta VALUES ('V0023','P0003', 5)
INSERT INTO Ventas_Deta VALUES ('V0023','P0006', 7)
INSERT INTO Ventas_Deta VALUES ('V0024','P0007', 13)
INSERT INTO Ventas_Deta VALUES ('V0024','P0003', 15)
INSERT INTO Ventas_Deta VALUES ('V0025','P0008', 11)
INSERT INTO Ventas_Deta VALUES ('V0026','P0010', 4)
INSERT INTO Ventas_Deta VALUES ('V0026','P0011', 3)


INSERT INTO Vendedor VALUES ('Diaz Vera, Paola Isabel','01/03/2008')
INSERT INTO Vendedor VALUES ('Pardo Campos, Carlos','11/05/2008')
INSERT INTO Vendedor VALUES ('Linares Moreno, Susana Claudia','12/06/2008')
INSERT INTO Vendedor VALUES ('Mendoza Obando, Maria del Carmen','21/11/2008')
INSERT INTO Vendedor VALUES ('Narvaez Gomez, Mario Dario','15/12/2008')
INSERT INTO Vendedor VALUES ('Murillo Mancini, Juan Carlos','02/05/2009')
INSERT INTO Vendedor VALUES ('Gonzales Vera, Erlinda','12/07/2009')
INSERT INTO Vendedor VALUES ('Diaz Choque, Susy Elizabeth','11/08/2009')
INSERT INTO Vendedor VALUES ('Huamani Rios, Karen Lizet ','21/10/2009')
INSERT INTO Vendedor VALUES ('Camarena Peralta, Cristina Romina','10/11/2009')
GO




*/
-- Adicionando una nueva columna art_pre a la tabla Ventas_Deta
Alter Table Ventas_Deta
Add precio decimal(7,2)
GO
-- Actualizando el precio de la columna art_pre de la
-- tabla Ventas_Deta con los precios de los Productos
Update D 
  Set D.precio=A.pre_prod
  From Ventas_Deta D,Productos A 
Where D.cod_prod=A.cod_prod
GO

--Select * from Ventas_Deta
--GO

ALTER TABLE Productos
ADD eli_prod char(2) default 'No' with values
GO

ALTER TABLE CLIENTES
ADD eli_cli	char(2) default 'No' with values
GO

ALTER TABLE VENDEDOR
ADD eli_ven	char(2) default 'No' with values
GO

ALTER TABLE Ventas_Deta
ADD anulado char(2) default 'No' with values
GO

ALTER TABLE Ventas_Cab
ADD tot_vta decimal(8,2) default 0 with values
GO

UPDATE VC
	SET tot_vta = VD.Total
FROM Ventas_Cab VC INNER JOIN
  (SELECT num_vta, SUM(Precio*Cantidad) as Total FROM Ventas_Deta
     GROUP BY num_vta) VD
	on VC.num_vta=VD.num_vta
GO
		
ALTER TABLE Ventas_Cab
ADD anulado char(2) default 'No' with values
GO

-- Creando las Claves Foráneas
alter table Ventas_Cab
	add constraint fk_Ventas_Cab_cod_cli foreign key(cod_cli)
		references clientes(cod_cli)
go
alter table Ventas_Cab
	add constraint fk_Ventas_Cab_cod_ven foreign key(cod_ven)
		references vendedor(cod_ven)
go

alter table Ventas_Deta
	add constraint fk_Ventas_Deta_num_vta foreign key(num_vta)
		references Ventas_Cab(num_vta)
go
alter table Ventas_Deta
	add constraint fk_Ventas_Deta_cod_prod foreign key(cod_prod)
		references Productos(cod_prod)
go

----------------------------------------

SET NOCOUNT OFF
SELECT MENSAJE='BASE DE DATOS BDPANADERIA CREADA CORRECTAMENTE'
GO


---------------------------------CREACION DE LOS PROCEDIMIENTOS ALMACENADOS-------------------------------------------------

CREATE OR ALTER PROC PA_LISTAR_PRODUCTOS 
    @Nombre NVARCHAR(100) = NULL  
AS
BEGIN
    IF @Nombre IS NULL OR @Nombre = ''
    BEGIN
       
        SELECT A.cod_prod, A.nom_prod, A.pre_prod, A.stk_prod
        FROM Productos A
        WHERE A.stk_prod >= 0
    END
    ELSE
    BEGIN
       
        SELECT A.cod_prod, A.nom_prod, A.pre_prod, A.stk_prod
        FROM Productos A
        WHERE A.stk_prod >= 0
        AND A.nom_prod LIKE  + @Nombre + '%'  
    END
END
GO



EXEC PA_LISTAR_ARTICULOS @NOMBRE = '';




---------------------------------------------------------------------------------------------------------

CREATE OR ALTER PROC PA_LISTAR_CLIENTES
AS
SELECT C.cod_cli, C.nom_cli, C.tel_cli, C.cred_cli
FROM Clientes C
GO

select * from Clientes;

-------------------------------------------------------------------------------------------



---------------------------------------------------------------------------------------------

----------------- PARTE 02 ---------------------
---------------- PARTE 02 ---------------------
CREATE OR ALTER PROC PA_GRABAR_WEB_VENTAS_CAB
@COD_CLI CHAR(5),@TOT_VTA DECIMAL(10,2)
AS
	-- DECLARANDO VARIABLE PARA EL NUEVO NUMERO DE LA VENTA
	DECLARE @NUMERO VARCHAR(5) 
	-- RECUPERANDO EL MAXIMO NUMERO DE VENTA
	SELECT @NUMERO=RIGHT(MAX(NUM_VTA),4)+1 FROM Ventas_Cab
	-- GENERANDO EL NUEVO NUMERO DE LA VENTA
	SELECT @NUMERO='V'+RIGHT('000'+@NUMERO,4)

	-----------------------------------------------
	-- INSERTANDO LOS DATOS DE LA NUEVA VENTA
	INSERT INTO Ventas_Cab VALUES(@NUMERO,GETDATE(),
	@COD_CLI, 1, @TOT_VTA, 'No')
	-- DEVOLVIENDO EL NUEVO NUMERO DE VENTA GENERADO
	SELECT @NUMERO AS NUMERO
GO


CREATE OR ALTER PROC PA_GRABAR_WEB_VENTAS_DETA
@NUM_VTA CHAR(5), @COD_PROD CHAR(5), 
@CANTIDAD INT, @PRECIO DECIMAL(7,2)
AS
	-- INSERTANDO EL NUEVO DETALLE DE LA VENTA
	INSERT INTO Ventas_Deta 
	   VALUES(@NUM_VTA, @COD_PROD, @CANTIDAD, @PRECIO, 'No')
	-- ACTUALIZANDO EL STOCK DEL PRODUCTO
	UPDATE Productos SET stk_prod=stk_prod - @CANTIDAD 
	WHERE cod_prod = @COD_PROD
GO

/*
-- constraint de tipo check sobre la columna 
-- stk_prod de la tabla Productos que no permite 
-- tener un stock negativo
ALTER TABLE Productos
	ADD CONSTRAINT CK_STK_PROD CHECK(STK_PROD>=0)
GO
*/

select * from ventas_cab order by num_vta desc
go
select * from ventas_deta order by num_vta desc
go
select * from Productos order by stk_prod asc
go

SELECT * FROM Ventas_Deta;

SELECT * FROM ventas_cab;

