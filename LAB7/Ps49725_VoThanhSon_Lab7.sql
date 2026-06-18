-----Câu1------
select *
into sales.customers_V1
from sales.customers
where city = 'Oakland'
----Câu2------
delete  [BikeStores].[sales].[customers_V1]
WHERE first_name LIKE 'Ka%'
-----Câu3------
update [BikeStores].[sales].[customers_V1]
set first_name = ' Peter '
where first_name = 'Philip'
-----Câu4------
--Xoá các khách hàng---
TRUNCATE TABLE [BikeStores].[sales].[customers_V1];
---Thêm 10 khách hàng-----
INSERT INTO [BikeStores].[sales].[customers_V1]
(first_name, last_name, phone, email, street, city, state, zip_code)
VALUES
('John','Smith','1111111111','john@gmail.com','Street 1','Oakland','CA','94601'),
('Mary','Brown','2222222222','mary@gmail.com','Street 2','Oakland','CA','94602'),
('David','Lee','3333333333','david@gmail.com','Street 3','Oakland','CA','94603'),
('Anna','Taylor','4444444444','anna@gmail.com','Street 4','Oakland','CA','94604'),
('James','Wilson','5555555555','james@gmail.com','Street 5','Oakland','CA','94605'),
('Emma','Clark','6666666666','emma@gmail.com','Street 6','Oakland','CA','94606'),
('Michael','Hall','7777777777','michael@gmail.com','Street 7','Oakland','CA','94607'),
('Sophia','King','8888888888','sophia@gmail.com','Street 8','Oakland','CA','94608'),
('Daniel','Young','9999999999','daniel@gmail.com','Street 9','Oakland','CA','94609'),
('Olivia','Scott','1010101010','olivia@gmail.com','Street 10','Oakland','CA','94610');
