SELECT name, email, id, cohort_id 
FROM students
WHERE email NOT LIKE '%gamil.com' AND phone IS NULL ;