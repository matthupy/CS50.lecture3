SELECT origin, count(*) from flights group by origin order by count(*) desc, origin LIMIT 1;

SELECT origin, count(*) from flights group by origin having count(*) > 1;