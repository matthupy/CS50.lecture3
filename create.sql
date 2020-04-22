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

