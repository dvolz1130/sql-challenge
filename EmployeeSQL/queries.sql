--- List the following details of each employee: employee number, last name, first name, sex, and salary.

select e.emp_no as Employee_number, e.last_name, e.first_name, e.sex, s.salary from employees e, salaries s where e.emp_no = s.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.

select first_name, last_name, hire_date from employees where DATE_PART('year',hire_date) = 1986 order by 3;

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

select d.dept_no, d.dept_name, e.emp_no, e.first_name, e.last_name from dept_manager dm 
left join departments d on dm.dept_no = d.dept_no
left join employees e on dm.emp_no = e.emp_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select first_name, last_name, sex from employees where first_name = 'Hercules' and last_name like 'B%'

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, d.dept_name from employees e
left join dept_emp de on e.emp_no = de.emp_no
inner join departments d on d.dept_no = de.dept_no
where d.dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, d.dept_name from employees e
left join dept_emp de on e.emp_no = de.emp_no
inner join departments d on d.dept_no = de.dept_no
where d.dept_name in ('Sales', 'Development');

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select last_name, count(last_name) as frequency from employees group by last_name order by frequency desc;


