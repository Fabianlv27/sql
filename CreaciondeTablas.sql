create database MovieStore;
Create Table Tsocio(
cDni Char(9) Not null Primary key,
cNombre Varchar(20) not null ,
cApellidos Varchar(40) not null ,
cDniAval Char(9) not null,
Foreign key (cDniAval) References Tsocio (cDni)
on delete no action
on update cascade
);
Create Table TDirector(
cDni Char(9) Not null Primary key,
cNombre Varchar(20) not null ,
cApellidos Varchar(40) not null ,
cTelefono Char(9),
cNacionalidad varchar(25)
);
Create Table TPelicula(
cCodPelicula Int(9) Not null Primary key,
cTitulo Varchar(45) not null ,
cDesempeño Varchar(255) not null ,
cFechaDeLanzamiento date not null,
cNacionalidad varchar(25) not null,
cProductora varchar(40) not null,
cDirector char(9) not null,
foreign key (cDirector) references TDirector (CDni)
on delete no action
on update cascade
);
Create Table TActor(
cIdActor Char(9) Not null Primary key,
cNombre Varchar(20) not null ,
cApellidos Varchar(40) not null ,
cFotoLink varchar(100),
cNacionalidad varchar(25),
cSexo varchar(10)

);
create table TActorPelicula(
cDniActor char(9) not null,
cPeliculaID int(9) not null,
primary key (cDniActor, cPeliculaId),
foreign key (CDniActor) references TActor (cIdActor),  
foreign key (cPeliculaID) references TActor (cCodPelicula)
)
