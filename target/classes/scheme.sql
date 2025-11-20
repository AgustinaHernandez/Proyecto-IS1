-- Elimina la tabla 'users' si ya existe para asegurar un inicio limpio
DROP TABLE IF EXISTS users;

-- Crea la tabla 'users' con los campos originales, adaptados para SQLite
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT, -- Clave primaria autoincremental para SQLite
    name TEXT NOT NULL UNIQUE,          -- Nombre de usuario (TEXT es el tipo de cadena recomendado para SQLite), con restricción UNIQUE
    password TEXT NOT NULL           -- Contraseña hasheada (TEXT es el tipo de cadena recomendado para SQLite)
);

DROP TABLE IF EXISTS persons;

-- Creación de tabla 'persons'
CREATE TABLE persons (
    id INTEGER NOT NULL PRIMARY KEY,
    dni INTEGER NOT NULL UNIQUE,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

DROP TABLE IF EXISTS teachers;

-- Creación de tabla 'teachers'
CREATE TABLE teachers (
    id INTEGER NOT NULL PRIMARY KEY,
    person_id INTEGER NOT NULL,
    degree TEXT NOT NULL,
    email TEXT NOT NULL,

    CONSTRAINT valid_degree CHECK (
        degree IN (
            'BACHILLERATO',
            'TECNICATURA',
            'PROFESORADO',
            'LICENCIATURA',
            'MAESTRIA',
            'DOCTORADO',
            'OTRO'
        )
    ),

    CONSTRAINT fk_id_teacher FOREIGN KEY person_id REFERENCES persons (id)
);

DROP TABLE IF EXISTS students;

CREATE TABLE students (
    id INTEGER NOT NULL PRIMARY KEY,
    person_id INTEGER NOT NULL,

    CONSTRAINT fk_id_student FOREIGN KEY person_id REFERENCES persons (id)
);