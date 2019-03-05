## Find the number of patients that were hospitalized in this month

SELECT COUNT(*)
FROM Hospitalization
WHERE MONTH(hospitalized_on) = MONTH(current_timestamp);

## Find the total Expenses incurred, its type, and who handled it for this month, and expense details.

SELECT Amount_Spent, s.Name as Supervised_By, et.name as Expense_Type, e.description as Expense_Description
FROM Expenses e
	JOIN Expense_Type et ON e.type_of_expense = et.Identifier
	JOIN Staff s ON e.Supervised_By = s.Identifier
WHERE MONTH(e.Date) = MONTH(current_timestamp);

## Make a report of all staff leaves. (All staff info and how many leaves they’ve taken)

SELECT s.name as Staff_Name, dep.name as Department, des.name as Designation, s.Address, s.Contact_number, s.Email, COUNT(*) as Num_of_leaves
FROM Leaves l 
	LEFT JOIN Staff s ON l.Staff_ID = s.Identifier
	LEFT JOIN Departments dep ON s.department_id = dep.Identifier
	LEFT JOIN Designations des ON s.designation_id = des.Identifier
GROUP BY s.name, dep.name, des.name, s.Address, s.Contact_number, s.Email;

## Find the number of rooms(and their relevant information) that are vacant.

# SELECT 
# FROM Hospitalization h
#	RIGHT OUTER JOIN Room r ON h.Room_Allocated = r.Identifier