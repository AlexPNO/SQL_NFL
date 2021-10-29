
-- sacks
select playerId, count(sackId) as total_sacks from sacks
group by playerId
order by count(sackId) desc
limit 20;

select t1.nameFull,t1.position,t1.college,t1.heightInches,t1.weight,t2.*
from (select distinct playerId, count(sackId) as total_sacks from sacks
group by playerId
order by count(sackId) desc
limit 20) t2
inner join  player t1 on (t1.playerId=t2.playerId)
order by total_sacks desc;