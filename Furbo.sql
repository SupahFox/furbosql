create database mundial;
use mundial;

create table persona(
CI int primary key,
nombre varchar(50),
Apellido varchar(50),
telefono int,
Fecha_Nacimiento datetime,
Nacionalidad varchar(50)
);

create table jugador(
CI_jug int,
Cod_jug int,
Numero_de_camiseta int,
primary key(CI_jug),
Nombre varchar(50),
Apellido varchar(50),
Fecha_de_nacimiento datetime,
Nacionalidad varchar(50),
Posicion varchar(50)
 );
 
 insert into jugador(CI_jug,Cod_jug,nombre)  value ("Santi") ;
create table arbitro(
CI_ar int,
Cod_ar int,
primary key(CI_ar),
Nombre varchar(50),
Apellido varchar(50),
Fecha_Nacimiento datetime,
Nacionalidad varchar(50),
Rol varchar(50)
 );
 
create table telefono(
CI int,
num int,
Primary key(CI),
foreign key (CI) references persona(CI),
foreign key (CI) references jugador(CI_jug),
foreign key (CI) references arbitro(CI_ar)
);

create table cuerpo_tecnico(
cod_ct int primary key,
rol varchar(50)
);
 
create table estadio(
Cod_Estadio int primary key,
Nombre varchar(50),
Capacidad int,
Localizacion varchar(50)
);
 
create table seleccion(
Cod_Seleccion int primary key,
Nombre varchar(50),
Puntos int,
Grupo varchar(50),
Goles int,
Posicion_Grupo int
);
 
create table jug_Contra(
Cod_Seleccion1 int,
Cod_Seleccion2 int,
primary key (Cod_Seleccion1, Cod_Seleccion2),
foreign key(Cod_Seleccion1)references Seleccion(Cod_Seleccion),
foreign key(Cod_Seleccion2)references Seleccion(Cod_Seleccion)
);
create table jug_Partido(
Cod_Jug int,
Cod_sel int,
Cod_sel2 int,
primary key(Cod_Jug, Cod_sel, Cod_sel2),
foreign key(Cod_sel)references Seleccion(Cod_Seleccion),
foreign key(Cod_sel2)references Seleccion(Cod_Seleccion),
foreign key(Cod_Jug)references Jugador(CI_jug)
);
 
create table juega(
cod_sel1 int,
cod_sel2 int,
cod_jug int,
primary key(cod_sel1,cod_sel2,cod_jug),
foreign key(Cod_sel1)references Seleccion(Cod_Seleccion),
foreign key(Cod_sel2)references Seleccion(Cod_Seleccion),
foreign key(Cod_Jug)references Jugador(CI_jug)
);

create table participa(
cod_arbitro int,
cod_sel1 int,
cod_sel2 int,
consulta_var int,

primary key(cod_arbitro, cod_sel1, cod_sel2),

foreign key(cod_sel1)references seleccion(Cod_seleccion),
foreign key(cod_sel2)references seleccion(Cod_seleccion),
foreign key(cod_arbitro)references arbitro(CI_ar)
);

create table ingresa_jug(
cod_jug int,
fecha date,
hora time,
cod_sel1 int,
cod_sel2 int,

primary key(cod_jug, cod_sel1, cod_sel2),

foreign key(cod_sel1)references seleccion(Cod_seleccion),
foreign key(cod_sel2)references seleccion(Cod_seleccion),
foreign key(cod_jug)references jugador(CI_jug)
);

create table ingresa_tec(
cod_tec int,
fecha date,
hora time,
cod_sel1 int,
cod_sel2 int,

primary key(cod_tec, cod_sel1, cod_sel2),

foreign key(cod_sel1)references seleccion(Cod_seleccion),
foreign key(cod_sel2)references seleccion(Cod_seleccion),
foreign key(cod_tec)references cuerpo_tecnico(cod_ct) 
);
use mundial;

select jug.nombre, 'Jugador' Rol, sel1.nombre, sel2.nombre, ingj.fecha  from juega j
join ingresa_jug ingj
join jugador jug
join seleccion sel1
join seleccion sel2
on j.cod_jug = jug.CI_jug
where sel1.nombre = "argentina" and sel2.nombre= "uruguay"
union select ar.nombre, 'Arbitro' Rol, sel1.nombre, sel2.nombre, ingt.fecha from arbitro
join ingresa_tec ingt
join arbitro ar
join seleccion sel1
join seleccion sel2
on ar.CI_ar = ar.cod_ar
;


select CI_ar from arbitro 
join seleccion ON arbitro.Nacionalidad = seleccion.Nombre
union select * from cuerpo_tecnico
join seleccion ON cuerpo_tecnico.
 



drop database mundial;
 