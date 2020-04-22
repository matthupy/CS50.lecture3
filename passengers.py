import os

from sqlalchemy import create_engine
from sqlalchemy.orm import scoped_session, sessionmaker

try:
    engine = create_engine(os.getenv("DATABASE_URL"))
except:
    engine = create_engine("postgres://postgres:admin@localhost:5432/lecture3")
    
db = scoped_session(sessionmaker(bind=engine))

def main():
    #List all flights
    flights = db.execute("SELECT  "\
                        "    f.id, "\
                        "    o.code as origin_code, "\
                        "    o.name as origin_name, "\
                        "    d.code as dest_code, "\
                        "    d.name as dest_name, "\
                        "    f.duration "\
                        "FROM flights as f "\
                        "    LEFT JOIN locations AS o "\
                        "        on f.origin_id = o.id "\
                        "    LEFT JOIN locations as d "\
                        "        on f.destination_id = d.id "\
                        " GROUP BY  "\
                        " f.id, "\
                        " o.code, "\
                        " o.name, "\
                        " d.code, "\
                        " d.name, "\
                        " f.duration "\
                        " ORDER BY f.id" )

    for flight in flights:
            print(f"Flight {flight.id}: {flight.origin_name} to {flight.dest_name}, {flight.duration}")
        
    flight_id = int(input("\nFLight ID: "))
    flight = db.execute(f"SELECT origin_id, destination_id, duration FROM flights WHERE id = {flight_id}").fetchone()

    if flight is None:
        print("Error: No such flight")
        return
    
    # list passengers
    passengers = db.execute(f"SELECT name FROM passengers WHERE flight_id = {flight_id}").fetchall()

    print(f"Passengers on flight {flight_id}:")
    for passenger in passengers:
        print(passenger.name)
    if len(passengers)==0:
        print(f"No passengers on flight {flight_id}.")

if __name__ == "__main__":
    main()