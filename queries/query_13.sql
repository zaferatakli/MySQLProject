-- 13. Find the latest salaries for each employee

-- Her çalışanın en son maaşlarını bul.

select * from employees.salaries;
select * from employees.employees;

select e.first_name, e.last_name, salaries.emp_no, max(salary)
from salaries
join employees.employees e on e.emp_no=salaries.emp_no
group by emp_no;

select e.emp_no, e.first_name, e.last_name, s.salary, s.from_date
from employees e
join salaries s on e.emp_no = s.emp_no
join (
    select emp_no, MAX(from_date) as latest_date
    from salaries
    group by emp_no
) latest_s on s.emp_no = latest_s.emp_no and s.from_date = latest_s.latest_date;