-- tackles
select playerId, count(tackleId) as total_tackles from tackles
group by playerId
order by count(tackleId ) desc
limit 20;

select t1.nameFull,t1.position,t1.college,t1.heightInches,t1.weight,t2.*
from (select distinct playerId, count(tackleId) as total_tackles from tackles
group by playerId
order by count(tackleId ) desc
limit 20) t2
inner join  player t1 on (t1.playerId=t2.playerId)
order by total_tackles desc;