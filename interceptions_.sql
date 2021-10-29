select * from interceptions;

select *
from (select distinct playerId,sum(`int`) as interceptions from interceptions
group by playerId
order by sum(`int`) desc
limit 20) t2
inner join  player t1 on (t1.playerId=t2.playerId)
order by interceptions desc;
