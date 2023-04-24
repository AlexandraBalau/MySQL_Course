select * from owners; -- * reprezinta toate datele din baza de date

select firstName, lastName from owners; -- ii specific ce anume sa returneze

alter table owners add column age int;
insert into owners (firstName, lastName, dateOfBirth, age)
values ('Jimmy', 'Hello', '1980-12-01', '23'),
	  ('Jack', 'Yellow', '1989-11-21', '25'),
      ('Winston', 'Churchill', '1956-05-06', '82');
      
select * from owners;

alter table owners add column city varchar(50);

update owners set city = 'Cluj' where firstName = 'John';
update owners set dateOfBirth = '1987-05-06' where firstName = 'Winston';

select * from owners where age = 25; -- WHERE este clauza care ne permite sa folosim operatori de comparare
select * from owners where age <= 25;

select * from owners where dateOfBirth > '1979-10-02';

select * from owners where firstName in ('Jimmy','Jack');
select * from owners where firstName not in ('Jimmy','Jack');
select * from owners where city is null;
select * from owners where city is not null;

update owners set age = '45' where firstName = 'Jimmy';
update owners set age = '51' where firstName = 'Tom';
select * from owners where age != 25;
select * from owners where firstName != 'John';
select * from owners where firstName <> 'John'; -- <> exclude rezultatele, este egal cu !=

select * from owners where age between 40 and 60; -- between include si limitele, capetele intervalelor

select * from owners;
select * from owners where firstName like 'j%'; -- % inclocuieste restul caracterelor
select * from owners where lastName like '%n'; -- % inclocuieste restul caracterelor
select * from owners where lastName like '%e%'; -- % inclocuieste restul caracterelor

select * from owners where dateOfBirth like '1980%';
select * from owners where dateOfBirth like '198%';
select * from owners where dateOfBirth like '%31';
select * from owners where dateOfBirth like '%06%';
select * from owners where dateOfBirth like '%-06-%';

select * from owners where firstName like "%n" and dateOfBirth like '%19';
select * from owners 
where firstName like "%n" 
or dateOfBirth like '%19';

select * from owners 
where (firstName like "%n" 
or dateOfBirth like '%19')
and city = 'Cluj';

select sum(age) from owners;
select avg(age) from owners;
select min(age) from owners;
select max(age) from owners;
select count(*) from owners;
select count(city) from owners;