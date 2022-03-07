CREATE DATABASE Carometro_Nota10;
GO


USE Carometro_Nota10;
GO

DROP DATABASE Carometro_Nota10;

---DROP TABLE---
DROP TABLE ALUNO;
GO
DROP TABLE SALA;
GO
DROP TABLE PROFESSOR;
GO
DROP TABLE MATERIA;
GO
DROP TABLE USUARIO;
GO
DROP TABLE TIPO_USUARIO;
GO


---TRUNCATE TABLE---
TRUNCATE TABLE ALUNO;
GO
TRUNCATE TABLE PROFESSOR;
GO
TRUNCATE TABLE SALA;
GO
TRUNCATE TABLE MATERIA;
GO
TRUNCATE TABLE USUARIO;
GO
TRUNCATE TABLE TIPO_USUARIO;
GO


---TABLES---
CREATE TABLE TIPO_USUARIO(
	idTipoUsuario SMALLINT PRIMARY KEY IDENTITY(1,1),
	nomeTipoUser VARCHAR(50)

);
GO
CREATE TABLE USUARIO(
	idUsuario SMALLINT PRIMARY KEY IDENTITY (1,1),
	idTipoUsuario SMALLINT FOREIGN KEY REFERENCES TIPO_USUARIO(idTipoUsuario),
	email VARCHAR(50) UNIQUE,
	senha VARCHAR(61),
	nomeUsuario VARCHAR(50),
	fotoUsuario VARCHAR(200)

);
GO
CREATE TABLE MATERIA(
	idMateria SMALLINT PRIMARY KEY IDENTITY (1,1),
	nomeMateria VARCHAR(100)

);
GO
CREATE TABLE PROFESSOR(
	idProfessor SMALLINT PRIMARY KEY IDENTITY (1,1),
	idUsuario SMALLINT FOREIGN KEY REFERENCES USUARIO(idUsuario),
	idMateria SMALLINT FOREIGN KEY REFERENCES MATERIA(idMateria),
	cfpe CHAR(11)

);
GO
CREATE TABLE SALA(
	idSala SMALLINT PRIMARY KEY IDENTITY (1,1),
	idProfessor SMALLINT FOREIGN KEY REFERENCES PROFESSOR(idProfessor),
	nomeSala VARCHAR(50),
	numeroSala VARCHAR(20)

);
GO
CREATE TABLE ALUNO(
	idAluno SMALLINT PRIMARY KEY IDENTITY (1,1),
	idSala SMALLINT FOREIGN KEY REFERENCES SALA(idSala),
	nomeAluno VARCHAR(50),
	rm VARCHAR(20),
	telefone VARCHAR(11),
	fotoDoPerfil VARCHAR(MAX),
	situacao VARCHAR(20)

);
GO