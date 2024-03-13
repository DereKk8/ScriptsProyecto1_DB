create view valorespolizas as
select tomador.nombre, L.totalpoliza, L.totalasegurable
from (
select  N.id, M.valor_total_poliza as totalpoliza , N.totalasegurable
from(
select poliza.id, valorpoliza.valor_total_poliza, poliza.idtomador
from poliza
inner join valorpoliza
on poliza.id = valorpoliza.id_poliza) M
inner join (
select tomador.id, sum(poliza.valorasegurable) as totalasegurable
from tomador
inner join poliza
on poliza.idtomador = tomador.id
group by tomador.id
) N
on N.id = M.idtomador) L
inner join tomador
on tomador.id = L.id;
