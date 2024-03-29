CREATE TABLE coming_soon (
	record_id   VARCHAR (24)      PRIMARY KEY,       -- Data type: "YYYY-MM-DD-HH-MM-SS-xxxx": where xxxx is a random alpha-numeric  string. Day and time must be valid.
	message_id  VARCHAR (24)      NOT NULL  UNIQUE,  -- Data type: "YYYY-MM-DD-HH-MM-SS-xxxx": where xxxx is a random alpha-numeric  string. Day and time must be valid.
	title       TEXT (64)         NOT NULL,          -- Data type: 1 - 64 characters. Possible characters: "a-zA-Z0-9.,-:; ''""!@#$%&+=/()[]| ". Yes, hyper could be a part, so are is a comma, single-quote, etc.
	message     TEXT (8192)       NOT NULL,          -- Data type: 1 - 8,192 UTF-8 characters.
	image       VARBINARY (8192)  NOT NULL,          -- Data type: 1 - 8,192 bytes.
	image_mime  TEXT (10)         NOT NULL           -- Data type: Possible values: image/gif, image/jpg, image/jpeg, and image/png.
);
