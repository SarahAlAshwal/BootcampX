SELECT COUNT(assistance_requests.id) AS total_assistance , teachers.name 
FROM assistance_requests JOIN teachers ON teachers.id = assistance_requests.teacher_id
WHERE teachers.name = 'Waylon Boehm'
GROUP BY (teachers.name);