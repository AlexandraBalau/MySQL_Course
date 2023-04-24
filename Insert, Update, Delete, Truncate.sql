rename table petowner to owners;
alter table owners change ownerLastName lastName varchar(25);
alter table owners add column dateOfBirth date;

-- Instructiune de INSERT
insert into owners (firstName, lastName, dateOfBirth)
values ('Jim', 'Jameson', '1980-12-01');

-- Instructiune de INSERT cu mai multe randuri inserate concomitent
insert into owners (firstName, lastName, dateOfBirth)
values ('Jimmy', 'Jameson', '1980-12-01'),
	  ('John', 'Wick', '1989-11-21');

-- Instructiune de INSERT fara specificarea coloanelor. ATENTIE!!! iN CAZUL ACESTA TREBUIE SA SPECIFICA obligatoriu numarul exact de valori corespunzator nr de coloane
insert into owners values ('Tom', 'Anderson', '1980-01-31');
insert into owners values ('Tom', 'Anderson'); -- va returna eroarea 1136

-- Verificam rezultatele instructiunii de Insert
select * from owners;

-- ---------------------
update owners set firstName = 'James'; -- ATENTIE!!! aceasta instructiune ne va SCHIMBA TOATE NUMELE din coloana firstName
select * from owners; -- verificam rezultatele instructiunii de update

-- ---------------------
delete from owners; -- STERGEREA tuturor inregistrarilor din tabela
select * from owners; -- verificam rezultatele instructiunii de update

-- ---------------------
truncate table owners; -- STERGEREA tuturor inregistrarilor din tabela
select * from owners; -- verificam rezultatele instructiunii de update

/*Diferenta intre DELETE si TRUNCATE
DELETE = are capacitatea de a numara inregistrarile pe care le sterge; putem sa filtram si sa stergem doar anumite inregistrari
TRUNCATE = sterge fara a numara; nu putem filtra datele sterse
*/










