create table if not exists pacientes(
        id serial PRIMARY KEY,
        nome varchar (48) not null,
        sexo varchar (1),
        obito boolean,
        insertedAt TIMESTAMP NOT NULL DEFAULT NOW ());

create table if not exists profissionais(
        id serial PRIMARY KEY,
        nome varchar (50));

create table if not exists especialidades(
        id serial PRIMARY KEY,
        nome varchar (50));



create table if not exists consultas(
        id serial PRIMARY KEY,



       especialidade_id integer,
        pac_id integer,
        profiss_id integer);



create table if not exists obitos(
        id serial PRIMARY KEY,
        obs text);



create table if not exists obitos(
        id serial PRIMARY KEY,
        obs text);




ALTER TABLE consultas
ADD CONSTRAINT FkEspecialidadeDaConsulta FOREIGN KEY
    (especialidade_id)
REFERENCES
     especialidades(id);




AlTER TABLE consultas
ADD CONSTRAINT FkProfissionalDaConsulta FOREIGN KEY
     (profiss_id)
REFERENCES
      profissionais(id);

insert into especialidades (nome) values ("urologista")
insert into  especialidades (nome) values ("ginecologista")
insert into  especialidades (nome values ("clinica geral")

select * from especialidades;

insert into profissionais (nome) values ("DrFeelGoodUro")
insert into profissionais (nome) values ("DrJekllGineco")
insert into profissionais (nome) values ("DrRay")

select * from profissionais


insert into pacientes (nome, sexo, obito) values ("Ada LoveLace, "F", F)
insert into pacientes (nome, sexo, obito) values ("Donald Knuth, "M", F)
insert into pacientes (nome, sexo, obito) values ("Grace Hopper, "F", F)
insert into pacientes (nome, sexo, obito) values ("Dennis Ritchie, "F", F)

select * from pacientes;

insert into consultas (especialidade_id, pac_id, profiss_id) values ("1", "1", "1")

select * from consultas;



