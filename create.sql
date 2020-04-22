CREATE TABLE flights (
    id SERIAL PRIMARY KEY,
    origin_id INTEGER REFERENCES locations(id),
    destination_id INTEGER REFERENCES locations(id),
    duration INTEGER NOT NULL
);

CREATE TABLE locations (
    id SERIAL PRIMARY KEY,
    code VARCHAR NOT NULL,
    name VARCHAR NOT NULL
);

CREATE TABLE passengers (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    flight_id INTEGER REFERENCES flights(id)
);

CREATE OR REPLACE VIEW flights_vw AS
SELECT 
    f.id,
    o.code as origin_code,
    o.name as origin_name,
    d.code as dest_code,
    d.name as dest_name,
    f.duration,
    count(p.id) as num_passengers
FROM flights as f
    JOIN locations AS o
        on f.origin_id = o.id
    JOIN locations as d
        on f.destination_id = d.id
    LEFT JOIN passengers as p
        ON f.id = p.flight_id
GROUP BY 
    f.id,
    o.code,
    o.name,
    d.code,
    d.name,
    f.duration
ORDER BY 
    f.id;

