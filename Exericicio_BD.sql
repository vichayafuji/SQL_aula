CREATE DATABASE Sprint2;
USE Sprint2;
CREATE TABLE Funcionário 

(
idFunc INT primary key auto_increment,
nomeFunc varchar(45),
salario decimal (10,2) check (salario > 0),
genero char(1), check (genero = 'f' or genero = 'm')
);
insert into funcionário values
(null, 'Franklin', 1.99, 'm'),
(null, 'João', 1.98, 'm'),
(null, 'Maria', 2.99,'f');
SELECT * FROM Funcionário;
CREATE TABLE Dependente
(
idDep INT,
nomeDep varchar(45),
dtNasc DATE,
fkFunc int, 
foreign key (fkFunc) references Funcionário(idFunc),
primary key (idDep, fkFunc)
);

insert into Dependente values
(1, 'Laura', '2013-10-13',1),
(2, 'Lauro', '2011-10-12',1),
(1, 'Joana', '1995-10-13',2),
(1, 'Mario', '1998-10-11',3);
SELECT * FROM Dependente;
SELECT * FROM funcionário join dependente on idFunc = fkFunc;
insert into Funcionário values
(null, 'Vivian', 0.99, 'f');
select * from funcionário left join dependente on idFunc = fkFunc where fkFunc is null;
alter table Funcionário add column fkSupervisor int,
add foreign key (fkSupervisor) REFERENCES Funcionário(idFunc);
update funcionário set fkSupervisor = 1 where idFunc IN (2,3);
select * from funcionário JOIN funcionário as supervisor on supervisor.idFunc = funcionário.fkSupervisor;