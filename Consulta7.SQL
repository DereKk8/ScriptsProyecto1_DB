create view consulta7 as
select Masc.nombre, femen.nfemenino as Mujeres, masc.nmasculino as Hombres, (femen.nfemenino+masc.nmasculino) as total
from
(select departamento.nombre, count( distinct tomador.cedula) as nfemenino
from departamento
inner  join tomador
on departamento.id = tomador.iddepartamento
where tomador.genero like 'f%'
group by departamento.nombre ) Femen
inner join (
select departamento.nombre, count( distinct tomador.cedula) as nmasculino
from departamento
inner join tomador
on departamento.id = tomador.iddepartamento
where tomador.genero like 'm%'
group by departamento.nombre ) Masc
on femen.nombre=masc.nombre;
