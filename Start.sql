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

/*Inserindo dois ou mais registros*/
INSERT INTO medico (nomeMedico,loginMedico,senha,crm)
VALUES ('Dra.Rosana','rosana@gmail.com','12345678','666333MG');
 
INSERT INTO medico (nomeMedico,loginMedico,senha,crm)
VALUES ('Dr.Heitor','heitor@gmail.com','12345678','555333SP');
 
/*Filtro e Operadores*/
SELECT idMedico, nomeMedico, CRM FROM medico
WHERE idMedico >= 2 AND idMedico <= 5 

/*Filtros com between*/
SELECT idMedico, nomeMedico, CRM FROM medico
WHERE idMedico BETWEEN 2 AND 5 
 
INSERT INTO medico (nomeMedico,loginMedico,senha,crm)
VALUES  ('Dr.Ricardo','ricardo@gmail.com','12345678','777222MG'),
('Dr.Graziella','graziella@gmail.com','12345678','555111RJ');
 
SELECT nomeMedico,crm FROM medico /*Escolhendo algumas colunas*/
SELECT * FROM medico /*Trazendo todas as colunas*/
 
/*Insert Explícito*/
INSERT INTO medico (crm, nomeMedico,senha,loginMedico)
VALUES ('666111SP','Dra Ana Maria de novo','','anamaria@gmail.com');

UPDATE medico
SET senha= 14022005, 
	loginMedico= 'anamariabrog@gmail.com'
WHERE idMedico = 7;

/*Insert Implícito*/
INSERT INTO medico
VALUES (6,'Dr.Sergio Malandro','serginhomala@gmail.com','12332122','123456SP');

/*Excluir Registros*/
DELETE FROM medico
WHERE idMedico = 6

/*Filtro com like*/
SELECT crm, nomeMedico, loginMedico FROM medico
where loginMedico LIKE 'an%'

/*Ordenando resultados de uma consulta*/
SELECT * FROM medico
ORDER BY loginMedico ASC /*crescente*/

SELECT * FROM medico
ORDER BY loginMedico ASC /*decrescente*/

SELECT * FROM paciente

SELECT * FROM recepcionista

/*Inserindo 3 pacientes*/
INSERT INTO paciente (nome, dataNascimento, cpf, email, tipoSanguineo, doencaPaciente)
VALUES ('Josefino Pereira', '1964-05-3 06:37','57863407902', 'josefino@gmail.com', 'O+', 'Tuberculose')

INSERT INTO paciente (nome, dataNascimento, cpf, tipoSanguineo)
VALUES ('Marizete Silva','1953-02-14 12:30:18','12398764503','AB-')

INSERT INTO paciente (nome, dataNascimento, cpf, email, tipoSanguineo, doencaPaciente)
VALUES ('Matheus Marani', '2006-12-06 21:58:32', '45689635712', 'matheusmarani12@gmail.com', 'A+', 'Câncer Terminal Pulmonar')

UPDATE paciente
SET
WHERE idPaciente =

/*Inserindo 3 recepcionistas*/

UPDATE recepcionista
SET cidade = 'São Vicente'
WHERE idRecepcionista = 2

INSERT INTO recepcionista (nomeRecepcionista, loginRecepcionista, senha, celular, nomeLogradouro, numero, complemento, cidade, cep, estado)
VALUES ('Fabiana Nascimento', 'fabiananascimento', '14021984', '13974118720', 'Conselheiro Nébias', '309', 'Apart.', 'Santos', '11015-003', 'SP')

INSERT INTO recepcionista (nomeRecepcionista, loginRecepcionista, senha, celular, nomeLogradouro, numero, complemento, cidade, cep, estado)
VALUES ('Kauan Quaresma', 'kauanbeck', 'eujgolol', '13974586234', 'Carijós', '23', 'Casa', 'São Vicente', '11687698', 'SP')

INSERT INTO recepcionista (nomeRecepcionista, loginRecepcionista, senha, celular, nomeLogradouro, numero, complemento, cidade, cep, estado)
VALUES ('Arley Siaci', 'arleydocente', 'arley123', '13974235487', 'Guarani', '574', 'Casa', 'São Vicente', '11654895', 'SP')