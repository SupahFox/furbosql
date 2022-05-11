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
rol varchar(50),
nombre varchar(50),
apellido varchar(50)
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
CI_jug int,
primary key(cod_sel1,cod_sel2,CI_jug),
foreign key(Cod_sel1)references Seleccion(Cod_Seleccion),
foreign key(Cod_sel2)references Seleccion(Cod_Seleccion),
foreign key(CI_Jug)references jugador(CI_jug)
);

create table jugadPerteSel(
cod_jug int,
cod_sel int,
primary key(cod_jug, cod_sel),
constraint fk_2 foreign key (cod_jug) references jugador(ci_jug),
constraint fk_1 foreign key (cod_sel) references seleccion(Cod_Seleccion)
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

create table cuerpTecPart(
cod_ct int,
cod_sel int,
primary key(cod_ct, cod_sel),
foreign key(cod_ct) references cuerpo_tecnico(cod_ct),
foreign key(cod_sel) references seleccion(Cod_seleccion)
);

select jug.nombre, 'Jugador' Rol, sel1.nombre Local, sel2.nombre Visitante from juega jugar
join ingresa_jug ingj
join jugador jug
join seleccion sel1
join seleccion sel2
on jugar.CI_jug = jug.CI_jug
where sel1.nombre = "argentina" and sel2.nombre= "uruguay"
union select ar.nombre, 'Arbitro' Rol, sel1.nombre Local, sel2.nombre Visitante from arbitro
join ingresa_tec ingt
join arbitro ar
join seleccion sel1
join seleccion sel2
on ar.CI_ar = ar.cod_ar;

select jug.nombre Nombre, jug.apellido Apellido, 'Jugadores' Rol, sel.nombre Seleccion from jugador jug
join jugadPerteSel jps
join Seleccion sel where jps.cod_sel = sel.Cod_Seleccion and jug.CI_jug = jps.cod_jug
union select ct.nombre Nombre, ct.apellido Apellido, 'Tecnicos' Rol, sel.nombre Seleccion from cuerpo_tecnico ct
join cuerpTecPart ctp
join Seleccion sel where ctp.cod_sel = sel.Cod_Seleccion and ct.cod_ct = ctp.cod_ct;