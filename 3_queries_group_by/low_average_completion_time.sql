SELECT students.name AS students_name , 
AVG(assignment_submissions.duration) AS average_assignment_time, 
AVG(assignments.duration) AS average_estimated_duration
FROM students 
JOIN assignment_submissions ON students.id = assignment_submissions.student_id
JOIN assignments ON assignments.id = assignment_submissions.assignment_id
WHERE students.end_date IS NULL 
GROUP BY students.name
HAVING AVG(assignment_submissions.duration) < AVG(assignments.duration)
ORDER BY AVG(assignment_submissions.duration);