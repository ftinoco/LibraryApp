USE [BIBLIOTECA]
GO

-- INSERCION AUTORES 
INSERT INTO [dbo].[Autor] ([Nombre] ,[Nacionalidad])
     VALUES ('Luis Alema�' ,'Espa�a')
GO

INSERT INTO [dbo].[Autor] ([Nombre] ,[Nacionalidad])
     VALUES ('Carlos de Tom�s' ,'Espa�a')
GO

INSERT INTO [dbo].[Autor] ([Nombre] ,[Nacionalidad])
     VALUES ('Iv�n Robledo' ,'Espa�a')
GO

INSERT INTO [dbo].[Autor] ([Nombre] ,[Nacionalidad])
     VALUES ('Laura Mart�nez Gimeno' ,'Espa�a')
GO

INSERT INTO [dbo].[Autor] ([Nombre] ,[Nacionalidad])
     VALUES ('M�nica Velasco' ,'Espa�a')
GO

INSERT INTO [dbo].[Autor] ([Nombre] ,[Nacionalidad])
     VALUES ('Antonio Colinas' ,'Espa�a')
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
     VALUES ('La confesi�n del Libio' ,'Amarante' ,'Novela actual')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('Cinco d�as para matar al Papa' ,'Amarante' ,'Novela negra')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('Versos desvelados' ,'Amarante' ,'Poes�a actual')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('Llumantia Il�quida' ,'Amarante' ,'Poes�a actual')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('Animales heridos' ,'Amarante' ,'Poes�a')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('Visual Studio Net' ,'Microsoft' ,'Inform�tica')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('Trazos (En torno a Anglada-Camarasa)' ,'Amarante' ,'Poes�a actual')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('Internet: As� es como todo inicio' ,'Alfa & Omega' ,'Internet')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('Marketing de la era Google.' ,'Anaya' ,'Internet')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('Internet para todos' ,'Anaya' ,'Internet')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('H�gase rico en un click: La gu�a imprescindible para ganar dinero en Internet',
	 'CONECTA' ,'Internet')
GO
 
INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('ANTOLOG�A PO�TICA', 'Alianza Editorial ' ,'Poes�a')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('LA TREGUA', 'Alianza Editorial' ,'Ficci�n moderna y contemporanea')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('PRIMAVERA CON UNA ESQUINA ROTA',  'DEBOLSILLO ' ,'Ficci�n hist�rica')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('PEDRO Y EL CAPIT�N', 'Alianza Editorial' ,'Obras de teatro, textos teatrales')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('GRACIAS POR EL FUEGO',  'Alianza Editorial' ,'Ficci�n moderna y contemporanea')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('EL AMOR, LAS MUJERES Y LA VIDA . POEMAS DE AMOR. ANTOLOG�A', 'VISOR LIBROS' ,'Poes�a')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('SQL SERVER 2014 SOLUCIONES PR�CTICAS DE ADMINISTRACI�N', 'RA-MA EDITORIAL' ,'Base de Datos')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('ORACLE ASSETS', 'RA-MA EDITORIAL' ,'Base de Datos')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('PROGRAMACI�N DE BASES DE DATOS RELACIONALES', 'RA-MA EDITORIAL' ,'Base de Datos')
GO

INSERT INTO [dbo].[Libro] ([Titulo] ,[Editorial] ,[Area])
     VALUES ('ADMINISTRACI�N DE SISTEMAS GESTORES DE BASES DE DATOS. 2� EDICI�N', 'RA-MA EDITORIAL' ,'Base de Datos')
GO



-- INSERCION DE LIBRO - AUTOR
INSERT INTO [dbo].[LibAut] ([IdLibro], [IdAutor])
SELECT L.IdLibro, A.IdAutor 
  FROM [dbo].[Libro] L, [dbo].[Autor]  A
  WHERE UPPER(L.Titulo) = UPPER('La confesi�n del Libio')
		AND UPPER(A.Nombre) = UPPER('Carlos de Tom�s')
GO

INSERT INTO [dbo].[LibAut] ([IdLibro], [IdAutor])
SELECT L.IdLibro, A.IdAutor 
  FROM [dbo].[Libro] L, [dbo].[Autor]  A
  WHERE UPPER(L.Titulo) = UPPER('Cinco d�as para matar al Papa')
		AND UPPER(A.Nombre) = UPPER('Iv�n Robledo')
GO

INSERT INTO [dbo].[LibAut] ([IdLibro], [IdAutor])
SELECT L.IdLibro, A.IdAutor 
  FROM [dbo].[Libro] L, [dbo].[Autor]  A
  WHERE UPPER(L.Titulo) = UPPER('Versos desvelados')
		AND UPPER(A.Nombre) = UPPER('Laura Mart�nez Gimeno')
GO

INSERT INTO [dbo].[LibAut] ([IdLibro], [IdAutor])
SELECT L.IdLibro, A.IdAutor 
  FROM [dbo].[Libro] L, [dbo].[Autor]  A
  WHERE UPPER(L.Titulo) = UPPER('Llumantia Il�quida')
		AND UPPER(A.Nombre) = UPPER('M�nica Velasco')
GO

INSERT INTO [dbo].[LibAut] ([IdLibro], [IdAutor])
SELECT L.IdLibro, A.IdAutor
  FROM [dbo].[Libro] L, [dbo].[Autor]  A
  WHERE UPPER(L.Titulo) = UPPER('Animales heridos')
		AND UPPER(A.Nombre) = UPPER('Luis Alema�')
GO

INSERT INTO [dbo].[LibAut] ([IdLibro], [IdAutor])
SELECT L.IdLibro, A.IdAutor 
  FROM [dbo].[Libro] L, [dbo].[Autor]  A
  WHERE UPPER(L.Titulo) = UPPER('Trazos (En torno a Anglada-Camarasa)')
		AND UPPER(A.Nombre) = UPPER('M�nica Velasco')
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
  WHERE UPPER(L.Titulo) = UPPER('H�gase rico en un click: La gu�a imprescindible para ganar dinero en Internet')
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
  WHERE UPPER(L.Titulo) = UPPER('PEDRO Y EL CAPIT�N')
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
  WHERE UPPER(L.Titulo) = UPPER('EL AMOR, LAS MUJERES Y LA VIDA . POEMAS DE AMOR. ANTOLOG�A')
		AND UPPER(A.Nombre) = UPPER('Mario Benedetti')
GO

INSERT INTO [dbo].[LibAut] ([IdLibro], [IdAutor])
SELECT L.IdLibro, A.IdAutor
  FROM [dbo].[Libro] L, [dbo].[Autor]  A
  WHERE UPPER(L.Titulo) = UPPER('ANTOLOG�A PO�TICA')
		AND UPPER(A.Nombre) = UPPER('Mario Benedetti')
GO



-- INSERCION DE ESTUDIANTES
INSERT INTO [dbo].[Estudiante] ([CI] ,[Nombre], [Direccion] ,[Carrera] ,[Edad])
     VALUES ('2010-1520' ,'Fernando Tinoco' ,'Managua' , 'Inform�tica', 25)
GO

INSERT INTO [dbo].[Estudiante] ([CI] ,[Nombre], [Direccion] ,[Carrera] ,[Edad])
     VALUES ('2006-7979' ,'Felipe Loayza Beramendi', 'San Jos�', 'Derecho', 22)
GO

INSERT INTO [dbo].[Estudiante] ([CI] ,[Nombre], [Direccion] ,[Carrera] ,[Edad])
     VALUES ('2000-3030' ,'Jos� Miguel Guevara' ,'La Carpio' , 'Inform�tica', 20)
GO

INSERT INTO [dbo].[Estudiante] ([CI] ,[Nombre], [Direccion] ,[Carrera] ,[Edad])
     VALUES ('2010-1620' ,'Luordes Montes' ,'Managua' , 'Inform�tica', 35)
GO

INSERT INTO [dbo].[Estudiante] ([CI] ,[Nombre], [Direccion] ,[Carrera] ,[Edad])
     VALUES ('2010-1720' ,'Flor Izaguirre' ,'Managua' , 'Inform�tica', 24)
GO

INSERT INTO [dbo].[Estudiante] ([CI] ,[Nombre], [Direccion] ,[Carrera] ,[Edad])
     VALUES ('2010-1820' ,'Juan Jos� Salmeron' ,'Masaya' , 'Inform�tica', 25)
GO

INSERT INTO [dbo].[Estudiante] ([CI] ,[Nombre], [Direccion] ,[Carrera] ,[Edad])
     VALUES ('2010-1920' ,'Agustina Fonseca' ,'Granada' , 'Inform�tica', 21)
GO

INSERT INTO [dbo].[Estudiante] ([CI] ,[Nombre], [Direccion] ,[Carrera] ,[Edad])
     VALUES ('2010-2020' ,'Maria Patricia Casta�eda' ,'Managua' , 'Contabilidad', 25)
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
  WHERE UPPER(L.Titulo) = UPPER('ANTOLOG�A PO�TICA')
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
  WHERE UPPER(L.Titulo) = UPPER('La confesi�n del Libio')
		AND UPPER(E.Nombre) = UPPER('Felipe Loayza Beramendi')
GO

INSERT INTO [dbo].[Prestamo] ([IdLector] ,[IdLibro] ,[FechaPrestamo] ,[FechaDevolucion] ,[Devuelto]) 
SELECT E.IdLector, L.IdLibro, '05/10/2007', '05/30/2007', 'FALSE'
  FROM [dbo].[Libro] L, [dbo].[Estudiante]  E
  WHERE UPPER(L.Titulo) = UPPER('Llumantia Il�quida')
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
  WHERE UPPER(L.Titulo) = UPPER('SQL SERVER 2014 SOLUCIONES PR�CTICAS DE ADMINISTRACI�N')
		AND UPPER(E.Nombre) = UPPER('Fernando Tinoco')
GO

INSERT INTO [dbo].[Prestamo] ([IdLector] ,[IdLibro] ,[FechaPrestamo] ,[FechaDevolucion] ,[Devuelto]) 
SELECT E.IdLector, L.IdLibro, '04/30/2007', '05/15/2007', 'TRUE'
  FROM [dbo].[Libro] L, [dbo].[Estudiante]  E
  WHERE UPPER(L.Titulo) = UPPER('PROGRAMACI�N DE BASES DE DATOS RELACIONALES')
		AND UPPER(E.Nombre) = UPPER('Luordes Montes')
GO

INSERT INTO [dbo].[Prestamo] ([IdLector] ,[IdLibro] ,[FechaPrestamo] ,[FechaDevolucion] ,[Devuelto]) 
SELECT E.IdLector, L.IdLibro, '04/10/2007', '04/15/2007', 'TRUE'
  FROM [dbo].[Libro] L, [dbo].[Estudiante]  E
  WHERE UPPER(L.Titulo) = UPPER('ADMINISTRACI�N DE SISTEMAS GESTORES DE BASES DE DATOS. 2� EDICI�N')
		AND UPPER(E.Nombre) = UPPER('Luordes Montes')
GO

INSERT INTO [dbo].[Prestamo] ([IdLector] ,[IdLibro] ,[FechaPrestamo] ,[FechaDevolucion] ,[Devuelto]) 
SELECT E.IdLector, L.IdLibro, '04/03/2007', '04/11/2007', 'TRUE'
  FROM [dbo].[Libro] L, [dbo].[Estudiante]  E
  WHERE UPPER(L.Titulo) = UPPER('ADMINISTRACI�N DE SISTEMAS GESTORES DE BASES DE DATOS. 2� EDICI�N')
		AND UPPER(E.Nombre) = UPPER('Jos� Miguel Guevara')
GO

INSERT INTO [dbo].[Prestamo] ([IdLector] ,[IdLibro] ,[FechaPrestamo] ,[FechaDevolucion] ,[Devuelto]) 
SELECT E.IdLector, L.IdLibro, '05/02/2007', '05/10/2007', 'TRUE'
  FROM [dbo].[Libro] L, [dbo].[Estudiante]  E
  WHERE UPPER(L.Titulo) = UPPER('ORACLE ASSETS')
		AND UPPER(E.Nombre) = UPPER('Juan Jos� Salmeron')
GO

INSERT INTO [dbo].[Prestamo] ([IdLector] ,[IdLibro] ,[FechaPrestamo] ,[FechaDevolucion] ,[Devuelto]) 
SELECT E.IdLector, L.IdLibro, '04/01/2007', '04/10/2007', 'TRUE'
  FROM [dbo].[Libro] L, [dbo].[Estudiante]  E
  WHERE UPPER(L.Titulo) = UPPER('ADMINISTRACI�N DE SISTEMAS GESTORES DE BASES DE DATOS. 2� EDICI�N')
		AND UPPER(E.Nombre) = UPPER('Agustina Fonseca')
GO

INSERT INTO [dbo].[Prestamo] ([IdLector] ,[IdLibro] ,[FechaPrestamo] ,[FechaDevolucion] ,[Devuelto]) 
SELECT E.IdLector, L.IdLibro, '05/05/2007', '05/16/2007', 'TRUE'
  FROM [dbo].[Libro] L, [dbo].[Estudiante]  E
  WHERE UPPER(L.Titulo) = UPPER('ADMINISTRACI�N DE SISTEMAS GESTORES DE BASES DE DATOS. 2� EDICI�N')
		AND UPPER(E.Nombre) = UPPER('Flor Izaguirre')
GO

INSERT INTO [dbo].[Prestamo] ([IdLector] ,[IdLibro] ,[FechaPrestamo] ,[FechaDevolucion] ,[Devuelto]) 
SELECT E.IdLector, L.IdLibro, '04/01/2007', '04/10/2007', 'TRUE'
  FROM [dbo].[Libro] L, [dbo].[Estudiante]  E
  WHERE UPPER(L.Titulo) = UPPER('ORACLE ASSETS')
		AND UPPER(E.Nombre) = UPPER('Agustina Fonseca')
GO

