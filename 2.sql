create table students (
	id serial not null primary key,
	first_name text,
	last_name text,
	emails text, /* email1|email2 */
	addresses text, /* street, city, state, zip (assume all US-based for now) */
	classes text /* class_code, class_name */
);

INSERT INTO students (first_name, last_name, emails, addresses, classes) VALUES
('John', 'Doe', 'john.doe@example.com|johndoe@gmail.com', '123 Elm St, Springfield, IL, 62701|456 Oak St, Springfield, IL, 62702', 'CS101, Intro to Computer Science|MATH101, Calculus I'),
('Jane', 'Smith', 'jane.smith@example.com|janesmith@yahoo.com', '789 Pine St, Lincoln, NE, 68501|321 Maple St, Lincoln, NE, 68502', 'ENG201, English Literature|BIO101, Biology I'),
('Michael', 'Johnson', 'michael.johnson@example.com|mike.j@gmail.com', '654 Cedar St, Denver, CO, 80201|987 Birch St, Denver, CO, 80202', 'HIST101, World History|CHEM101, Chemistry I'),
('Emily', 'Davis', 'emily.davis@example.com|emilyd@gmail.com', '159 Spruce St, Austin, TX, 73301|753 Willow St, Austin, TX, 73302', 'PHYS101, Physics I|ART101, Art History'),
('David', 'Martinez', 'david.martinez@example.com|davidm@yahoo.com', '246 Fir St, Seattle, WA, 98101|369 Ash St, Seattle, WA, 98102', 'CS102, Data Structures|MATH102, Calculus II'),
('Sarah', 'Garcia', 'sarah.garcia@example.com|sarahg@gmail.com', '852 Chestnut St, Miami, FL, 33101|963 Palm St, Miami, FL, 33102', 'ENG202, Creative Writing|BIO102, Biology II'),
('James', 'Rodriguez', 'james.rodriguez@example.com|jamesr@gmail.com', '741 Walnut St, Boston, MA, 02101|258 Cherry St, Boston, MA, 02102', 'HIST102, US History|CHEM102, Chemistry II'),
('Jessica', 'Wilson', 'jessica.wilson@example.com|jessicaw@yahoo.com', '369 Poplar St, Chicago, IL, 60601|147 Sycamore St, Chicago, IL, 60602', 'PHYS102, Physics II|ART102, Modern Art'),
('Daniel', 'Anderson', 'daniel.anderson@example.com|daniela@gmail.com', '258 Elm St, San Francisco, CA, 94101|369 Oak St, San Francisco, CA, 94102', 'CS201, Algorithms|MATH201, Linear Algebra'),
('Laura', 'Thomas', 'laura.thomas@example.com|laurat@gmail.com', '147 Pine St, New York, NY, 10001|258 Cedar St, New York, NY, 10002', 'ENG301, Advanced Composition|BIO201, Genetics'),
('Matthew', 'Taylor', 'matthew.taylor@example.com|matthewt@yahoo.com', '369 Maple St, Atlanta, GA, 30301|852 Birch St, Atlanta, GA, 30302', 'HIST201, European History|CHEM201, Organic Chemistry'),
('Olivia', 'Moore', 'olivia.moore@example.com|oliviam@gmail.com', '963 Spruce St, Portland, OR, 97201|147 Fir St, Portland, OR, 97202', 'PHYS201, Mechanics|ART201, Sculpture'),
('Joshua', 'Jackson', 'joshua.jackson@example.com|joshj@gmail.com', '258 Cedar St, Dallas, TX, 75201|369 Walnut St, Dallas, TX, 75202', 'CS301, Software Engineering|MATH301, Differential Equations'),
('Sophia', 'White', 'sophia.white@example.com|sophiaw@yahoo.com', '741 Oak St, Houston, TX, 77001|852 Pine St, Houston, TX, 77002', 'ENG401, Literary Theory|BIO301, Ecology'),
('Ethan', 'Harris', 'ethan.harris@example.com|ethanh@gmail.com', '963 Maple St, Philadelphia, PA, 19101|147 Spruce St, Philadelphia, PA, 19102', 'HIST301, American History|CHEM301, Biochemistry'),
('Ava', 'Martin', 'ava.martin@example.com|avam@gmail.com', '258 Birch St, Phoenix, AZ, 85001|369 Cedar St, Phoenix, AZ, 85002','HIST301, American History');

ALTER TABLE students RENAME TO students_old;

CREATE TABLE students (
    id SERIAL PRIMARY KEY, 
    first_name TEXT, 
    last_name TEXT
);

CREATE TABLE student_emails (
    id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(id) ON DELETE CASCADE,
    email TEXT NOT NULL
);

CREATE TABLE student_addresses (
    id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(id) ON DELETE CASCADE,
    street TEXT NOT NULL,
    city TEXT NOT NULL,
    state TEXT NOT NULL,
    zip TEXT NOT NULL
);

CREATE TABLE student_classes (
    id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(id) ON DELETE CASCADE,
    class_code TEXT NOT NULL,
    class_name TEXT NOT NULL
);


INSERT INTO students (first_name, last_name)
SELECT first_name, last_name
FROM students_old;

INSERT INTO student_emails (student_id, email)
SELECT s.id, unnest(string_to_array(se.emails, '|'))
FROM students_old se
JOIN students s ON s.first_name = se.first_name AND s.last_name = se.last_name;

INSERT INTO student_addresses (student_id, street, city, state, zip)
SELECT s.id, 
       split_part(ad.address, ',', 1) AS street,
       split_part(ad.address, ',', 2) AS city,
       split_part(ad.address, ',', 3) AS state,
       split_part(ad.address, ',', 4) AS zip
FROM students_old se
JOIN students s ON s.first_name = se.first_name AND s.last_name = se.last_name,
     unnest(string_to_array(se.addresses, '|')) AS ad(address);

	 INSERT INTO student_classes (student_id, class_code, class_name)
SELECT s.id, 
       split_part(cl.class_info, ',', 1) AS class_code,
       split_part(cl.class_info, ',', 2) AS class_name
FROM students_old se
JOIN students s ON s.first_name = se.first_name AND s.last_name = se.last_name,
     unnest(string_to_array(se.classes, '|')) AS cl(class_info);

ALTER TABLE students RENAME TO students_old;

CREATE TABLE students (
    id SERIAL PRIMARY KEY, 
    first_name TEXT, 
    last_name TEXT
);

CREATE TABLE student_emails (
    id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(id) ON DELETE CASCADE,
    email TEXT NOT NULL
);

CREATE TABLE student_addresses (
    id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(id) ON DELETE CASCADE,
    street TEXT NOT NULL,
    city TEXT NOT NULL,
    state TEXT NOT NULL,
    zip TEXT NOT NULL
);

CREATE TABLE student_classes (
    id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(id) ON DELETE CASCADE,
    class_code TEXT NOT NULL,
    class_name TEXT NOT NULL
);

INSERT INTO students (first_name, last_name)
SELECT first_name, last_name
FROM students_old;

INSERT INTO student_emails (student_id, email)
SELECT s.id, unnest(string_to_array(se.emails, '|'))
FROM students_old se
JOIN students s ON s.first_name = se.first_name AND s.last_name = se.last_name;

INSERT INTO student_addresses (student_id, street, city, state, zip)
SELECT s.id, 
       split_part(ad.address, ',', 1) AS street,
       split_part(ad.address, ',', 2) AS city,
       split_part(ad.address, ',', 3) AS state,
       split_part(ad.address, ',', 4) AS zip
FROM students_old se
JOIN students s ON s.first_name = se.first_name AND s.last_name = se.last_name,
     unnest(string_to_array(se.addresses, '|')) AS ad(address);

INSERT INTO student_classes (student_id, class_code, class_name)
SELECT s.id, 
       split_part(cl.class_info, ',', 1) AS class_code,
       split_part(cl.class_info, ',', 2) AS class_name
FROM students_old se
JOIN students s ON s.first_name = se.first_name AND s.last_name = se.last_name,
     unnest(string_to_array(se.classes, '|')) AS cl(class_info);
