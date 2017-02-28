-- menampilkan seluruh data employee
select * from employees;

-- menampilkan kolom first_name dan last_name dari seluruh data employees
select first_name, last_name from employees;

-- tampilkan data employees yang salary nya tidak lebih besar dari 10000
select * from employees where not salary > 10000; -- where salary <= 10000;

-- tampilkan employees yang salary > 10000 dan job_id = IT_PROG
select * from employees where salary > 10000 and job_id = 'IT_PROG';

select first_name, last_name, salary, job_id from employees;

-- tampilkan employee yang salary antara 5000 dan 10000
select * from employees where salary >= 5000 and salary <= 10000;
select * from employees where salary between 5000 and 10000;

-- tampilkan employee yang job_id IT_PROG
select * from employees where job_id = 'IT_PROG';

-- tampilkan employee yang job_id IT_PROG atau FI_ACCOUNT
select * from employees where job_id = 'IT_PROG' or job_id = 'FI_ACCOUNT';

-- tampilkan employee yang job_id IT_PROG/FI_ACCOUNT/SH_CLERK
select * from employees where job_id in ('IT_PROG', 'FI_ACCOUNT', 'SH_CLERK');

-- tampilkan employee yang job_id bukan IT_PROG/FI_ACCOUNT/SH_CLERK
select * from employees where job_id not in ('IT_PROG', 'FI_ACCOUNT', 'SH_CLERK');


-- tampilkan employee yang tidak ada commision_pct
select * from employees where commission_pct is null;

select * from employees where commission_pct is not null;

-- naikkan salary employees sebanyak 10% untuk yang job_id IT_PROG
update employees set salary=salary*1.1 where job_id='IT_PROG';

--delete from employees where employee_id=103;

-- employee dengan nama tertentu % all wildcard, _ one wildcard char
select * from employees where first_name like '%ana%';
select * from employees where first_name like 'D%';
select * from employees where first_name like 'D_n%';

-- tampilkan bonus 5% dari salary
select first_name, last_name, salary, 0.05*salary as bonus, 
    salary +0.05*salary from employees;

-- full_name = first_name + ' ' + last_name
select concat(concat(first_name, ' '), last_name) as full_name from employees;
select first_name, last_name, hire_date from employees;

-- tampilkan tahun mulai bekerja
select first_name, last_name, extract(year from hire_date) from employees;

-- tampilkan tanggal hari ini
select current_date from dual;

-- tampilkan lama bekerja (dalam tahun)
select first_name,last_name, (current_date-hire_date)/365 as years_worked from employees;

-- tampilkan yang sudah bekerja di atas 10 tahun
select first_name,last_name, (current_date-hire_date)/365 as years_worked from employees where  (current_date-hire_date)/365 > 10.0;

-- tampilkan yang dihire bulan 2
select * from employees where extract(month from hire_date) = 2;

-- di hire february 2008
select * from employees where extract(month from hire_date) = 2 and extract(year from hire_date) = 2008;

-- di hire antara 1 juli 2005 sampai 31 agustus 2008
select * from employees where hire_date between '1-JUL-2005' and '31-AUG-2008';

-- urutkan berdasarkan hire_date (descending) kemudian salary (ascending)
select * from employees order by hire_date desc, salary;

-- tampilkan schema table
describe employees;

select employee_id,first_name,last_name,manager_id from employees;

-- table alias
select pgw.first_name,pgw.last_name from employees pgw;

-- join table employee dengan employee, tampilkan nama manager
select a.employee_id,a.first_name,a.last_name,
       concat(concat(b.first_name, ' '), b.last_name)
       as manager from employees a inner join
       employees b on a.manager_id = b.employee_id;

--- meanmpilkaqn seluruh employees       
select * from employees;
select * from departments;
select first_name, last_name, department_id from
employees;

-- join employee dengan department
select a.employee_id,a.first_name, a.last_name,
       b.department_name from employees a
       inner join departments b on
       a.department_id = b.department_id;
