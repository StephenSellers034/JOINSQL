/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 Select *
 FROM products
 INNER JOIN categories
 On products.CategoryID = categories.CategoryID
 WHERE categories.Name = "Computers";
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT products.Name, products.Price, reviews.Rating
 FROM products
 INNER JOIN reviews
 On products.ProductID = reviews.ProductID
 Where reviews.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT employees.FirstName, employees.LastName, SUM(sales.Quantity) AS total
FROM employees
INNER JOIN sales
on employees.EmployeeID = sales.EmployeeID
Group BY employees.EmployeeID 
ORDER BY total DESC LIMIT 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.NAME AS Department, categories.Name AS Category
FROM departments
INNER JOIN categories
ON departments.DepartmentID = categories.DepartmentID
Where categories.Name = "Appliances" OR  categories.Name = "Games";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT products.Name, SUM(sales.Quantity), SUM(sales.PricePerUnit)
FROM products
INNER JOIN sales
ON products.ProductID = sales.ProductID
WHERE products.ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.NAME AS Product, reviews.Reviewer AS NAME, reviews.Rating, reviews.Comment
FROM products
INNER JOIN reviews
on products.ProductID = reviews.ProductID
WHERE reviews.Rating = 1 AND products.NAME = "Visio TV";

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT employees.EmployeeID, employees.FirstName, employees.LastName, products.NAME AS Product, SUM(sales.Quantity) AS totalsold
FROM products
INNER JOIN sales
ON products.ProductID = sales.SalesID
INNER JOIN employees
ON sales.EmployeeID = employees.EmployeeID
Group BY products.ProductID
ORDER BY totalsold DESC;
