SELECT
    *
INTO
    [PassthroughOutput]
FROM
    [firsteventhub];


SELECT
    conditions AS condition,
    avg(temperature) AS avg_temperature,
    avg(humidity) AS avg_humidity,
    avg(windSpeed) AS avg_windSpeed,
    avg(precipitation) AS avg_precipitation,
    System.Timestamp() AS WindowEndTime,
    COUNT(*) AS score_count
INTO
    [TumblingOutput] 
FROM
    [firsteventhub]
GROUP BY
    conditions, TumblingWindow(second, 5);


SELECT
    conditions AS condition,
    avg(temperature) AS avg_temperature,
    avg(humidity) AS avg_humidity,
    avg(windSpeed) AS avg_windSpeed,
    avg(precipitation) AS avg_precipitation,
    System.Timestamp() AS WindowEndTime,
    COUNT(*) AS score_count
INTO
    [HoppingOutput] 
FROM
    [firsteventhub]
GROUP BY
    EpisodeId, HoppingWindow(second, 10, 5);


SELECT
    conditions AS condition,
    avg(temperature) AS avg_temperature,
    avg(humidity) AS avg_humidity,
    avg(windSpeed) AS avg_windSpeed,
    avg(precipitation) AS avg_precipitation,
    System.Timestamp() AS WindowEndTime,
    COUNT(*) AS score_count
INTO
    [SlidingOutput] 
FROM
    [firsteventhub]
GROUP BY
    conditions, SlidingWindow(second, 20)
HAVING
    AVG(precipitation) > 10 AND COUNT(*) > 3;
