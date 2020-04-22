import os

from sqlalchemy import create_engine
from sqlalchemy.orm import scoped_session, sessionmaker

engine = create_engine(os.getenv("DATABASE_URL"))
db = scoped_session(sessionmaker(bind=engine))

def main():
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
    "    JOIN passengers as p "\
    "        on p.flight_id = f.id"
    " GROUP BY  "\
    " f.id, "\
    " o.code, "\
    " o.name, "\
    " d.code, "\
    " d.name, "\
    " f.duration "\
    ).fetchall()
    for flight in flights:
        print(f"{flight.origin_name} to {flight.dest_name}, {flight.duration}")

if __name__ == "__main__":
    main()