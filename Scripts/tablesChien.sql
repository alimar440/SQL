
               
create table proprietaire (numProp int constraint PKProprietaire primary key,  nomProp varchar(     adrProp varchar(12));
    
create table chien (numChien varchar(7) constraint PKChien primary key, 
                    nomChien varchar(12), 
                    race varchar(25), 
                    sexe varchar(1), 
                    dateNais date, 
                    numPropCourant int, 
                    dateDeces date
                    );    
                          
create table concours (numConcours int constraint PKConcours primary key, 
                      lieu varchar(12), 
                      typeConcours varchar(12), 
                      dateConcours date);
                      
create table participe (numChien varchar(7), 
                        numConcours int, 
                        constraint PKParticipe primary key(numChien, numConcours));
                       
                        
create table estClasse (numChien varchar(7), 
                        numConcours int, 
                        classement int,
                        constraint PKEstClasse primary key(numChien, numConcours));
                       
                        
create table vendu (numPropVendeur int, 
                    numChien varchar(7), 
                    dateVente date,
                    constraint PKVendu primary key(numPropVendeur, numChien));
                  
                    
create table aPourParent (numChiot varchar(7), 
                          numParent varchar(7),
                          constraint PKAPourParent primary key(numChiot, numParent));
                          
alter table chien add constraint FKChienProp foreign key (numPropCourant) references proprietaire (numProp);

alter table participe add constraint FKParticipeChien foreign key (numChien) references chien (numChien);

alter table participe add constraint FKParticipeConcours foreign key (numConcours) references concours (numConcours);

alter table estClasse add constraint FKEstClasseChien foreign key (numChien) references chien (numChien);

 alter table estClasse add    constraint FKEstClasseConcours foreign key (numConcours) references concours (numConcours);
                        
alter table vendu add  constraint FKVenduProp foreign key (numPropVendeur) references proprietaire (numProp);


alter table vendu add    constraint FKVenduChien foreign key (numChien) references chien (numChien);
                    
alter table aPourParent add constraint FKAPourParentChiot foreign key (numChiot) references chien (numChien);


alter table aPourParent add    constraint FKAPourParentParent foreign key (numParent) references chien (numChien);