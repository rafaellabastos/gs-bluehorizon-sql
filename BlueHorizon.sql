---2TDSPF
---Douglas Magalhães de Araujo - 552008
---Gustavo Argüello Bertacci - 551304
---Luiz Fillipe Farias - 99519
---Rafaella Monique do Carmo Bastos - 552425

---Exclusão de possíveis tabelas
drop table Voluntario_Pessoa cascade constraints;
drop table Voluntario_Endereco cascade constraints;
drop table Voluntario_Perfil cascade constraints;
drop table Pontos_Coleta cascade constraints;
drop table Tipos_Lixos cascade constraints;
drop table Recebimento_Lixo cascade constraints;
drop table Situacao_Praia cascade constraints;

---Criação das tabelas
create table Voluntario_Endereco(
    id_end char(3) primary key,
    cep_end char(8),
    rua_end varchar2(50),
    num_end char(7),
    bairro_end varchar2(50),
    cidade_end varchar2(50),
    estado_end char(2),
    pais_end varchar2(50)
);

create table Voluntario_Perfil(
    id_perfil char(3) primary key,
    qntdlixoretirado_perfil number(10,2)
);

create table Voluntario_Pessoa(
    cpf_pessoa char(11) primary key,
    nome_pessoa varchar2(50),
    dtnasc_pessoa date,
    senha_pessoa char(15),
    id_end char(3),
    id_perfil char(3)
);

create table Pontos_Coleta(
    id_ponto char(3) primary key,
    nome_ponto varchar2(50),
    estado_ponto char(2),
    gerente_ponto varchar2(50)
);

create table Tipos_Lixo(
    id_lixo char(3) primary key,
    nome_lixo varchar2(50),
    valorkg_lixo number(4,2)
);

create table Recebimento_Lixo(
    id_recebimento char(3) primary key,
    dt_recebimento date,
    id_perfil char(3),
    cpf_pessoa char(11),
    id_ponto char(3),
    id_lixo char(3)
);

create table Situacao_Praia(
    id_praia char(3) primary key,
    nome_praia varchar2(50),
    nivelsujeira_praia number(5),
    cidade_praia varchar(50)
);

---Inserção das chaves estrangeiras
alter table Voluntario_Pessoa
add foreign key (id_end) references Voluntario_Endereco(id_end);

alter table Voluntario_Pessoa
add foreign key (id_perfil) references Voluntario_Perfil(id_perfil);

alter table Recebimento_Lixo
add foreign key (cpf_pessoa) references Voluntario_Pessoa(cpf_pessoa);

alter table Recebimento_Lixo
add foreign key (id_perfil) references Voluntario_Perfil(id_perfil);

alter table Recebimento_Lixo
add foreign key (id_ponto) references Pontos_Coleta(id_ponto);

alter table Recebimento_Lixo
add foreign key (id_lixo) references Tipos_Lixo(id_lixo);