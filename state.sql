CREATE TABLE sensor (
	record_id    VARCHAR (24) PRIMARY KEY,       /* Data type: "YYYY-MM-DD-HH-MM-SS-xxxx";
		where xxxx is a random alpha-numeric string. Day and time must be valid.
		UTC Timezone: Africa/Accra */

	sensor_id    VARCHAR (24) NOT NULL  UNIQUE,  -- Data type: 1 - 8 characters alpha-numeric
		-- string. Lowercase letters.

	pass         TEXT  NOT NULL,          -- Data type: Hexadecimal-encoded
		-- "512-bit SHA3 hash" of the password.

	some_comment TEXT  NOT NULL           -- Data type: 1 - 256 UTF-8 characters.
);

CREATE TABLE state (
	record_id  TEXT (24)  PRIMARY KEY,  /* Data type: "YYYY-MM-DD-HH-MM-SS-xxxx",
		where xxxx is a random alpha-numeric string. Day and time must be valid.
		UTC Timezone: Africa/Accra */

	state      INT   NOT NULL,     # Data type: Possible values: -1, 0, and 1

	day        TEXT  NOT NULL,     # Data type: "YYYYMMDD". Day must be valid.
		# UTC Timezone: Africa/Accra

	time       TEXT  NOT NULL,     # Data type: "HHMM". Time must be valid.
		# UTC Timezone: Africa/Accra

	sensor     TEXT  NOT NULL,

	FOREIGN KEY (sensor) REFERENCES sensor (sensor_id)
);

CREATE TABLE location (
	record_id    TEXT  PRIMARY KEY,       -- Data type: "YYYY-MM-DD-HH-MM-SS-xxxx";
		-- where xxxx is a random alpha-numeric string. Day and time must be valid.
		-- UTC Timezone: Africa/Accra

	location_id  TEXT  NOT NULL  UNIQUE,  -- Data type: 1 or 2 characters alpha-numeric
		-- string. Lowercase letters.


	name         TEXT  NOT NULL  UNIQUE,  -- Data type: 1 - 32 characters. Possible
		-- characters: "a-zA-Z0-9-()[] ". Yes, hyper could be a part, so also is a
		-- white space.

	sensor       TEXT  NOT NULL,

	FOREIGN KEY (sensor) REFERENCES sensor (sensor_id)
);
