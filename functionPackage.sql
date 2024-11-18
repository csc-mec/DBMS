-- 2. Design a PL/SQL package named "EmployeeManagement".

-- Create the package specification.
CREATE OR REPLACE PACKAGE EmployeeManagement AS
    PROCEDURE AddEmployee (
        p_employee_id IN NUMBER,
        p_name IN VARCHAR2,
        p_salary IN NUMBER,
        p_department IN VARCHAR2
    );
    FUNCTION CalculateAnnualBonus (
        p_employee_id IN NUMBER
    ) RETURN NUMBER;
END EmployeeManagement;
/

-- Create the package body.
CREATE OR REPLACE PACKAGE BODY EmployeeManagement AS

    -- Procedure to add a new employee.
    PROCEDURE AddEmployee (
        p_employee_id IN NUMBER,
        p_name IN VARCHAR2,
        p_salary IN NUMBER,
        p_department IN VARCHAR2
    ) IS
    BEGIN
        INSERT INTO Employees (employee_id, name, salary, department)
        VALUES (p_employee_id, p_name, p_salary, p_department);
    END AddEmployee;

    -- Function to calculate the annual bonus.
    FUNCTION CalculateAnnualBonus (
        p_employee_id IN NUMBER
    ) RETURN NUMBER IS
        v_salary NUMBER;
        v_bonus NUMBER;
    BEGIN
        SELECT salary INTO v_salary
        FROM Employees
        WHERE employee_id = p_employee_id;

        v_bonus := v_salary * 0.10; -- Assuming 10% annual bonus.
        RETURN v_bonus;
    END CalculateAnnualBonus;

END EmployeeManagement;
/
