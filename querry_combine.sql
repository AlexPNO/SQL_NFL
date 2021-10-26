select * from combine;
select distinct avg(combineWeight) from combine;
select distinct avg(combineHeight) from combine;

-- dados ataque
select distinct avg(combineHeight) from combine
where combinePosition in ('WR','OT','G','C','RB','QB','FB','TE');
select distinct avg(combineWeight) from combine
where combinePosition in ('WR','OT','G','C','RB','QB','FB','TE');

-- dados defesa
select distinct avg(combineHeight) from combine
where combinePosition in ('DE','DB','SS','FS','LB');
select distinct avg(combineWeight) from combine
where combinePosition in ('DE','DB','SS','FS','LB');

select * from  interceptions;

drop table mytable;

select * from players;
select * from games;
select * from kicks;


