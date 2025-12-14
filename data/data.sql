INSERT INTO teachers (first_name, last_name, email, hire_date) VALUES
('Taro', 'Sato', 't.sato@example.com', '2015-04-01'),
('Hanako', 'Tanaka', 'h.tanaka@example.com', '2020-09-01'),
('Jiro', 'Suzuki', 'j.suzuki@example.com', '2018-10-15');

INSERT INTO courses (course_name, course_code, credit_hours, teacher_id) VALUES
(
    '基礎数学',
    'MATH101',
    3.0,
    (SELECT teacher_id FROM teachers WHERE last_name = 'Sato')
),
(
    '応用英語',
    'ENG202',
    2.5,
    (SELECT teacher_id FROM teachers WHERE last_name = 'Tanaka')
),
(
    '物理学 I',
    'PHYS105',
    4.0,
    (SELECT teacher_id FROM teachers WHERE last_name = 'Sato')
),
(
    '現代文',
    'JAPN301',
    2.0,
    (SELECT teacher_id FROM teachers WHERE last_name = 'Suzuki')
);

INSERT INTO students (first_name, last_name, date_of_birth, enrollment_year) VALUES
('Kenji', 'Inoue', '2007-05-15', 2023),
('Yui', 'Nakamura', '2008-01-20', 2023),
('Rina', 'Watanabe', '2007-11-03', 2023);

WITH student_ids AS (
    SELECT student_id, last_name FROM students
),
course_ids AS (
    SELECT course_id, course_code FROM courses
)
INSERT INTO grades (student_id, course_id, semester, score, grade_letter) VALUES
(
    (SELECT student_id FROM student_ids WHERE last_name = 'Inoue'),
    (SELECT course_id FROM course_ids WHERE course_code = 'MATH101'),
    '2024前期', 85, 'A'
),
(
    (SELECT student_id FROM student_ids WHERE last_name = 'Inoue'),
    (SELECT course_id FROM course_ids WHERE course_code = 'ENG202'),
    '2024前期', 72, 'B'
),
(
    (SELECT student_id FROM student_ids WHERE last_name = 'Nakamura'),
    (SELECT course_id FROM course_ids WHERE course_code = 'MATH101'),
    '2024前期', 92, 'A+'
),
(
    (SELECT student_id FROM student_ids WHERE last_name = 'Nakamura'),
    (SELECT course_id FROM course_ids WHERE course_code = 'PHYS105'),
    '2024前期', 78, 'B+'
),
(
    (SELECT student_id FROM student_ids WHERE last_name = 'Watanabe'),
    (SELECT course_id FROM course_ids WHERE course_code = 'JAPN301'),
    '2024前期', 65, 'C'
),
(
    (SELECT student_id FROM student_ids WHERE last_name = 'Watanabe'),
    (SELECT course_id FROM course_ids WHERE course_code = 'ENG202'),
    '2024前期', 88, 'A'
);
