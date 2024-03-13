create view Consulta2 as
select A3.numero, A3.nombretomador, A3.nombretipo, departamento.nombre as nombredepartamento, A3.valor
from (
select A2.numero, A2.nombretipo, A2.valor, tomador.nombre as nombretomador, tomador.iddepartamento
from(
select A1.valor, A1.numero, tipo_cubrimiento.nombre as nombretipo, A1.idtomador
from(
select poliza.numero, poliza.idtipocubrimiento as idtipo, poliza.idtomador, valorpoliza.valor_total_poliza as valor
from poliza
inner join valorpoliza
on valorpoliza.id_poliza= poliza.id) A1
inner join tipo_cubrimiento
on A1.idtipo = tipo_cubrimiento.id
)A2
right join tomador
on A2.idtomador= tomador.id
) A3
inner join departamento
on A3.iddepartamento = departamento.id;
