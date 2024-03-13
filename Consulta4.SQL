create view Valorpolizafechafin as 
select poliza.fechafin, sum(valorpoliza.valor_total_poliza) as total
from poliza
inner join valorpoliza
on valorpoliza.id_poliza= poliza.id
group by poliza.fechafin;
