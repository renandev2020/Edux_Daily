CREATE DATABASE EduX;
USE EduX;



-- CRIA��O DE TABELAS SEM FKS

CREATE TABLE TipoUsuario(
	IdTipoUsuario INT IDENTITY PRIMARY KEY NOT NULL,
	Descricao VARCHAR(20) NOT NULL,
);


CREATE TABLE Instituicao(
	IdInstituicao INT IDENTITY PRIMARY KEY NOT NULL,
	Nome VARCHAR (50) NOT NULL,
);

CREATE TABLE Curso(
	IdCurso INT IDENTITY PRIMARY KEY NOT NULL,
	Nome VARCHAR (50) NOT NULL,
);

CREATE TABLE Categoria(
	IdCategoria INT IDENTITY PRIMARY KEY NOT NULL,
	Titulo VARCHAR (20) NOT NULL,
);




--TABELAS COM FKS

CREATE TABLE Turma(
	IdTurma INT IDENTITY PRIMARY KEY NOT NULL,
	Descricao VARCHAR (50),

--FK
	IdCurso INT FOREIGN KEY REFERENCES Curso(IdCurso),
);


CREATE TABLE Usuario(
	IdUsuario INT IDENTITY PRIMARY KEY NOT NULL,
	Nome VARCHAR(50) NOT NULL,
	Email VARCHAR (100) NOT NULL,
	Senha VARCHAR (200) NOT NULL,
	DataNascimento Date,

--FK
	IdTipoUsuario INT FOREIGN KEY REFERENCES TipoUsuario(IdTipoUsuario),
	IdInstituicao INT FOREIGN KEY REFERENCES Instituicao (IdInstituicao),
	IdTurma INT FOREIGN KEY REFERENCES Turma (IdTurma)
);


CREATE TABLE ProfTurma(
	IdProfTurma INT IDENTITY PRIMARY KEY NOT NULL,

--FK
	IdUsuario INT FOREIGN KEY REFERENCES Usuario (IdUsuario),
	IdTurma INT FOREIGN KEY REFERENCES Turma (IdTurma),
);


CREATE TABLE AlunoTurma(
	IdAlunoTurma INT IDENTITY PRIMARY KEY NOT NULL,

--FK
	IdTurma INT FOREIGN KEY REFERENCES Turma (IdTurma),
	IdUsuario INT FOREIGN KEY REFERENCES Usuario (IdUsuario)
);


CREATE TABLE Objetivo(
	IdObjetivo INT IDENTITY PRIMARY KEY NOT NULL,
	DataObje Date,
	Descricao VARCHAR(50),

--FK
	IdCategoria INT FOREIGN KEY REFERENCES Categoria (IdCategoria)
);


CREATE TABLE ObjetivoAluno(
	IdObjetivoAluno INT IDENTITY PRIMARY KEY NOT NULL,
	Nota VARCHAR(3),
	DataEntrega Date,


--FK
	IdAlunoTurma INT FOREIGN KEY REFERENCES AlunoTurma (IdAlunoTurma),
	IdObjetivo INT FOREIGN KEY REFERENCES Objetivo(IdObjetivo)
);


CREATE TABLE Dica(
	IdDica INT IDENTITY PRIMARY KEY NOT NULL,
	Descricao VARCHAR (255),

--FK
	IdUsuario INT FOREIGN KEY REFERENCES Usuario(IdUsuario)
);


CREATE TABLE Post(
	IdPost INT IDENTITY PRIMARY KEY NOT NULL,
	Texto VARCHAR(200) NOT NULL,
	Imagem VARCHAR (200),
	Curtida INT DEFAULT 0 NOT NULL,

--FK
	IdUsuario INT FOREIGN KEY REFERENCES Usuario(IdUsuario)
);

	
	
	
	










