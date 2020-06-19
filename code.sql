-- (1) Using a subquery, find the names of all the tracks for the album "Californication".

select name , AlbumId
from tracks 
where AlbumId in (
  select AlbumId 
  from albums
  where title = "Californication")

.........................................................................................................................................


-- (2) Find the total number of invoices for each customer along with the customer's full name, city and email.
# Option 1

select FirstName,
        LastName,
        City,
        Email, 
        count(invoices.CustomerId) as Total_Invoices
from customers , invoices 
where customers.CustomerId = invoices.CustomerId
Group by customers.customerId


# Option 2 (using Inner Join)

select FirstName,
        LastName,
        City,
        Email, 
        count(invoices.CustomerId) as Total_Invoices
from customers Inner JOIN invoices 
where customers.CustomerId = invoices.CustomerId
Group by customers.customerId

......................................................................................................................................

-- (3)Retrieve the track name, album, artistID, and trackID for all the albums.

select t.Name,
        a.Title as Album,
        a.artistId ,
        t.trackId
from tracks t Inner Join  albums a ;

......................................................................................................................................

-- (4) Retrieve a list with the managers last name, and the last name of the employees who report to him or her.

SELECT m.LastName AS Manager, 
       e.LastName AS Employee
FROM  Employees e INNER JOIN  Employees m
ON e.ReportsTo = m.EmployeeID

......................................................................................................................................

--(5)Find the name and ID of the artists who do not have albums.

Select a.Name  ,                                    -- If Right join is supported else use left Join 
        a.ArtistId,
        ab.title      
From Albums as ab Right Join Artists as a
ON a.ArtistId = ab.ArtistId
WHERE Title IS NULL

/* change the statement to 
From   Artists as a Left Join Albums as ab
ON     a.ArtistId = ab.ArtistId */

......................................................................................................................................

--(6) Use a UNION to create a list of all the employee's and customer's first names 
--    and last names ordered by the last name in descending order.
        
 
SELECT firstname,
       lastname
FROM Employees
UNION
SELECT firstname,
       lastname
FROM Customers
ORDER BY LastName DESC;
