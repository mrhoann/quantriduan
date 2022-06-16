/*1. Danh sách các employees. Thông tin bao gồm EmployeeId, EmployeeName, Phone, Age.
Trong đó EmployeeName được ghép từ LastName và FirstName; Age là tuổi được tính
từ năm hiện hành (GetDate()) và năm của Birthdate.*/
select e.EmployeeId, CONCAT(LastName,' ' ,FirstName) EmployeeName, e.HomePhone, DATEDIFF(year,BirthDate,GETDATE()) Age from  employees e
/*2. Danh sách employees có năm sinh <=1960. */
select * from employees where  Year(BirthDate) <= 1960
/*3. Danh sách các products có từ ‘Boxes’ trong cột QuantityPerUnit.*/
select * from products where QuantityPerUnit LIKE '%Boxes%';
/*4. Danh sách các products có Unitprice lớn hớn 10 và nhỏ hơn 15.*/
select * from products where Unitprice >10 and Unitprice <15 
/*5. Danh sách các orders có OrderDate được lập trong tháng 9 năm 1996.*/
select * from orders where MOnth(OrderDate) = 9 and Year(OrderDate) = 1996
/*6. Danh sách các products ứng với tiền tồn vốn. Thông tin bao gồm ProductId,
ProductName, Unitprice, UnitsInStock, TotalAccount. Trong đó TotalAccount=
UnitsInStock * Unitprice.*/
select ProductId, ProductName, Unitprice, UnitsInStock, TotalAccount=
UnitsInStock * Unitprice from products
/*7. Danh sách 5 customers có city bắt đầu ‘M’.*/
select Top 5 * from customers where City LIKE 'M%'
/*8. Danh sách 2 employees có tuổi lớn nhất. Thông tin bao gồm EmployeeID,
EmployeeName, Age. Trong đó, EmployeeName được ghép từ LastName và FirstName;
Age là năm hiện hành từ cho năm sinh.*/
select Top 2 EmployeeID, CONCAT(LastName,' ' ,FirstName) EmployeeName, DATEDIFF(year,BirthDate,GETDATE()) Age from employees Order by Age desc 
/*9. Danh sách các products đã từng có khách hàng đặt hàng (tức là ProductId có trong Order
Details). Thông tin bao gồm ProductId, ProductName, Unitprice.*/
select distinct p.ProductID, p.ProductName, o.Unitprice from products p left join dbo.[Order Details] o on p.ProductID=o.ProductID 
/*10. Cho biết những Customers chưa từng lập hóa đơn. */
select * from Customers c left join Orders o on c.CustomerID=o.CustomerID where o.CustomerID is null
/*11. Các customer không lập hóa đơn trong tháng 7/1997*/
select c.CustomerID,c.CompanyName from Customers c left join Orders o on c.CustomerID=o.CustomerID 
where MOnth(o.OrderDate) != 7 and Year(o.OrderDate) != 1997
/*12. Các customer có lập hóa đơn trong 15 ngày đầu tiên của 7/1997*/
select * from Customers c left join Orders o on c.CustomerID=o.CustomerID 
where day(o.OrderDate) between 1 and 15  and MOnth(o.OrderDate) = 7 and Year(o.OrderDate) = 1997
/*13. Danh sách các product, thông tin bao gồm: Productname, CategoryName, Unitprice.*/
select p.Productname, c.CategoryName, p.Unitprice from products p left join Categories c on p.CategoryID=c.CategoryID 
/*14. Liệt kê danh sách các City có Customers hoặc Employee (dùng Union) */
select city from Employees
UNION
select city from Customers
/* 15. Liệt kê danh sách các Country có Customers hoặc Employee (dùng Union)*/
select Country from Employees
UNION
select Country from Customers
/*16. Hợp danh sách các Customer và Employee lại với nhau. Thông tin gồm CodeID, Name,
Address, Phone. Trong đó CodeID là CustomerID/EmployeeID, Name là
Companyname/LastName + FirstName, Phone là Homephone.*/
select EmployeeID CodeID,CONCAT(LastName,' ',FirstName) Name,Address , Homephone as Phone  from Employees

/* Exercise 1
Write a SELECT query to display Full name of all employees in lower-case as following:*/
select Lower(CONCAT(LastName,' ',FirstName)) Fullname  from Employees
/* Exercise 2
Write a SELECT query to display Full name of all employees in upper-case as following:*/
select Upper(CONCAT(LastName,' ',FirstName)) Fullname  from Employees
/* Exercise 3
Write a SELECT query to display all employees that are from United States as following:*/
select * from Employees where country='USA'
/* Exercise 4
Write a SELECT query to display all customers that are from UK as following:*/
select * from Customers where country='UK'
/* Exercise 5
Write a SELECT query to display all customers that are from Mexico as following:*/
select * from Customers where country='Mexico'
/* Exercise 6
Write a SELECT query to display all customers that are from Sweden as following:*/
select * from Customers where country='Sweden'
/* Exercise 7
In Products table, values of UnitsInStock tell you the total units in the inventory of every product.
Write a SELECT query to display product id, product name, unit price of all products such that
their total units in the inventory is between 5 and 10 as following:*/
select ProductID, productname, unitprice, UnitsInStock  from Products where UnitsInStock between 5 and 10
select * from Products
/* Exercise 8
In Products table, the value of UnitsOnOrder tells you the total ordered units for every product. Write
a SELECT query to display product id, product name, unit price, re-order level… of all products that
have total ordered units between 60 and 100 as following:*/
select ProductID, productname, unitprice, reorderlevel, UnitsOnOrder  from Products where UnitsOnOrder between 60 and 100
/* Exercise 9
Write a SELECT query to display total orders of every employee in 1996 as following:*/
select SUM(OrderID) totalorders from orders where Year(OrderDate)=1996
/* */
/* */
