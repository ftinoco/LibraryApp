USE [master]
GO

CREATE DATABASE BIBLIOTECA
GO

USE BIBLIOTECA
GO

-- TABLAS
CREATE TABLE Libro
(
	IdLibro INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Titulo VARCHAR(128) NOT NULL,
	Editorial VARCHAR(64) NOT NULL,
	Area VARCHAR(64) NOT NULL
)
GO

CREATE TABLE Autor
(
	IdAutor INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Nombre VARCHAR(64) NOT NULL,
	Nacionalidad VARCHAR(64) NOT NULL
)
 GO


CREATE TABLE LibAut
(
	IdLibro INT NOT NULL,
	IdAutor INT NOT NULL
	CONSTRAINT PK_LibAut PRIMARY KEY CLUSTERED 
	(
		IdLibro,IdAutor
	)
)
GO
ALTER TABLE LibAut WITH CHECK ADD  CONSTRAINT [Libro_Autor] FOREIGN KEY(IdLibro)
REFERENCES Libro (IdLibro)
GO

ALTER TABLE LibAut WITH CHECK ADD  CONSTRAINT [Autor_Libro] FOREIGN KEY(IdAutor)
REFERENCES Autor (IdAutor)
GO
 
CREATE TABLE Estudiante
(
	IdLector INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	CI VARCHAR(32) NOT NULL,
	Nombre VARCHAR(64) NOT NULL,
	Direccion VARCHAR(128) NOT NULL,
	Carrera VARCHAR(64) NOT NULL,
	Edad INT NOT NULL
)
 GO
 
CREATE TABLE Prestamo
(
	IdLector INT NOT NULL,
	IdLibro INT NOT NULL,
	FechaPrestamo DATETIME NOT NULL,
	FechaDevolucion DATETIME NOT NULL,
	Devuelto BIT NOT NULL
	CONSTRAINT PK_Prestamo PRIMARY KEY CLUSTERED 
	(
		IdLector, IdLibro, FechaPrestamo
	)
)
GO
ALTER TABLE Prestamo WITH CHECK ADD  CONSTRAINT [Lector_Libro] FOREIGN KEY(IdLector)
REFERENCES Estudiante (IdLector)
GO

ALTER TABLE Prestamo WITH CHECK ADD  CONSTRAINT [Libro_Lector] FOREIGN KEY(IdLibro)
REFERENCES Libro (IdLibro)
GO



-- PROCEDIMIENTOS ALMACENADOS
 -- ===================================================
-- Author:		FERNANDO TINOCO
-- Create date: 07/09/19
-- Description:	LISTA LOS LIBRO DE UN DETERMINADO AUTOR
-- ====================================================
CREATE PROCEDURE USP_OBTENER_LIBROS_POR_AUTOR
	@NombreAutor VARCHAR(64)
AS
BEGIN
	SELECT L.IdLibro, L.Titulo, L.Editorial, L.Area
	FROM  [dbo].[Libro] L
		 INNER JOIN [dbo].[LibAut] LA ON L.IdLibro = LA.IdLibro
		 INNER JOIN [dbo].[Autor] A ON LA.IdAutor = A.IdAutor
	WHERE UPPER(A.Nombre) =  UPPER(@NombreAutor) 
END
GO

 -- ===========================================
-- Author:		FERNANDO TINOCO
-- Create date: 07/09/19
-- Description:	INSERTA REGISTRO DE ESTUDIANTES
-- ============================================
CREATE PROCEDURE USP_INSERTAR_ESTUDIANTE
	@CI			VARCHAR(32),
	@Nombre		VARCHAR(64),
	@Direccion	VARCHAR(128),
	@Carrera	VARCHAR(64),
	@Edad		INT
AS
BEGIN
	INSERT INTO [dbo].[Estudiante] ([CI] ,[Nombre], [Direccion] ,[Carrera] ,[Edad])
     VALUES (@CI ,@Nombre ,@Direccion , @Carrera, @Edad)
 
END
GO

 -- =======================================
-- Author:		FERNANDO TINOCO
-- Create date: 07/09/19
-- Description:	ACTUALIZA REGISTRO DE LIBRO
-- ========================================
CREATE PROCEDURE USP_ACTUALIZAR_LIBRO
	@IdLibro	INT,
	@Titulo		VARCHAR(128),
	@Editorial	VARCHAR(64),
	@Area		VARCHAR(64)
AS
BEGIN 
	UPDATE [dbo].[Libro]
	   SET [Titulo] = @Titulo
		  ,[Editorial] = @Editorial
		  ,[Area] = @Area
	 WHERE IdLibro = @IdLibro
END
GO


-- FUNCIONES 
-- ==========================================================
-- Author:		FERNANDO TINOCO
-- Create date: 07/09/19
-- Description:	OBTIENE LA INFORMACIÓN DE PRESTAMO POR ALUMNO
-- ==========================================================
CREATE FUNCTION FN_OBTENER_PRESTAMOS
(	
	@NombreAlumno VARCHAR(64)
)
RETURNS TABLE 
AS
RETURN 
( 
	SELECT  P.IdLibro, P.IdLector, L.Titulo, P.FechaPrestamo, P.FechaDevolucion, P.Devuelto
	FROM [dbo].[Prestamo] P
		INNER JOIN [dbo].[Estudiante] E ON P.IdLector = E.IdLector
		INNER JOIN [dbo].[Libro] L ON P.IdLibro = L.IdLibro
	WHERE UPPER(E.Nombre) = UPPER(@NombreAlumno) 
)
GO


-- DISPARADOR 
CREATE TRIGGER TG_ESTUDIANTES
ON [dbo].[Estudiante]
AFTER INSERT AS
BEGIN
	SET NOCOUNT ON;
	SELECT  E.IdLector, E.CI, E.Nombre, E.Direccion, E.Carrera, E.Edad
	FROM [dbo].[Estudiante] E
END