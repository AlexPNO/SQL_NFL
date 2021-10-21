create table tackles_and_sacks as
SELECT 
    sacks_novo.playerId, sacks, tackles
FROM
    sacks_novo
        INNER JOIN
    tackles_novo ON sacks_novo.playerId = tackles_novo.playerId;
    
SELECT 
    *
FROM
    sacks_novo
WHERE
    playerId = 20020002;

SELECT 
   playerId, count(tackleId)
FROM
    tackles
    group by playerId order by count(tackleId);
    
SELECT 
   playerId, count(tackleId)
FROM
    tackles
    group by playerId order by count(tackleId) desc limit 20 ;


    select 
    *
    from tackles_and_sacks;