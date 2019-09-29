USE [BIBLIOTECA]
GO

-- INSERCION AUTORES 
INSERT INTO [dbo].[Autor] ([Nombre] ,[Nacionalidad])
     VALUES ('Luis Alemañ' ,'España')
GO

INSERT INTO [dbo].[Autor] ([Nombre] ,[Nacionalidad])
     VALUES ('Carlos de Tomás' ,'España')
GO

INSERT INTO [dbo].[Autor] ([Nombre] ,[Nacionalidad])
     VALUES ('Iván Robledo' ,'España')
GO

INSERT INTO [dbo].[Autor] ([Nombre] ,[Nacionalidad])
     VALUES ('Laura Martínez Gimeno' ,'España')
GO

INSERT INTO [dbo].[Autor] ([Nombre] ,[Nacionalidad])
     VALUES ('Mónica Velasco' ,'España')
GO

INSERT INTO [dbo].[Autor] ([Nombre] ,[Nacionalidad])
     VALUES ('Antonio Colinas' ,'España')
GO

INSERT INTO [dbo].[Autor] ([Nombre] ,[Nacionalidad])
     VALUES ('Rick Anderson' ,'USA')
GO

INSERT INTO [dbo].[Autor] ([Nombre] ,[Nacionalidad])
     VALUES ('Marc Ostrofsky' ,'USA')
GO

INSERT INTO [dbo].[Autor] ([Nombre] ,[Nacionalidad])
     VALUES ('Vanessa Fox' ,'USA')
GO

INSERT INTO [dbo].[Autor] ([Nombre] ,[Nacionalidad])
     VALUES ('Mario Benedetti' ,'Uruguay')
GO 

INSERT INTO [dbo].[Autor] ([Nombre] ,[Nacionalidad])
     VALUES ('Victor Hugo' ,'Francia')
GO

INSERT INTO [dbo].[Autor] ([Nombre] ,[Nacionalidad])
     VALUES ('Simone de Beauvoir' ,'Francia')
GO
 
INSERT INTO [dbo].[Autor] ([Nombre] ,[Nacionalidad])
     VALUES ('Marguerite Duras' ,'Francia')
GO




-- INSERCION LIBROS
INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('La confesión del Libio' ,'Amarante' ,'Novela actual')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('Cinco días para matar al Papa' ,'Amarante' ,'Novela negra')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('Versos desvelados' ,'Amarante' ,'Poesía actual')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('Llumantia Ilíquida' ,'Amarante' ,'Poesía actual')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('Animales heridos' ,'Amarante' ,'Poesía')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('Visual Studio Net' ,'Microsoft' ,'Informática')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('Trazos (En torno a Anglada-Camarasa)' ,'Amarante' ,'Poesía actual')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('Internet: Así es como todo inicio' ,'Alfa & Omega' ,'Internet')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('Marketing de la era Google.' ,'Anaya' ,'Internet')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('Internet para todos' ,'Anaya' ,'Internet')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('Hágase rico en un click: La guía imprescindible para ganar dinero en Internet',
	 'CONECTA' ,'Internet')
GO
 
INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('ANTOLOGÍA POÉTICA', 'Alianza Editorial ' ,'Poesía')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('LA TREGUA', 'Alianza Editorial' ,'Ficción moderna y contemporanea')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('PRIMAVERA CON UNA ESQUINA ROTA',  'DEBOLSILLO ' ,'Ficción histórica')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('PEDRO Y EL CAPITÁN', 'Alianza Editorial' ,'Obras de teatro, textos teatrales')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('GRACIAS POR EL FUEGO',  'Alianza Editorial' ,'Ficción moderna y contemporanea')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('EL AMOR, LAS MUJERES Y LA VIDA . POEMAS DE AMOR. ANTOLOGÍA', 'VISOR LIBROS' ,'Poesía')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('SQL SERVER 2014 SOLUCIONES PRÁCTICAS DE ADMINISTRACIÓN', 'RA-MA EDITORIAL' ,'Base de Datos')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('ORACLE ASSETS', 'RA-MA EDITORIAL' ,'Base de Datos')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('PROGRAMACIÓN DE BASES DE DATOS RELACIONALES', 'RA-MA EDITORIAL' ,'Base de Datos')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('ADMINISTRACIÓN DE SISTEMAS GESTORES DE BASES DE DATOS. 2ª EDICIÓN', 'RA-MA EDITORIAL' ,'Base de Datos')
GO



-- INSERCION DE LIBRO - AUTOR
INSERT INTO [dbo].[LibAut] ([IdLibro], [IdAutor])
SELECT L.IdLibro, A.IdAutor 
  FROM [dbo].[Libro] L, [dbo].[Autor]  A
  WHERE UPPER(L.Titulo) = UPPER('La confesión del Libio')
		AND UPPER(A.Nombre) = UPPER('Carlos de Tomás')
GO

INSERT INTO [dbo].[LibAut] ([IdLibro], [IdAutor])
SELECT L.IdLibro, A.IdAutor 
  FROM [dbo].[Libro] L, [dbo].[Autor]  A
  WHERE UPPER(L.Titulo) = UPPER('Cinco días para matar al Papa')
		AND UPPER(A.Nombre) = UPPER('Iván Robledo')
GO

INSERT INTO [dbo].[LibAut] ([IdLibro], [IdAutor])
SELECT L.IdLibro, A.IdAutor 
  FROM [dbo].[Libro] L, [dbo].[Autor]  A
  WHERE UPPER(L.Titulo) = UPPER('Versos desvelados')
		AND UPPER(A.Nombre) = UPPER('Laura Martínez Gimeno')
GO

INSERT INTO [dbo].[LibAut] ([IdLibro], [IdAutor])
SELECT L.IdLibro, A.IdAutor 
  FROM [dbo].[Libro] L, [dbo].[Autor]  A
  WHERE UPPER(L.Titulo) = UPPER('Llumantia Ilíquida')
		AND UPPER(A.Nombre) = UPPER('Mónica Velasco')
GO

INSERT INTO [dbo].[LibAut] ([IdLibro], [IdAutor])
SELECT L.IdLibro, A.IdAutor
  FROM [dbo].[Libro] L, [dbo].[Autor]  A
  WHERE UPPER(L.Titulo) = UPPER('Animales heridos')
		AND UPPER(A.Nombre) = UPPER('Luis Alemañ')
GO

INSERT INTO [dbo].[LibAut] ([IdLibro], [IdAutor])
SELECT L.IdLibro, A.IdAutor 
  FROM [dbo].[Libro] L, [dbo].[Autor]  A
  WHERE UPPER(L.Titulo) = UPPER('Trazos (En torno a Anglada-Camarasa)')
		AND UPPER(A.Nombre) = UPPER('Mónica Velasco')
GO

INSERT INTO [dbo].[LibAut] ([IdLibro], [IdAutor])
SELECT L.IdLibro, A.IdAutor
  FROM [dbo].[Libro] L, [dbo].[Autor]  A
  WHERE UPPER(L.Titulo) = UPPER('Trazos (En torno a Anglada-Camarasa)')
		AND UPPER(A.Nombre) = UPPER('Antonio Colinas')
GO

INSERT INTO [dbo].[LibAut] ([IdLibro], [IdAutor])
SELECT L.IdLibro, A.IdAutor
  FROM [dbo].[Libro] L, [dbo].[Autor]  A
  WHERE UPPER(L.Titulo) = UPPER('Visual Studio Net')
		AND UPPER(A.Nombre) = UPPER('Rick Anderson')
GO

INSERT INTO [dbo].[LibAut] ([IdLibro], [IdAutor])
SELECT L.IdLibro, A.IdAutor
  FROM [dbo].[Libro] L, [dbo].[Autor]  A
  WHERE UPPER(L.Titulo) = UPPER('Hágase rico en un click: La guía imprescindible para ganar dinero en Internet')
		AND UPPER(A.Nombre) = UPPER('Marc Ostrofsky')
GO

INSERT INTO [dbo].[LibAut] ([IdLibro], [IdAutor])
SELECT L.IdLibro, A.IdAutor
  FROM [dbo].[Libro] L, [dbo].[Autor]  A
  WHERE UPPER(L.Titulo) = UPPER('Marketing de la era Google')
		AND UPPER(A.Nombre) = UPPER(' Vanessa Fox')
GO

INSERT INTO [dbo].[LibAut] ([IdLibro], [IdAutor])
SELECT L.IdLibro, A.IdAutor
  FROM [dbo].[Libro] L, [dbo].[Autor]  A
  WHERE UPPER(L.Titulo) = UPPER('LA TREGUA')
		AND UPPER(A.Nombre) = UPPER('Mario Benedetti')
GO

INSERT INTO [dbo].[LibAut] ([IdLibro], [IdAutor])
SELECT L.IdLibro, A.IdAutor
  FROM [dbo].[Libro] L, [dbo].[Autor]  A
  WHERE UPPER(L.Titulo) = UPPER('PRIMAVERA CON UNA ESQUINA ROTA')
		AND UPPER(A.Nombre) = UPPER('Mario Benedetti')
GO

INSERT INTO [dbo].[LibAut] ([IdLibro], [IdAutor])
SELECT L.IdLibro, A.IdAutor
  FROM [dbo].[Libro] L, [dbo].[Autor]  A
  WHERE UPPER(L.Titulo) = UPPER('PEDRO Y EL CAPITÁN')
		AND UPPER(A.Nombre) = UPPER('Mario Benedetti')
GO

INSERT INTO [dbo].[LibAut] ([IdLibro], [IdAutor])
SELECT L.IdLibro, A.IdAutor
  FROM [dbo].[Libro] L, [dbo].[Autor]  A
  WHERE UPPER(L.Titulo) = UPPER('GRACIAS POR EL FUEGO')
		AND UPPER(A.Nombre) = UPPER('Mario Benedetti')
GO

INSERT INTO [dbo].[LibAut] ([IdLibro], [IdAutor])
SELECT L.IdLibro, A.IdAutor
  FROM [dbo].[Libro] L, [dbo].[Autor]  A
  WHERE UPPER(L.Titulo) = UPPER('EL AMOR, LAS MUJERES Y LA VIDA . POEMAS DE AMOR. ANTOLOGÍA')
		AND UPPER(A.Nombre) = UPPER('Mario Benedetti')
GO

INSERT INTO [dbo].[LibAut] ([IdLibro], [IdAutor])
SELECT L.IdLibro, A.IdAutor
  FROM [dbo].[Libro] L, [dbo].[Autor]  A
  WHERE UPPER(L.Titulo) = UPPER('ANTOLOGÍA POÉTICA')
		AND UPPER(A.Nombre) = UPPER('Mario Benedetti')
GO



-- INSERCION DE ESTUDIANTES
INSERT INTO [dbo].[Estudiante] ([CI] ,[Nombre], [Direccion] ,[Carrera] ,[Edad])
     VALUES ('2010-1520' ,'Fernando Tinoco' ,'Managua' , 'Informática', 25)
GO

INSERT INTO [dbo].[Estudiante] ([CI] ,[Nombre], [Direccion] ,[Carrera] ,[Edad])
     VALUES ('2006-7979' ,'Felipe Loayza Beramendi', 'San José', 'Derecho', 22)
GO

INSERT INTO [dbo].[Estudiante] ([CI] ,[Nombre], [Direccion] ,[Carrera] ,[Edad])
     VALUES ('2000-3030' ,'José Miguel Guevara' ,'La Carpio' , 'Informática', 20)
GO

INSERT INTO [dbo].[Estudiante] ([CI] ,[Nombre], [Direccion] ,[Carrera] ,[Edad])
     VALUES ('2010-1620' ,'Luordes Montes' ,'Managua' , 'Informática', 35)
GO

INSERT INTO [dbo].[Estudiante] ([CI] ,[Nombre], [Direccion] ,[Carrera] ,[Edad])
     VALUES ('2010-1720' ,'Flor Izaguirre' ,'Managua' , 'Informática', 24)
GO

INSERT INTO [dbo].[Estudiante] ([CI] ,[Nombre], [Direccion] ,[Carrera] ,[Edad])
     VALUES ('2010-1820' ,'Juan José Salmeron' ,'Masaya' , 'Informática', 25)
GO

INSERT INTO [dbo].[Estudiante] ([CI] ,[Nombre], [Direccion] ,[Carrera] ,[Edad])
     VALUES ('2010-1920' ,'Agustina Fonseca' ,'Granada' , 'Informática', 21)
GO

INSERT INTO [dbo].[Estudiante] ([CI] ,[Nombre], [Direccion] ,[Carrera] ,[Edad])
     VALUES ('2010-2020' ,'Maria Patricia Castañeda' ,'Managua' , 'Contabilidad', 25)
GO

INSERT INTO [dbo].[Estudiante] ([CI] ,[Nombre], [Direccion] ,[Carrera] ,[Edad])
     VALUES ('2010-2120' ,'Victor Rodriguez' ,'Managua' , 'Derecho', 35)
GO

INSERT INTO [dbo].[Estudiante] ([CI] ,[Nombre], [Direccion] ,[Carrera] ,[Edad])
     VALUES ('2010-2220' ,'Blanca Estela Garcia' ,'Cuidad Dario' , 'Periodismo', 28)
GO

 


-- INSERCION DE PRESTAMOS 
INSERT INTO [dbo].[Prestamo] ([IdLector] ,[IdLibro] ,[FechaPrestamo] ,[FechaDevolucion] ,[Devuelto]) 
SELECT E.IdLector, L.IdLibro, '04/08/2007', '04/10/2007', 'FALSE'
  FROM [dbo].[Libro] L, [dbo].[Estudiante]  E
  WHERE UPPER(L.Titulo) = UPPER('ANTOLOGÍA POÉTICA')
		AND UPPER(E.Nombre) = UPPER('Felipe Loayza Beramendi')
GO

INSERT INTO [dbo].[Prestamo] ([IdLector] ,[IdLibro] ,[FechaPrestamo] ,[FechaDevolucion] ,[Devuelto]) 
SELECT E.IdLector, L.IdLibro, '04/11/2007', '04/12/2007', 'TRUE'
  FROM [dbo].[Libro] L, [dbo].[Estudiante]  E
  WHERE UPPER(L.Titulo) = UPPER('Versos desvelados')
		AND UPPER(E.Nombre) = UPPER('Felipe Loayza Beramendi')
GO

INSERT INTO [dbo].[Prestamo] ([IdLector] ,[IdLibro] ,[FechaPrestamo] ,[FechaDevolucion] ,[Devuelto]) 
SELECT E.IdLector, L.IdLibro, '05/02/2007', '05/05/2007', 'FALSE'
  FROM [dbo].[Libro] L, [dbo].[Estudiante]  E
  WHERE UPPER(L.Titulo) = UPPER('La confesión del Libio')
		AND UPPER(E.Nombre) = UPPER('Felipe Loayza Beramendi')
GO

INSERT INTO [dbo].[Prestamo] ([IdLector] ,[IdLibro] ,[FechaPrestamo] ,[FechaDevolucion] ,[Devuelto]) 
SELECT E.IdLector, L.IdLibro, '05/10/2007', '05/30/2007', 'FALSE'
  FROM [dbo].[Libro] L, [dbo].[Estudiante]  E
  WHERE UPPER(L.Titulo) = UPPER('Llumantia Ilíquida')
		AND UPPER(E.Nombre) = UPPER('Felipe Loayza Beramendi')
GO

INSERT INTO [dbo].[Prestamo] ([IdLector] ,[IdLibro] ,[FechaPrestamo] ,[FechaDevolucion] ,[Devuelto]) 
SELECT E.IdLector, L.IdLibro, '04/30/2007', '05/15/2007', 'TRUE'
  FROM [dbo].[Libro] L, [dbo].[Estudiante]  E
  WHERE UPPER(L.Titulo) = UPPER('Animales heridos')
		AND UPPER(E.Nombre) = UPPER('Felipe Loayza Beramendi')
GO

INSERT INTO [dbo].[Prestamo] ([IdLector] ,[IdLibro] ,[FechaPrestamo] ,[FechaDevolucion] ,[Devuelto]) 
SELECT E.IdLector, L.IdLibro, '02/28/2007', '04/10/2007', 'TRUE'
  FROM [dbo].[Libro] L, [dbo].[Estudiante]  E
  WHERE UPPER(L.Titulo) = UPPER('SQL SERVER 2014 SOLUCIONES PRÁCTICAS DE ADMINISTRACIÓN')
		AND UPPER(E.Nombre) = UPPER('Fernando Tinoco')
GO

INSERT INTO [dbo].[Prestamo] ([IdLector] ,[IdLibro] ,[FechaPrestamo] ,[FechaDevolucion] ,[Devuelto]) 
SELECT E.IdLector, L.IdLibro, '04/30/2007', '05/15/2007', 'TRUE'
  FROM [dbo].[Libro] L, [dbo].[Estudiante]  E
  WHERE UPPER(L.Titulo) = UPPER('PROGRAMACIÓN DE BASES DE DATOS RELACIONALES')
		AND UPPER(E.Nombre) = UPPER('Luordes Montes')
GO

INSERT INTO [dbo].[Prestamo] ([IdLector] ,[IdLibro] ,[FechaPrestamo] ,[FechaDevolucion] ,[Devuelto]) 
SELECT E.IdLector, L.IdLibro, '04/10/2007', '04/15/2007', 'TRUE'
  FROM [dbo].[Libro] L, [dbo].[Estudiante]  E
  WHERE UPPER(L.Titulo) = UPPER('ADMINISTRACIÓN DE SISTEMAS GESTORES DE BASES DE DATOS. 2ª EDICIÓN')
		AND UPPER(E.Nombre) = UPPER('Luordes Montes')
GO

INSERT INTO [dbo].[Prestamo] ([IdLector] ,[IdLibro] ,[FechaPrestamo] ,[FechaDevolucion] ,[Devuelto]) 
SELECT E.IdLector, L.IdLibro, '04/03/2007', '04/11/2007', 'TRUE'
  FROM [dbo].[Libro] L, [dbo].[Estudiante]  E
  WHERE UPPER(L.Titulo) = UPPER('ADMINISTRACIÓN DE SISTEMAS GESTORES DE BASES DE DATOS. 2ª EDICIÓN')
		AND UPPER(E.Nombre) = UPPER('José Miguel Guevara')
GO

INSERT INTO [dbo].[Prestamo] ([IdLector] ,[IdLibro] ,[FechaPrestamo] ,[FechaDevolucion] ,[Devuelto]) 
SELECT E.IdLector, L.IdLibro, '05/02/2007', '05/10/2007', 'TRUE'
  FROM [dbo].[Libro] L, [dbo].[Estudiante]  E
  WHERE UPPER(L.Titulo) = UPPER('ORACLE ASSETS')
		AND UPPER(E.Nombre) = UPPER('Juan José Salmeron')
GO

INSERT INTO [dbo].[Prestamo] ([IdLector] ,[IdLibro] ,[FechaPrestamo] ,[FechaDevolucion] ,[Devuelto]) 
SELECT E.IdLector, L.IdLibro, '04/01/2007', '04/10/2007', 'TRUE'
  FROM [dbo].[Libro] L, [dbo].[Estudiante]  E
  WHERE UPPER(L.Titulo) = UPPER('ADMINISTRACIÓN DE SISTEMAS GESTORES DE BASES DE DATOS. 2ª EDICIÓN')
		AND UPPER(E.Nombre) = UPPER('Agustina Fonseca')
GO

INSERT INTO [dbo].[Prestamo] ([IdLector] ,[IdLibro] ,[FechaPrestamo] ,[FechaDevolucion] ,[Devuelto]) 
SELECT E.IdLector, L.IdLibro, '05/05/2007', '05/16/2007', 'TRUE'
  FROM [dbo].[Libro] L, [dbo].[Estudiante]  E
  WHERE UPPER(L.Titulo) = UPPER('ADMINISTRACIÓN DE SISTEMAS GESTORES DE BASES DE DATOS. 2ª EDICIÓN')
		AND UPPER(E.Nombre) = UPPER('Flor Izaguirre')
GO

INSERT INTO [dbo].[Prestamo] ([IdLector] ,[IdLibro] ,[FechaPrestamo] ,[FechaDevolucion] ,[Devuelto]) 
SELECT E.IdLector, L.IdLibro, '04/01/2007', '04/10/2007', 'TRUE'
  FROM [dbo].[Libro] L, [dbo].[Estudiante]  E
  WHERE UPPER(L.Titulo) = UPPER('ORACLE ASSETS')
		AND UPPER(E.Nombre) = UPPER('Agustina Fonseca')
GO

