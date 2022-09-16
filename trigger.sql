
create table if not exists pacientes(    id serial PRIMARY KEY,    nome varchar(40) not null,    sexo varchar(1),    obito boolean,    insertedAt TIMESTAMP NOT NULL DEFAULT NOW());

create table if not exists profissionais(    id serial PRIMARY KEY,    nome varchar(50));


create table if not exists especialidades(    id serial PRIMARY KEY,    nome varchar(50));

create table if not exists consultas(    id serial PRIMARY KEY,        especialidade_id integer,    pac_id integer,    profiss_id integer);

create table if not exists obitos(    id serial PRIMARY KEY,    obs text);

ALTER TABLE consultas
ADD CONSTRAINT FkEspecialidadeDaConsulta FOREIGN KEY(especialidade_id) REFERENCES especialidades(id);

ALTER TABLE consultas
ADD CONSTRAINT FkProfissionalDaConsulta FOREIGN KEY(profiss_id) REFERENCES profissionais(id);


insert into especialidades (nome) VALUES ('urologista');
insert into especialidades (nome) VALUES ('ginecologista');
insert into especialidades (nome) VALUES ('clinica geral');

insert into profissionais (nome) VALUES ('DrFeelGoodUro');
insert into profissionais (nome) VALUES ('DrJekyGineco');
insert into profissionais (nome) VALUES ('DrRay');

insert into pacientes (nome,sexo,obito) VALUES ('Ada Lovelace','f',false);
insert into pacientes (nome,sexo,obito) VALUES ('Donald Knuth','m',false);
insert into pacientes (nome,sexo,obito) VALUES ('Grace Hopper','f',false);
insert into pacientes (nome,sexo,obito) VALUES ('Dennis Ritchie','m',false);


update consultas set especialidade_id = 2 where especialidade_id = 1;
update consultas set especialidade_id = 1 where especialidade_id = 2;
insert into consultas (especialidade_id,pac_id,profiss_id) values (1,1,1);
insert into consultas (especialidade_id,pac_id,profiss_id) values (2,2,2);


CREATE OR REPLACE FUNCTION trgValidaDadosConsulta() returns trigger as $trgValidaDadosConsulta$

declare
pac_row record;
espec_row record;

begin      RAISE NOTICE 'TRIGGER FUNCIONOU.';        RETURN NEW;
END;
$trgValidaDadosConsulta$ LANGUAGE plpgsql;
-
create TRIGGER trgValidaDadosConsulta
BEFORE INSERT OR UPDATE ON consultas
FOR EACH ROW
EXECUTE PROCEDURE trgValidaDadosConsulta();


select * from pacientes;
select * from especialidades;
select * from consultas;
select * from profissionais;

