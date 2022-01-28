-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp.emp_no) emp.emp_no, emp.first_name, emp.last_name, t.title
INTO unique_titles
FROM employees as emp inner join titles as t on emp.emp_no = t.emp_no
WHERE emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
	AND t.to_date = '9999-01-01'
ORDER BY emp.emp_no, t.to_date DESC;


SELECT COUNT(emp_no) AS "Count", title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY "Count" DESC

-- DELIVERABLE 2

SELECT DISTINCT ON (emp.emp_no)
		emp.emp_no,
		emp.first_name, 
		emp.last_name, 
		emp.birth_date,
		de.from_date,
		de.to_date,
		t.title
INTO mentorship_eligibility
FROM dept_emp as de 
	INNER JOIN employees as emp 
		ON de.emp_no = emp.emp_no
	INNER JOIN titles as t
		ON t.emp_no = emp.emp_no
WHERE t.to_date = '9999-01-01'
	AND emp.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY emp.emp_no
		
