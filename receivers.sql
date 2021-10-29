-- receivers
select playerId, sum(rec) as receptions from receivers
group by playerId
order by  receptions  desc
limit  20;

-- jogadores que possuem maior numero de recepções 
select t1.nameFull,t1.position,t1.college,t1.heightInches,t1.weight,t2.*
from (select distinct playerId, sum(rec) as receptions from receivers
group by playerId
order by  receptions  desc
limit  20) t2
inner join  player t1 on (t1.playerId=t2.playerId)
order by receptions desc;
