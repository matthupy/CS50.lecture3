select * from flights;
select * from locations;
select * from passengers;

SELECT * FROM FLIGHTS LEFT JOIN PASSENGERS ON PASSENGERS.flight_id=FLIGHTS.id;

SELECT 
    f.id,
    o.code as origin_code,
    o.name as origin_name,
    d.code as dest_code,
    d.name as dest_name,
    f.duration
FROM flights as f
    JOIN locations AS o
        on f.origin_id = o.id
    JOIN locations as d
        on f.destination_id = d.id
    JOIN passengers as p
        on p.flight_id = f.id
GROUP BY 
    f.id,
    o.code,
    o.name,
    d.code,
    d.name,
    f.duration
ORDER BY 
    f.id
