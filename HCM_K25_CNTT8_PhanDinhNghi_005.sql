CREATE DATABASE HACKATHON;
USE HACKATHON;

-- CAU 1
CREATE TABLE Department(
	dept_id VARCHAR(5) PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(100) NOT NULL,
    manager_name VARCHAR(50) NOT NULL
);

CREATE TABLE Emloyees(
	emp_id VARCHAR(5) PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    dob DATE NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL UNIQUE,
    dept_id VARCHAR(5),
    CONSTRAINT FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE Projects(
	project_id VARCHAR(5) PRIMARY KEY,
    project_name VARCHAR(20) NOT NULL UNIQUE,
    start_date DATE,
    end_date DATE,
    budget DECIMAL(10,2)
);

CREATE TABLE Assignment(
	assignment_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id VARCHAR(5),
    project_id VARCHAR(5),
    role VARCHAR(20),
    hours_worked INT,
	CONSTRAINT FOREIGN KEY (emp_id) REFERENCES Emloyees(emp_id),
	CONSTRAINT FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);

-- CAU 2
INSERT INTO Department
VALUES
('D01', 'IT', 'Floor 5', 'Nguyen Van An'),
('D02', 'HR', 'Floor 2', 'Tran Thi Binh'),
('D03', 'Sales', 'Floor 1', 'Le Van Cuong'),
('D04', 'Marketing', 'Floor 3', 'Pham Thi Duong'),
('D05', 'Finance', 'Floor 4', 'Hoang Van Tu');

INSERT INTO Emloyees
VALUES
('E001', 'Nguyen Van Tuan', '1990-01-01', 'tuan@gamil.com','0901234567', 'D01'),
('E002', 'Tran Thi LAn', '1995-05-05', 'lan@gamil.com','0902345678', 'D02'),
('E003', 'Le Minh Khoi', '1992-10-10', 'khoi@gamil.com','0903456789', 'D01'),
('E004', 'Pham Hoang Nam', '1998-12-12', 'nam@gamil.com','0904567890', 'D03'),
('E005', 'Vu Minh Ha', '1996-07-07', 'ha@gamil.com','0905678901', 'D01');

INSERT INTO Projects
VALUES
('P001', 'Website Redesign', '2025-01-01', '2025-06-01', 5000000),
('P002', 'Mobie App Dev', '2025-02-01', '2025-08-01', 8000000),
('P003', 'HR System', '2025-03-01', '2025-09-01', 3000000),
('P004', 'Marketing Campaign', '2025-04-01', '2025-05-01', 1000000),
('P005', 'AI Research', '2025-01-01', '2025-06-01', 10000000);

INSERT INTO Assignment
VALUES
(1, 'E001', 'P001', 'Developer', 150),
(2, 'E003', 'P001', 'Tester', 100),
(3, 'E001', 'P002', 'Teach Lead', 200),
(4, 'E005', 'P005', 'Data Scientist', 180),
(5, 'E004', 'P004', 'Content Creator', 50);

-- CAU 3
SET SQL_SAFE_UPDATES = 0;
UPDATE Department
SET location = 'Floor 10'
WHERE dept_id = 'D01';

-- CAU 4
UPDATE Projects
SET budget = budget * 1.1
WHERE project_id = 'P005';

-- CAU 5
DELETE FROM Assignment
WHERE hours_worked = 0 OR role = 'Intern';

-- CAU 6
SELECT emp_id, emp_name, email
FROM Emloyees
WHERE dept_id = 'D01';

-- CAU 7
SELECT project_name, start_date, budget
FROM Projects
WHERE project_name LIKE '%System';

-- CAU 8
SELECT project_id, project_name, budget
FROM Projects
ORDER BY budget DESC;

-- CAU 9
SELECT * , YEAR(CURDATE()) - YEAR(dob) AS AGE
FROM Emloyees
ORDER BY AGE DESC
LIMIT 3;

-- CAU 10
SELECT project_id, project_name
FROM Projects
LIMIT 3 OFFSET 1;

-- CAU 11
SELECT a.assignment_id, e.emp_name, p.project_name
FROM Assignment
JOIN 

-- CAU 12
SELECT d.dept_id, d.dept_name, e.emp_name
FROM Department d 
INNER JOIN Emloyees e ON d.dept_id =e.emp_id ;


