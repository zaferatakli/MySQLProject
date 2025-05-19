--17. Identify the employees in each department who have the highest average salary. List the
--  department name, employee's first name, last name, and the average salary. Order the results by
--  average salary in descending order, showing only those with the highest average salary within their
--  department.

--  Her departmandaki en yüksek ortalama maaşa sahip çalışanları belirle. Departman adını,
--  çalışanın adını, soyadını ve ortalama maaşı listele. Sonuçları departmanlarına göre azalan şekilde
--  sırala, sadece kendi departmanlarında en yüksek ortalama maaşa sahip olanları göster.

select
    d.dept_name as department,
    e.first_name,
    e.last_name,
    AVG(s.salary) as avg_salary
from employees e
inner join dept_emp de on e.emp_no = de.emp_no
inner join departments d on de.dept_no = d.dept_no
inner join salaries s on e.emp_no = s.emp_no
group by d.dept_name, e.emp_no, e.first_name, e.last_name
order by avg_salary desc;