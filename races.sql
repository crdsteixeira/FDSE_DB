CREATE TABLE team (
 team_id INTEGER PRIMARY KEY,
 name VARCHAR NOT NULL UNIQUE
);
 
CREATE TABLE runner (
 id INTEGER PRIMARY KEY,
 name VARCHAR NOT NULL,
 sex CHAR(1) NOT NULL CHECK (sex IN ('M', 'F')),
 nation CHAR(2),
 birthdate DATE NOT NULL,
 team_id INTEGER NOT NULL REFERENCES team
 -- UNIQUE (name, birthdate) --?? To be confirmed if this makes a unique name & birthdate entry
);
 
CREATE TABLE event_type (
 eventtype_id SERIAL UNIQUE PRIMARY KEY,
 name VARCHAR(90) NOT NULL UNIQUE
);
 
CREATE TABLE event (
 event_id SERIAL UNIQUE PRIMARY KEY,
 distance INTEGER NOT NULL,
 event_year SMALLINT NOT NULL,
 eventtype_id INTEGER NOT NULL REFERENCES event_type
);
 
CREATE TABLE class (
 class_id SERIAL UNIQUE PRIMARY KEY,
 age_class VARCHAR NOT NULL UNIQUE
);
 
CREATE TABLE event_details (
 bib INTEGER NOT NULL,
 official_time TIME NOT NULL,       --?? Do we have other opt for storing days as well?
 net_time TIME,     ---?? Do we have other opt for storing days as well?
 place INTEGER NOT NULL,
 place_in_class INTEGER NOT NULL,
 age INTEGER NOT NULL CHECK (age >= 17),    --- field to be calc. with birth_date
 class_id INTEGER NOT NULL REFERENCES class,
 event_id SERIAL UNIQUE REFERENCES event,
 UNIQUE (event_id, place) -- only 1 place allowed per event
);
