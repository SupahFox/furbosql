create database palaciodelamusica;
use palaciodelamusica;

create table artista(
ID int primary key,
nombre varchar(50),
descripcion varchar(50),
fecha_Alta date
);

create table album(
ID int primary key,
ID_Artista int,
nombre varchar(50),
año int
);

create table genero(
ID int primary key,
nombre varchar(50)
);

create table album_genero(
ID_Album int,
ID_Genero int,

primary key(ID_Album, ID_Genero)
);

create table cancion(
ID int primary key,
Nombre varchar(50),
ID_Album int,
Duracion varchar(50),
Costo int
);

create table lista(
ID int primary key,
Nombre varchar(50),
Descripcion varchar(50)
);

select Nombre from cancion order by ID ASC;

select Nombre from cancion where ID_Album in(select id from album where año = 2021);

select Nombre from Cancion C
join Album A
on C.ID_Album = A.ID
join Artista AR
on A.ID_Artista = AR.ID 
where AR.Nombre = "Buitres";
 
select Nombre, Duracion from Cancion C
join Album A
on C.ID_Album = A.ID 
where A.Nombre = "Piece of Mind";
  
select Nombre, Duracion from Cancion C 
join Album A
on C.ID_Album = A.ID
join Artista AR
on A.ID_Artista = AR.ID 
where A.Nombre = "Maroon 5" and AR.Nombre = "Red Pill Blues";

select Nombre, Duracion from Cancion C
join Album A
on C.ID_Album = A.ID 
join Genero G
on A.ID_Genero = G.ID
where G.Nombre and count(C.Nombre);
 
select Nombre, Duracion from Cancion C
join Album A
on C.ID_Album = A.ID 
where A.Nombre = "Best of Pink Floyd";

select ID, Fecha from factura F
join Cliente CL
on F.ID = CL.ID
where CL.Nombre = "Juan Perez" and F.Fecha = "2022-05-10";


