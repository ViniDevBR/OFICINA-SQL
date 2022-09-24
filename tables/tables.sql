create database oficina;
use oficina;

create table cliente (
    idCliente int auto_increment,
    Veiculo varchar(20),
    CPF char(9),
    Autorização boolean,
    primary key(idCliente, Autorização),
    constraint unique_aut unique(Autorização)
);

create table Mecanico (
    idMecanico int auto_increment,
    nome varchar(15) NOT NULL,
    endereço varchar (50) NOT NULL,
    especialidade enum('Reparo', 'Revisão', 'Outros') default 'Outros',
    ra char(5) NOT NULL,
    primary key(idMecanico, nome),
    constraint unique_mecanico_ra unique(ra),
    constraint unique_mecanico unique(nome)
);

create table OS ( -- ORDEM DE SERVIÇO
    idOS int auto_increment,
    entrega datetime NOT NULL,
    numero int NOT NULL,
    data_emissao datetime NOT NULL,
    mecanicoResponsavel varchar(15) NOT NULL,
    AutorizaçãoCliente boolean NOT NULL,
    primary key (idOS),
    constraint fk_OS_mecanico foreign key(mecanicoResponsavel) references Mecanico(nome),
    constraint fk_OS_cliente foreign key(AutorizaçãoCliente) references cliente(Autorização)
);

create table peças (
    idPeças int auto_increment,
    Valor float NOT NULL,
    primary key(idPeças)
);

create table mãoDeObra (
    idMão int auto_increment,
    Valor float NOT NULL,
    primary key(idMão)
);

create table revisao (
    idRevisao int auto_increment,
    idCliente int,
    quantidade int ,
    primary key (idRevisao),
    constraint fk_revisao_Cliente foreign key (idCliente) references cliente(idCliente)
);

create table reparo (
    idReparo int auto_increment,
    idCliente int,
    quantidade int ,
    primary key (idReparo),
    constraint fk_reparo_Cliente foreign key (idCliente) references cliente(idCliente)
);

create table mecanico_revisao (
    IdMecanico int,
    idRevisao int,
    primary key(IdMecanico, idRevisao),
    constraint fk_mecanico_revisao_mecanico foreign key (IdMecanico) references mecanico(IdMecanico),
    constraint fk_mecanico_revisao_revisao foreign key (IdRevisao) references revisao(IdRevisao)
);

create table mecanico_reparo (
    IdMecanico int,
    idReparo int,
    primary key(IdMecanico, idReparo),
    constraint fk_mecanico_reparo_mecanico foreign key (IdMecanico) references mecanico(IdMecanico),
    constraint fk_mecanico_reparo_reparo foreign key (IdReparo) references reparo(IdReparo)
);

create table tiposDeServiço (
    idMão int,
    mecanicoResponsavel varchar(15),
    idOS int,
    primary key(idMão, mecanicoResponsavel, idOS),
    constraint fk_TServiço_MaodeObra foreign key (idMão) references mãoDeObra(idMão),
    constraint fk_TServiço_mecanicoResponsavel foreign key (mecanicoResponsavel) references OS(mecanicoResponsavel),
    constraint fk_TServiço_OS foreign key (idOS) references OS(idOS)
);

create table tipoPeças (
    idPeças int,
    mecanicoResponsavel varchar(15),
    idOS int,
    primary key(idPeças, mecanicoResponsavel, idOS),
    constraint fk_TPeça_Peças foreign key (idPeças) references peças(idPeças),
    constraint fk_TPeça_mecanicoResponsavel foreign key (mecanicoResponsavel) references OS(mecanicoResponsavel),
    constraint fk_TPeçc_OS foreign key (idOS) references OS(idOS)
);
