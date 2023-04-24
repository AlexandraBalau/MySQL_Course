/* Crearea unei tabele*/

CREATE TABLE owners (
    firstName VARCHAR(25) NOT NULL,
    lastName VARCHAR(25) NOT NULL
);

/*Adaugarea unei coloane noi intr-o tabela*/
alter table owners
add column age int;

/*Stergerea unei coloane dintr-o tabela*/
alter table owners drop age;
alter table owners drop column age;

/*MODIFY - poate sa modifice proprietatile unei coloane
ATENTIE!!!
Daca in momentul in care executam instructiunea nu specificam toate proprietatile pe care le-am specificat la creare, ele vor fi sterse "not null" => "null"
*/

desc onwers; -- arata structura tabelei
alter table owners modify firstName char(25) not null;
alter table owners modify lastName char(25) not null;

/*Instructiunea de CHANGE ne ajuta sa schimbam numele unei coaloane*/
alter table owners change lastName ownerLastName char(25) not null;

/*Instructiunea de RENAME ne ajuta sa schimbam numele tabelei*/

alter table owners rename to petOwner;

/*Instructiunea DROP TABLE sterge tabela impreuna cu toate informatiile*/
drop table petOwner; -- atentie se va STERGE TABELA impreuna cu toate informatiile din ea si nu se mai poate recupera