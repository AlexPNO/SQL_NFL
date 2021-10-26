-- passer
select playerId,sum( passComp) as total_passes from passer
group by playerId
order by sum( passComp) desc
limit 20;

-- jogadores com maior número de passes completos
select t1.nameFull,t1.position,t1.college,t1.heightInches,t1.weight,t2.*
from (select distinct playerId,sum(passComp) as total_passes from passer
group by playerId
order by sum( passComp) desc
limit 20) t2
inner join  player t1 on (t1.playerId=t2.playerId)
order by total_passes desc;

-- jogadores com passes completos mais longos
select t1.nameFull,t1.position,t1.college,t1.heightInches,t1.weight,t2.*
from (select  distinct playerId,passLength  from passer where passComp=1
order by passLength desc 
limit 20) t2
inner join  player t1 on (t1.playerId=t2.playerId)

order by passLength desc;


