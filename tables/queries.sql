select nome, numero from mecanico, OS
where mecanicoResponsavel = nome;

select idMão, mecanicoResponsavel from tiposDeServiço, mecanico
where nome = mecanicoResponsavel;
