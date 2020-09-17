const args = process.argv;
const cohort_name = args[2];
const limit = args[3]; 
const {Pool} = require ('pg');

const pool = new Pool({
user: 'vagrant',
password: '123',
host: 'localhost',
database: 'bootcampx'
});

pool.query(`
SELECT students.id, students.name AS student, cohorts.name AS cohort_name
FROM students JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name LIKE '%${cohort_name}%'
LIMIT ${limit};
`)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.student} has an id of ${user.id} and was in the ${user.cohort_name} cohort `);
  })
})
.catch(err => {
  console.error('query error', err.stack);
});