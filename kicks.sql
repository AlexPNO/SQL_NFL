-- kicks
select playerId, kickLength from kicks
where kickLength>10
order by kickLength desc
limit 50;

-- querry com os nomes dos jogadores
select t1.nameFull,t1.position,t1.college,t1.heightInches,t1.weight,t2.*
from (select distinct  playerId, kickLength from kicks
where kickLength>10
order by kickLength desc
limit 50) t2
inner join  player t1 on (t1.playerId=t2.playerId)
order by kickLength desc;