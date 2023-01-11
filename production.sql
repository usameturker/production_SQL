-- SELECT
select id, fname_lname || '= final point: ' || av_po || ' date is: ' || reg_date as infos from students 
where id between 2 and 4
select * from students

-- SELECT DISTINC
select distinct on (fname_lname) fname_lname, reg_date from students

-- INSERT
insert into students (id,fname_lname,av_po,reg_date) 
values
(1,'claire cool',85,'2022-11-01'),
(2,'jack soul',25,'2022-10-20'),
(3,'angel smith',90,'2022-02-17'),
(4,'mike stan',65,'2020-08-09'),
(5,'jennifer badson',28,'2020-12-23'),
(6,'dua lipa',43,'2022-03-16')

insert into students (fname_lname,id) values ('hasso numan',7)
select * from students where reg_date is  null

insert into students values (7,'dua lipa',78,'2022-10-07'),  -- if we will put values to all columns no need to write (id,fname_lname) like this
(8,'mike stan',34,'2022-10-07')

-- UPDATE
update students set av_po=48 where reg_date is null

select * from students
select * from points

-- DELETE
delete from students where reg_date is null -- delete from students -> delete all records

create table students
( id int primary key,
 fname_lname varchar(30) not null,
 av_po real,
 reg_date date
)

--Min Max Count Avg Sum
select sum(av_po) summ,avg(av_po) "average points",count(id),min(av_po) "minimum points", max(av_po) "max points" from students

-- LIKE
select * from students where fname_lname like '_u%' -- _ single character % characters 

create table points(
	student_id int check(student_id>0) not null,
	points int not null,
constraint avpo_fk foreign key(student_id) references students(id)
on delete cascade)

insert into points 
values
(1 , 89),
(2 , 71),
(3, 79 ),
(4, 57 ),
(5, 22 ),
(6, 98 )

update points
set points = 65 where student_id=4

select * from students where av_po in  (select points from points where points>60)

-- ORDER BY
select * from students order by (fname_lname, av_po)
select * from students order by length(fname_lname) desc

-- LIKE
select * from students where fname_lname ~~ 'm%'  -- ILIKE is non-case sensitive 'ABC%' can abc ABc Abc etc. ~~ like, ~~* ilike, !~~ not like, !~~* not ilike

--  Ilk harfi h,son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tum bilgilerini yazdiran QUERY yazin

SELECT *
FROM kelimeler
WHERE kelime ~ 'h[ai]t';


-- Ilk harfi h,son harfi t olup 2.harfi a ile k arasinda olan 3 harfli kelimelerin tum bilgilerini 
SELECT *
FROM kelimeler
WHERE kelime ~ 'h[a-k]t';
-- SORU : Icinde m veya i olan kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT *
FROM kelimeler
WHERE kelime ~ '[mi]';
-- SORU : a veya s ile baslayan kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT *
FROM kelimeler
WHERE kelime ~ '^[as]';

-- m veya f ile biten kelimeler  ~ '[mf]$';
-- 2. harfi e,i veya o olmayan kelimelerin !~ '[_eio]';


-- Limit offset
select * from students order by fname_lname desc limit 4 offset 3

-- concat
update students set fname_lname=fname_lname || 'bu ne laan'

--subqueries
update students
set fname_lname= (select points from points where student_id=1)+1
where id=1

--fetch next or fetch first
select * from students order by id
offset 3 rows
fetch first 2 row only


CREATE TABLE manav
(
isim varchar(50), 
Urun_adi varchar(50), 
Urun_miktar int
)

INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

-- Group by
SELECT  isim, sum(urun_miktar) AS alinantopmeyve
FROM manav
GROUP BY isim


CREATE TABLE employee (
	employee_id INT PRIMARY KEY,
	first_name VARCHAR (255) NOT NULL,
	last_name VARCHAR (255) NOT NULL,
	manager_id INT,
	FOREIGN KEY (manager_id) 
	REFERENCES employee (employee_id) 
	ON DELETE CASCADE
);
INSERT INTO employee (
	employee_id,
	first_name,
	last_name,
	manager_id
)
VALUES
	(1, 'Windy', 'Hays', NULL),
	(2, 'Ava', 'Christensen', 1),
	(3, 'Hassan', 'Conner', 1),
	(4, 'Anna', 'Reeves', 2),
	(5, 'Sau', 'Norman', 2),
	(6, 'Kelsie', 'Hays', 3),
	(7, 'Tory', 'Goff', 3),
	(8, 'Salley', 'Lester', 3);
	
	select * from employee
	
-- Join INNER, LEFT, RIGHT, FULL OUTER, SELF, Cross, Natural
SELECT
    e.first_name || ' ' || e.last_name employee,
    m.first_name || ' ' || m.last_name manager
FROM
    employee e
LEFT JOIN employee m ON m.employee_id = e.manager_id order by manager

-- Cross join
select * from employee cross join manavRhfd w\r.h/jm

-- Having
select isim , sum(urun_miktar) "total urun" from manav group by isim having sum(urun_miktar)>5

-- Union (Must have same number of columns and data type) union all show also duplicated rows    ,(employee_id),(employee_id,first_name)
SELECT * FROM table_name1
UNION
SELECT * FROM table_name2;

select employee_id, first_name,last_name from employee group by grouping sets( (first_name,last_name),(employee_id),())


CREATE TABLE mart
(
urun_id int,
musteri_isim varchar(50), 
urun_isim varchar(50)
);

INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE nisan 
(
urun_id int ,
musteri_isim varchar(50), 
urun_isim varchar(50)
);

INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

select * from mart
select * from nisan

select urun_isim, musteri_isim from nisan where not exists (select urun_isim from mart where mart.urun_isim=nisan.urun_isim)

update mart set musteri_isim='Denis' where musteri_isim='John' AND urun_id=10

select urun_isim from mart where musteri_isim='Adam'  intersect select urun_isim from nisan where urun_id=10

select urun_isim from mart where musteri_isim='John'  except select urun_isim from nisan


--ALTER TABLE
alter table mart add toplam_satis2 int, add gender char(1)-- add new column

alter table mart drop column toplam_satis2 --delete a column
alter table mart rename column gender to cinsiyet --rename a column
alter table mart rename to march -- rename table name
alter table march alter column toplam_satis type real
alter table march alter column toplam_satis set not null
alter table march alter column cinsiyet type int using (cinsiyet::int) -- from string to int
alter table march alter column cinsiyet type char(1) -- from int to string
select * from march
begin;
insert into march values (100,'mike','GMC','100',1);
savepoint x;
insert into march values (101,'glenn','Lexus','300',2);
savepoint y;
insert into march values (102,'maria','Acura','500',2)
rollback to y;
commit;




-- CREATE TABLE and INSERT INTO

create table employees (
id serial primary key,
fname varchar (50) not null,
lname varchar (50) not null,
manager_id int,
total_sales real
)
insert into employees (fname,lname,manager_id,total_sales) values ('Andy', 'Straussen',1,23455.89),
('Bob', 'Konus',1,1565.27),('Claire', 'Piklen',1,456.77),('Denis', 'Rulis',2,99455.43),
('Bob', 'Zee',2,190935.99),('Solmon', 'Cruise',3,76786.68),('Simon', 'Kurtis',3,9077.91)

create table employees_address(
id serial, address varchar(100) not null, foreign key(id) references employees (id)on delete cascade)

insert into employees_address (address) values ('539 minute rd. voorhees,NJ 08043'),('27 washington dr. Exton,PA 19020'),
('542 minute rd. voorhees,NJ 08043'),('28 washington dr. Exton,PA 19020'),
('540 minute rd. voorhees,NJ 08043'),('30 washington dr. Exton,PA 19020')


select * from employees_address
select * from employees



select * from employees_address where id in(2,5,7)
select * from employees_address where id between 2 and 4
select * from employees_address where id not between 2 and 4

select * from employees where id in(select id from employees_address where address like '%voorhees%')


--CREATE TABLE from exist table -- as select fname_lname -- or as select *-> all of the columns
CREATE TABLE c_students as select fname_lname, av_po from students

-- INSERT INTO
INSERT INTO employee VALUES (10,'Andy', 'Krossen',5,'F',1)
select * from employee




------------------------*******SECOND SESSION*******---------------------------




-- SELECT

select category_name from production.categories

select count(*) as a, p.category_id from production.products as p group by p.category_id order by a desc


select city, count(*) as c from sales.customers where state = 'CA' group by city  having count(*)>10 order by c desc

select city, first_name, last_name from sales.customers order by city desc,first_name asc

SELECT city,first_name,last_name FROM sales.customers ORDER BY state;

SELECT first_name, first_name || ' ' || last_name as fullname FROM sales.customers ORDER BY LENgth(first_name || ' ' || last_name);

SELECT first_name,customer_id,last_name FROM sales.customers ORDER BY 1 ,2 desc -- sorting from select order 1-> first_name 2-> customer_id

-- Offset Fetch
select product_name, list_price from production.products order by list_price, product_name offset 10 rows fetch next 10 rows only

-- top 10 expensive products
select product_name, list_price from production.products order by list_price desc, product_name fetch next 10 rows only

-- Distinct
select distinct phone from sales.customers order by phone
/* select city, state, zip_code from sales.customers group by city, state, zip_code order by city, state, zip_code means below*/
select distinct city, state, zip_code from sales.customers order by city



select customer_id, first_name, phone from sales.customers where phone is null order by first_name
select customer_id, first_name, phone from sales.customers where phone is not null order by first_name

select customer_id, first_name, phone from sales.customers where first_name ~ '^[R-Z].d.*[mf]$' order by first_name

select customer_id, first_name, phone from sales.customers where phone like '%(9%' order by first_name

select ss.store_name, shipped_date, staff_id from sales.orders so inner join sales.stores ss on so.store_id=ss.store_id where staff_id=2 and shipped_date is not null
select * from production.products

select product_name, category_name, list_price from production.products p inner join production.categories c on c.category_id=p.category_id order by product_name desc

select 'brand: ' || brand_name || ' category: ' || category_name Full_description, product_name, category_name,list_price from production.products p inner join production.categories c on p.category_id=c.category_id inner join production.brands b on b.brand_id=p.brand_id order by list_price desc

select product_name, order_id from production.products p left join sales.order_items o on o.product_id=p.product_id order by order_id desc

select p.product_name, o.order_id, i.item_id, o.order_date from production.products p left join sales.order_items i on i.product_id=p.product_id left join sales.orders o on o.order_id=i.order_id where order_date between '20180201' and '20180228' order by order_id desc

select p.product_name, o.order_id, i.item_id, o.order_date from production.products p left join sales.order_items i on i.product_id=p.product_id left join sales.orders o on o.order_id=i.order_id and o.order_id=100 order by order_id


-- Cross join
SELECT
    product_id,
    product_name,
    store_id
FROM production.products
CROSS JOIN sales.stores
ORDER BY
    product_name,
    store_id;

--

SELECT
    s.store_id,
    p.product_id,
     sales
FROM
    sales.stores s
CROSS JOIN production.products p
LEFT JOIN (
    SELECT
        s.store_id,
        p.product_id,
        SUM (quantity * i.list_price) sales
    FROM
        sales.orders o
    INNER JOIN sales.order_items i ON i.order_id = o.order_id
    INNER JOIN sales.stores s ON s.store_id = o.store_id
    INNER JOIN production.products p ON p.product_id = i.product_id
    GROUP BY
        s.store_id,
        p.product_id order by sales desc
) c ON c.store_id = s.store_id
AND c.product_id = p.product_id

ORDER BY
    product_id,
    store_id;


-- group by
select count(order_id) order_placed,customer_id, extract (year from order_date) order_year from sales.orders  group by customer_id, order_year having count(order_id) > 2 order by order_placed desc fetch next 1 rows only


SELECT
    brand_name,
    MIN (list_price) min_price,
    MAX (list_price) max_price,
	avg(list_price) avg_price
FROM
    production.products p
INNER JOIN production.brands b ON b.brand_id = p.brand_id

GROUP BY
    brand_name
ORDER BY
    avg_price desc;
	
	
	
	
select a.quantity, b.quantity,a.list_price, b.store_id from sales.order_items a inner join production.stocks b on a.product_id=b.product_id and a.quantity>b.quantity 




SELECT
    order_id,
    SUM (
        quantity * list_price * (1 - discount)
    ) net_value
FROM
    sales.order_items
GROUP BY
    order_id
HAVING
    SUM (
        quantity * list_price * (1 - discount)
    ) > 20000
ORDER BY
    net_value;

-- Grouping Sets

SELECT
	brand,
	category,
	SUM (sales) sales
FROM
	sales.sales_summary
GROUP BY
	GROUPING SETS (
		(brand, category),
		(brand),
		(category),
		()
	)
ORDER BY
	brand,
	category;


-- Create a new table from exist ones.

SELECT
    b.brand_name AS brand,
    c.category_name AS category,
    p.model_year,
    round(
        SUM (
            quantity * i.list_price * (1 - discount)
        ),
        0
    ) sales INTO sales.sales_summary
FROM
    sales.order_items i
INNER JOIN production.products p ON p.product_id = i.product_id
INNER JOIN production.brands b ON b.brand_id = p.brand_id
INNER JOIN production.categories c ON c.category_id = p.category_id
GROUP BY
    b.brand_name,
    c.category_name,
    p.model_year
ORDER BY
    b.brand_name,
    c.category_name,
    p.model_year;
select * from sales.sales_summary

select brand, category , SUM (sales) sales from sales.sales_summary group by rollup(brand,category);


select * from production.stocks
select order_id, list_price from sales.order_items where product_id in (select distinct product_id from production.stocks where quantity=1)

SELECT
    product_name,
    list_price, brand_id
FROM
    production.products
WHERE
    list_price >= all (
        SELECT
            AVG (list_price)
        FROM
            production.products
        GROUP BY
            brand_id
    ) order by list_price


select round(AvgL,2), list_price,product_name,p1.brand_id from production.products as p1 inner join  (select avg(list_price) as AvgL, brand_id from production.products group by brand_id) p2 on p1.brand_id=p2.brand_id where p1.list_price < p2.AvgL order by brand_id, list_price




SELECT
    customer_id,
    first_name,
    last_name,
    city
FROM
    sales.customers c
WHERE
    not exists (
        SELECT
            customer_id
        FROM
            sales.orders o
        WHERE
            o.customer_id = c.customer_id
        AND extract (year from order_date) = 2017
    )
ORDER BY
    first_name,
    last_name;



SELECT 
  AVG(order_count) average_order_count_by_staff
FROM
(
    SELECT 
	staff_id, 
        COUNT(order_id) order_count
    FROM 
	sales.orders
    GROUP BY 
	staff_id
) t;






WITH cte_sales_amounts (stafff, staffl,sales, year) AS (
    SELECT    
        first_name, last_name, 
        SUM(quantity * list_price * (1 - discount)),
        extract (year from order_date)
    FROM    
        sales.orders o
    INNER JOIN sales.order_items i ON i.order_id = o.order_id
    INNER JOIN sales.staffs s ON s.staff_id = o.staff_id
    GROUP BY 
        first_name,last_name, 
         extract (year from order_date)
)

SELECT
    stafff, staffl,
    sales
FROM 
    cte_sales_amounts
WHERE
    year = 2018;




-- insert another table's rows to table (both have same columns)

CREATE TABLE sales.addresses (
    address_id INT,
    street VARCHAR (255) NOT NULL,
    city VARCHAR (50),
    state VARCHAR (25),
    zip_code VARCHAR (5)
);   

select * from sales.addresses

INSERT INTO sales.addresses (street, city, state, zip_code) 
SELECT
    street,
    city,
    state,
    zip_code
FROM
    sales.customers
ORDER BY
    first_name,
    last_name; 


-- Update

UPDATE sales.taxes
SET max_local_tax_rate += 0.02,
    avg_local_tax_rate += 0.01
WHERE
    max_local_tax_rate = 0.01;
	
	
UPDATE
    sales.commissions
SET
    sales.commissions.commission = 
        c.base_amount * t.percentage
FROM 
    sales.commissions c
    INNER JOIN sales.targets t
        ON c.target_id = t.target_id;
-- Delete

DELETE FROM table_name1; delete all rows

 DELETE FROM tablo_adı WHERE sutun_adi = veri;

-- Find Duplicates

SELECT 
    col, 
    COUNT(col)
FROM 
    table_name
GROUP BY 
    col
HAVING 
    COUNT(col) > 1;

-- delete duplicates

WITH cte AS (
    SELECT 
        contact_id, 
        first_name, 
        last_name, 
        email, 
        ROW_NUMBER() OVER (
            PARTITION BY 
                first_name, 
                last_name, 
                email
            ORDER BY 
                first_name, 
                last_name, 
                email
        ) row_num
     FROM 
        sales.contacts
)
DELETE FROM cte
WHERE row_num > 1;














