/*Mostrar BD*/
SHOW DATABASES
/*Selecionar BD*/
USE senabooks
/*Mostrar tabelas*/
SHOW TABLES
/*Criar BD*/
CREATE DATABASE senabooks
/*Apagar BD*/
DROP DATABASE test
/*Criação de tabelas BD*/
CREATE TABLE medico (
idMedico INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nomeMedico VARCHAR(50) NOT null,
loginMedico VARCHAR(50) NOT null,
senha CHAR(8) NOT null,
crm CHAR(8) NOT null
);
CREATE TABLE recepcionista (
idRecepcionista INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
nomeRecepcionista VARCHAR(50) NOT NULL,
loginRecepcionista VARCHAR(50) NOT NULL,
senha CHAR(8) NOT NULL,
celular CHAR(11) NOT NULL,
nomeLogradouro VARCHAR(50) NOT NULL,
numero VARCHAR(7) NOT NULL,
complemento VARCHAR (10) NULL,
cidade VARCHAR(30) NOT NULL,
cep CHAR(11) NOT NULL,
estado CHAR(2) NOT NULL
);
CREATE TABLE paciente(
idPaciente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
dataNascimento DATETIME NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
email VARCHAR(50) NULL DEFAULT 'Não Informado"',
tipoSanguineo VARCHAR(3) NOT NULL,
doencaPaciente VARCHAR(255) NOT NULL,
CONSTRAINT chk_tipoSanguineo CHECK
(tipoSanguineo='A+' OR tipoSanguineo='A-' OR
tipoSanguineo='AB+' OR tipoSanguineo='AB-' OR
tipoSanguineo='B+' OR tipoSanguineo='B-' OR
tipoSanguineo='O+' OR tipoSanguineo='O-')
);

CREATE TABLE consulta(
idConsulta INT PRIMARY KEY AUTO_INCREMENT,
idPaciente INT NOT NULL,
idMedico INT NOT NULL,
idRecepcionista INT NOT NULL,
dataHoraConsulta DATETIME NOT NULL,
tipoConsulta SMALLINT DEFAULT 0,
/*0-Primeira vez 1-Retorno*/ 
observacoes VARCHAR(255),
valor DECIMAL(7,2),
CONSTRAINT fk_ConsultaPaciente FOREIGN KEY (idPaciente)
REFERENCES Paciente(idPaciente),

CONSTRAINT fk_ConsultaMedico FOREIGN KEY (idMedico)
REFERENCES medico(idMedico),

CONSTRAINT fk_ConsultaRecepcionista FOREIGN KEY (idRecepcionista)
REFERENCES Recepcionista(idRecepcionista)
);

SHOW TABLES /*mostra as tabelas do banco de dados selecionado*/