--remplissage de la table Serpents
insert into Serpents values ('Satus','M',152,1857,'O','macho');
insert into Serpents values ('Birdy','M',258,4787,'N','timide');
insert into Serpents values ('Nessia','F',128,1582,'O','sincere');
insert into Serpents values ('MissMad','F',183,2781,'N','volage');
insert into Serpents values ('Bolong','M',213,2754,'O','macho');
insert into Serpents values ('Miloch','M',83,718,'O','timide');
insert into Serpents values ('Nessie','M',168,1721,'N','macho');
insert into Serpents values ('Tarak','F',123,851,'O','timide');
insert into Serpents values ('Solong','M',173,1481,'O','timide');

--remplissage de la table Amours
insert into Amours values('Satus','Tarak','passionnement');
insert into Amours values('Birdy','Nessia','beaucoup');
insert into Amours values('Nessia','Miloch','a la folie');
insert into Amours values('Miloch','Nessia','a la folie');
insert into Amours values('Tarak','Bolong','un peu');
insert into Amours values('Bolong','Tarak','beaucoup');
insert into Amours values('Nessie','Tarak','un peu');

--remplissage de la table Nourritures
insert into Nourritures values('hamster',7);
insert into Nourritures values('grenouille',10);
insert into Nourritures values('souris',25);
insert into Nourritures values('rat',15);
insert into Nourritures values('lapin',3);
insert into Nourritures values('lézard',35);

--remplissage de la table Repas
insert into Repas values('Satus','grenouille',1000);
insert into Repas values('Satus','hamster',16);
insert into Repas values('Bolong','rat',4);
insert into Repas values('Nessia','souris',6);
insert into Repas values('Nessia','rat',1);
insert into Repas values('Miloch','grenouille',100);
insert into Repas values('Tarak','hamster',10);
insert into Repas values('Tarak','souris',10);
insert into Repas values('Solong','rat',6);
insert into Repas values('Solong','souris',2);
insert into Repas values('Miloch','lapin',53);
insert into Repas values('Nessie','lézard',20);
insert into Repas values('Solong','lézard',1);
