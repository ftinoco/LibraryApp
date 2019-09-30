USE [BIBLIOTECA]
GO

-- 1. Listar los datos de los autores que tengan más de un libro publicado 
SELECT DISTINCT T.IdAutor, 
	   T.Nombre, 
	   T.Nacionalidad 
  FROM (SELECT A.*, 
				ROW_NUMBER() OVER(Partition by LA.IdAutor 
					ORDER BY A.IdAutor) RN
		  FROM [dbo].[Autor] A
				INNER JOIN [dbo].[LibAut] LA ON A.IdAutor = LA.IdAutor) T
WHERE T.RN > 1
GO

-- 2. Listar nombre y edad de los estudiantes
SELECT E.Nombre, E.Edad
FROM [dbo].[Estudiante] E
GO

 -- 3. Estudiantes que pertenecen  a la carrera de Informática
SELECT E.IdLector, E.CI, E.Nombre, E.Direccion, E.Carrera, E.Edad
FROM [dbo].[Estudiante] E
WHERE UPPER(E.Carrera) = UPPER('Informática')
GO

-- 4. Listar los nombres de los estudiantes cuyo apellido comience con la letra G
SELECT E.IdLector, E.CI, E.Nombre, E.Direccion, E.Carrera, E.Edad
FROM [dbo].[Estudiante] E
WHERE UPPER(E.Nombre) LIKE '% G%'
GO

-- 5. Autores del libro “Visual Studio Net”
SELECT A.Nombre
FROM [dbo].[Libro] L
	INNER JOIN [dbo].[LibAut] LA ON L.IdLibro = LA.IdLibro
	INNER JOIN [dbo].[Autor] A ON LA.IdAutor = A.IdAutor
WHERE  UPPER(L.Titulo) =  UPPER('Visual Studio Net')
GO

-- 6. Autores de nacionalidad USA o Francia
SELECT A.IdAutor, A.Nombre, A.Nacionalidad
FROM [dbo].[Autor] A 
WHERE UPPER(A.Nacionalidad) IN (UPPER('USA'), UPPER('Francia'))
GO

-- 7. Libros que no son del Area de Internet
SELECT L.IdLibro, L.Titulo, L.Editorial, L.Area
FROM  [dbo].[Libro] L
WHERE UPPER(L.Area) <>  UPPER('Internet')
GO


-- 8. Libros que prestó "Felipe Loayza Beramendi"
SELECT L.IdLibro, L.Titulo, L.Editorial, L.Area
FROM [dbo].[Prestamo] P
	INNER JOIN [dbo].[Estudiante] E ON P.IdLector = E.IdLector
	INNER JOIN [dbo].[Libro] L ON P.IdLibro = L.IdLibro
WHERE UPPER(E.Nombre) = UPPER('Felipe Loayza Beramendi')
GO


-- 9. Listar el nombre del estudiante de menor edad
SELECT E.Nombre
FROM [dbo].[Estudiante] E 
WHERE E.Edad = (SELECT MIN(Edad) FROM [dbo].[Estudiante])
GO

-- 10. Listar los nombres de los estudiantes que se prestaron Libros de Base de Datos
SELECT DISTINCT E.Nombre
FROM [dbo].[Prestamo] P
	INNER JOIN [dbo].[Estudiante] E ON P.IdLector = E.IdLector
	INNER JOIN [dbo].[Libro] L ON P.IdLibro = L.IdLibro
WHERE UPPER(L.Area) = UPPER('Base de Datos')
GO

-- 11. Listar los libros de editorial Alfa y Omega
SELECT L.IdLibro, L.Titulo, L.Editorial, L.Area
FROM  [dbo].[Libro] L
WHERE UPPER(L.Editorial) =  UPPER('Alfa & Omega')
GO

-- 12. Listar los libros que pertenecen al autor Mario Benedetti
SELECT L.IdLibro, L.Titulo, L.Editorial, L.Area
FROM  [dbo].[Libro] L
	 INNER JOIN [dbo].[LibAut] LA ON L.IdLibro = LA.IdLibro
	 INNER JOIN [dbo].[Autor] A ON LA.IdAutor = A.IdAutor
WHERE UPPER(A.Nombre) =  UPPER('Mario Benedetti')
GO

-- 13. Listar los títulos de los libros que debían devolverse el 10/04/07
SELECT DISTINCT L.Titulo
FROM [dbo].[Prestamo] P 
	INNER JOIN [dbo].[Libro] L ON P.IdLibro = L.IdLibro
WHERE CONVERT(VARCHAR(10), P.[FechaDevolucion], 3)  = CONVERT(VARCHAR(10), '10/04/07', 103) 
GO
 
-- 14. Listar los libros que pertenecen al autor Mario Benedetti
SELECT SUM(E.Edad) SUMA_EDADES
FROM [dbo].[Estudiante] E 
GO
 
-- 15. Listar los datos de los estudiantes cuya edad es mayor al promedio
SELECT E.IdLector, E.CI, E.Nombre, E.Direccion, E.Carrera, E.Edad
FROM [dbo].[Estudiante] E 
WHERE E.Edad > ( SELECT SUM(Edad) / COUNT(1) SUMA_EDADES
				 FROM [dbo].[Estudiante] )  
GO 




-- PRUEBAS DE PROCEDIMIENTOS ALMACENADOS Y FUNCIONES
EXEC USP_OBTENER_LIBROS_POR_AUTOR @NombreAutor = 'Mónica Velasco'
GO

EXEC USP_INSERTAR_ESTUDIANTE
	@CI			= '0012-1515',
	@Nombre		= 'Estaban Gutiérrez',
	@Direccion	= 'Loma linda, Managua',
	@Carrera	= 'Ing. Química',
	@Edad		= 19
GO

EXEC USP_ACTUALIZAR_LIBRO
	@IdLibro	= 1,
	@Titulo		= 'La confesión de un Libio',
	@Editorial	= 'Universal',
	@Area	    = 'Poesía' 
GO
 

SELECT * FROM [dbo].[FN_OBTENER_PRESTAMOS]('Juan José Salmeron')