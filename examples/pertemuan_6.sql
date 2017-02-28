select * from job_history;
select * from jobs;
select * from employees;
select * from locations;
select * from regions;
select * from countries;
select * from departments;

-- join employee dengan department
select e.first_name, e.last_name, 
  d.department_name
  from employees e inner join departments d on
  e.department_id = d.department_id;
  
-- join employee dengan department, employee yang departmentnya
-- tidak diketahui/tidak terdaftar tampilkan null
select e.first_name, e.last_name, d.department_name
  from employees e left outer join departments d on
  e.department_id = d.department_id;
  
select e.first_name, e.last_name, d.department_name
  from employees e right outer join departments d on
  e.department_id = d.department_id;
  
-- menampilkan employee yang tidak terdaftar
-- di department mana pun
select e.first_name, e.last_name
  from employees e left outer join departments d on
  e.department_id = d.department_id where d.department_id is null;
  
-- menampilkan department yang belum memiliki employee
select d.department_name
  from departments d left outer join employees e on
  e.department_id = d.department_id where e.employee_id is null;
  
-- kombinasi employee dengan department
select e.first_name, e.last_name, d.department_name from
  employees e cross join departments d;
  
-- join employee dan department berdasarkan kolom yang sama
-- namanya di kedua table
select e.first_name, e.last_name, d.department_name
  from employees e natural join departments d;

select e.first_name, e.last_name, d.department_name
  from employees e inner join departments d on
  e.manager_id = d.manager_id and
  e.department_id = d.department_id;
  
-- join employee dan department berdasarkan kolom department_id
select e.first_name, e.last_name, d.department_name
  from employees e join departments d using (department_id);
  
-- join employee, department dan jobs
select e.first_name, e.last_name, d.department_name,
  j.job_title from (employees e inner join departments d
  on e.department_id = d.department_id) inner join jobs j
  on e.job_id = j.job_id;
  
-- join employee, department, jobs, job_history
select e.first_name, e.last_name, d.department_name, j.job_title,
  h.start_date, h.end_date from ((employees e inner
  join job_history h on e.employee_id = h.employee_id) inner join
  departments d on h.department_id = d.department_id) inner join
  jobs j on h.job_id = j.job_id;
  
select employee_id, job_id, department_id from job_history;

-- edit table job_history tambahkan kolom location_id
alter table job_history add location_id number(4);

update job_history set location_id=1100 where employee_id=102
	and job_id='IT_PROG' and department_id=60;
update job_history set location_id=1200 where employee_id=101
	and job_id='AC_ACCOUNT' and department_id=110;
update job_history set location_id=1300 where employee_id=101
	and job_id='AC_MGR' and department_id=110;
update job_history set location_id=1400 where employee_id=201
	and job_id='MK_REP' and department_id=20;
update job_history set location_id=1500 where employee_id=114
	and job_id='ST_CLERK' and department_id=50;
update job_history set location_id=1600 where employee_id=122
	and job_id='ST_CLERK' and department_id=50;
update job_history set location_id=1700 where employee_id=200
	and job_id='AD_ASST' and department_id=90;
update job_history set location_id=1800 where employee_id=176
	and job_id='SA_REP' and department_id=80;
update job_history set location_id=1900 where employee_id=176
	and job_id='SA_MAN' and department_id=80;
update job_history set location_id=2000 where employee_id=200
	and job_id='AC_ACCOUNT' and department_id=90;

-- tampilkan history pekerjaan yang pernah ditempatkan di Europe
select e.first_name, e.last_name, d.department_name, j.job_title,
  h.start_date, h.end_date, l.city, c.country_name, r.region_name
  from ((employees e inner
  join job_history h on e.employee_id = h.employee_id) inner join
  departments d on h.department_id = d.department_id) inner join
  jobs j on h.job_id = j.job_id
  inner join locations l on h.location_id = l.location_id
  inner join countries c on l.country_id = c.country_id
  inner join regions r on c.region_id = r.region_id
  where r.region_name <> 'Asia' and r.region_name <> 'Europe';
