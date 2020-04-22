insert into flights (origin_id, destination_id, duration) values (1, 4, 415);
insert into flights (origin_id, destination_id, duration) values (2, 7, 760);
insert into flights (origin_id, destination_id, duration) values (3, 8, 700);
insert into flights (origin_id, destination_id, duration) values (1, 7, 435);
insert into flights (origin_id, destination_id, duration) values (5, 7, 245);
insert into flights (origin_id, destination_id, duration) values (6, 1, 455);


----------------

insert into locations (code, name) values ('JFK', 'New York');
insert into locations (code, name) values ('PVG', 'Shanghai');
insert into locations (code, name) values ('IST', 'Istanbul');
insert into locations (code, name) values ('LHR', 'London');
insert into locations (code, name) values ('SVO', 'Moscow');
insert into locations (code, name) values ('LIM', 'Lima');
insert into locations (code, name) values ('CDG', 'Paris');
insert into locations (code, name) values ('NRT', 'Tokyo');

------------------

insert into passengers (name, flight_id) values ('Alice', 1);
insert into passengers (name, flight_id) values ('Bob', 1);
insert into passengers (name, flight_id) values ('Charlie', 2);
insert into passengers (name, flight_id) values ('Dave', 2);
insert into passengers (name, flight_id) values ('Erin', 4);
insert into passengers (name, flight_id) values ('Frank', 6);
insert into passengers (name, flight_id) values ('Grace', 6);