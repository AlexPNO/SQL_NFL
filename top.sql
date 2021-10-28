CREATE TABLE top AS SELECT DISTINCT nameFull, position, college, heightInches, weight, playerId FROM
    (SELECT 
        t1.nameFull,
            t1.position,
            t1.college,
            t1.heightInches,
            t1.weight,
            t2.*
    FROM
        (SELECT DISTINCT
        playerId, SUM(Inter) AS interceptions
    FROM
        interceptions
    GROUP BY playerId
    ORDER BY SUM(Inter) DESC
    LIMIT 20) t2
    INNER JOIN player t1 ON (t1.playerId = t2.playerId)
    ORDER BY interceptions DESC) AS a 
UNION SELECT DISTINCT
    nameFull, position, college, heightInches, weight, playerId
FROM
    (SELECT 
        t1.nameFull,
            t1.position,
            t1.college,
            t1.heightInches,
            t1.weight,
            t2.*
    FROM
        (SELECT DISTINCT
        playerId, COUNT(sackId) AS total_sacks
    FROM
        sacks
    GROUP BY playerId
    ORDER BY COUNT(sackId) DESC
    LIMIT 20) t2
    INNER JOIN player t1 ON (t1.playerId = t2.playerId)
    ORDER BY total_sacks DESC) AS b 
UNION SELECT DISTINCT
    nameFull, position, college, heightInches, weight, playerId
FROM
    (SELECT 
        t1.nameFull,
            t1.position,
            t1.college,
            t1.heightInches,
            t1.weight,
            t2.*
    FROM
        (SELECT DISTINCT
        playerId, COUNT(tackleId) AS total_tackles
    FROM
        tackles
    GROUP BY playerId
    ORDER BY COUNT(tackleId) DESC
    LIMIT 20) t2
    INNER JOIN player t1 ON (t1.playerId = t2.playerId)
    ORDER BY total_tackles DESC) AS c 
UNION SELECT DISTINCT
    nameFull, position, college, heightInches, weight, playerId
FROM
    (SELECT 
        t1.nameFull,
            t1.position,
            t1.college,
            t1.heightInches,
            t1.weight,
            t2.*
    FROM
        (SELECT DISTINCT
        playerId, kickLength
    FROM
        kicks
    WHERE
        kickLength > 10
    ORDER BY kickLength DESC
    LIMIT 20) t2
    INNER JOIN player t1 ON (t1.playerId = t2.playerId)
    ORDER BY kickLength DESC) AS d 
UNION SELECT DISTINCT
    nameFull, position, college, heightInches, weight, playerId
FROM
    (SELECT 
        t1.nameFull,
            t1.position,
            t1.college,
            t1.heightInches,
            t1.weight,
            t2.*
    FROM
        (SELECT DISTINCT
        playerId, SUM(passComp) AS total_passes
    FROM
        passer
    GROUP BY playerId
    ORDER BY SUM(passComp) DESC
    LIMIT 20) t2
    INNER JOIN player t1 ON (t1.playerId = t2.playerId)
    ORDER BY total_passes DESC) AS e

Union SELECT 
    nameFull, position, college, heightInches, weight, playerId
FROM
    (SELECT 
        t1.nameFull,
            t1.position,
            t1.college,
            t1.heightInches,
            t1.weight,
            t2.*
    FROM
        (SELECT DISTINCT
        playerId, SUM(rec) AS receptions
    FROM
        receivers
    GROUP BY playerId
    ORDER BY receptions DESC
    LIMIT 20) t2
    INNER JOIN player t1 ON (t1.playerId = t2.playerId)
    ORDER BY receptions DESC) AS f;