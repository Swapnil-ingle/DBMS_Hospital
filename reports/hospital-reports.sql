## Find the number of patients that were hospitalized in this month

SELECT COUNT(*)
FROM Hospitalization
WHERE MONTH(hospitalized_on) = MONTH(current_timestamp);

## Find the total Expenses incurred, its type, and who handled it for this month.

SELECT Amount_Spent, s.Name as Supervised_By, et.name as Expense_Type
FROM Expenses e
	JOIN Expense_Type et ON e.type_of_expense = et.Identifier
	JOIN Staff s ON e.Supervised_By = s.Identifier
WHERE MONTH(e.Date) = MONTH(current_timestamp);

## Make a report of all staff leaves. (All staff info and how many leaves they’ve taken)

SELECT s.name, s.Department, s.Position, s.Address, s.Contact_number, s.Email, COUNT(*) as Num_of_leaves
FROM Leaves l 
	JOIN Staff s ON l.Staff_ID = s.Identifier
GROUP BY s.name, s.Department, s.Position, s.Address, s.Contact_number, s.Email;

### Same using sub-query

SELECT s.name, s.Department, s.Position, s.Address, s.Contact_number, s.Email, l.num_of_leaves
FROM (SELECT COUNT(*) as num_of_leaves, Staff_ID
		FROM Leaves 
		GROUP BY Staff_ID
		HAVING MONTH(DATE) = MONTH(current_timestamp)) l
	JOIN Staff s ON l.Staff_ID = s.Identifier;

