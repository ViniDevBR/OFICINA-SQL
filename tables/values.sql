use oficina;

insert into cliente (Veiculo, CPF, Autorização) values
    ('Honda', 123456789, true),
    ('BMW', 123456987, false);
    
desc mecanico;
insert into mecanico (nome, endereço, especialidade, ra) values
    ('Vini', 'Rua jati 123', 'Reparo', 12345),
    ('Victor', 'Rua tapirai 123', 'Revisao', 12354),
    ('Eliseu', 'Rua itirapina 123', 'Reparo', 12378);
    
desc OS;
insert into OS (entrega, numero, data_emissao, mecanicoResponsavel, AutorizaçãoCliente) values
    ('10-10-10', 1, '10-10-10', 'Vini', true),
    ('08-08-08', 2, '08-08-08', 'Victor', false);
    
desc peças;
insert into peças (Valor) values
    (100),
    (50),
    (200),
    (250),
    (300);
    
desc mãoDeObra;
insert into mãoDeObra (Valor) values
    (100),
    (500),
    (200),
    (250),
    (150);
    
desc revisao;
select * from cliente;
insert into revisao (idCliente, quantidade) values
    (1, 2),
    (14, 3);
    
desc reparo;
insert into reparo (idCliente, quantidade) values
    (1, 2),
    (14, 5);
    
desc mecanico_revisao;
select * from revisao;
select * from mecanico;
insert into mecanico_revisao (IdMecanico, idRevisao) values 
    (2, 1),
    (2, 2);
    
desc mecanico_reparo;
select * from reparo;
insert into mecanico_reparo (IdMecanico, idReparo) values
    (1, 1),
    (3, 2);
    
desc tiposDeServiço;
select * from mãoDeObra;
select * from OS;
insert into tiposDeServiço values
    (1, 'Vini', 1),
    (5, 'Victor', 2);
    
desc tipoPeças;
select * from peças;
insert into tipoPeças values
    (1, 'Vini', '1'),
    (3, 'Victor', '2');
