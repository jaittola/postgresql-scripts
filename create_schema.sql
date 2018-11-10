
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS users (
       id SERIAL PRIMARY KEY,
       secret_id UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
       username VARCHAR,
       yachtname VARCHAR,
       email VARCHAR
);
