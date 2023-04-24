alter table owners add column ownerId int primary key auto_increment;
alter table owners modify column ownerId int auto_increment first; -- cand folosim modify trebuie sa specificam toate proprietatile pe care le vedem in coloana "auto_increment"
-- valoarea de auto_increment ne ajuta sa primim valoarea pentru ownerID automat: 1, 2, 3, 4....n 

desc owners; -- prescurtarea de la describe

select * from owners;
insert into owners (firstname, lastname, dateofbirth, age) values ('Ion', 'Popescu', '1993-04-17', 30);

create table pets (
petid int not null auto_increment,
race varchar(45) not null,
dateofbirth date not null,
ownerid int not null,
primary key (petid),
constraint fk_pets_owners foreign key (ownerid) references owners (ownerid) -- fk = foreign key + pets (tabela de la care se pleaca) + owners (tabela in care ajungem)
);

select * from owners;
select * from pets;
insert into pets (race, dateOfBirth, ownerid)
values ('european','2020-02-15', 4), -- cheia primara trebuie sa existe, in exemplul nostru 10
('spitz','2020-05-19', 6),
('dog german','2020-01-27', 6),
('dog german','2020-04-23', 10),
('pisica norvegiana','2020-01-30', 9);

select * from owners cross join pets;
select * from owners inner join pets on owners.ownerId = pets.ownerid;
select * from owners left join pets on owners.ownerId = pets.ownerid;
select * from owners left join pets on owners.ownerId = pets.ownerid where pets.ownerid is null;
select * from owners left join pets on owners.ownerId = pets.ownerid where pets.ownerid is not null; -- rzultat identic cu inner join
select * from owners right join pets on owners.ownerId = pets.ownerid; 

-- Cross join - se vor aduce toate combinatiile intre inregistrarile din tabela din dreapta si cea din stanga
-- Inner join - se vor aduce toate datele care exista in ambele table, comparatia facuandu-se pe coloana pe care se face conditia de join
-- Left join - se aduc toate inregistrarile din tabela din stanga si se compara cu cele din dreapta
		    -- astfel se vor aduce toate randurile din tabela din stanga, iar pe coloanele aferente tabelei din dreapta se vor complpeta doar pentru randurile care au echivalent
            -- adica cele a caror cheie primara exista in tabela din stanga
            
select * from owners;
select * from owners order by dateOfBirth; -- sortarea se va face by default ascendent
select * from owners order by dateOfBirth desc; -- desc = descending
select * from owners order by age desc limit 8; -- in functie de numarul pe care il alegem, sistemul va returna acel numar de inregistrari, ex 8 varste descrescatoare
select max(age) from owners;

-- In mod normal filtrarea se face cu clauza where, singura exceptie fiind functiile agregate care se pot filtra doar cu clauza HAVING
select o.ownerid, firstName, lastName, count(petid) -- o si p vin din numele tabelei
from owners o inner join pets p on o.ownerId = p.ownerid
group by o.ownerId, firstName, lastName
having count(petid) > 2;

-- Aliases
select * from owners o inner join pets p on o.ownerId = p.ownerid;

select o.ownerid, firstName, lastName, race, o.dateOfBirth ownerBirthDate, p.dateOfBirth petBirthDate
from owners o inner join pets p on o.ownerId = p.ownerid;

select o.ownerid, firstName, lastName, race, o.dateOfBirth owner, p.dateOfBirth pet
from owners o inner join pets p on o.ownerId = p.ownerid;