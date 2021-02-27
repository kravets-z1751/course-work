-- 7. Создание представлений в MS SQL Server
-- 7.1. Разработать запрос на языке SQL для создания представления, включающего все поля таблицы, соответствующей агрегированной сущности, но значения в полях внешнего ключа заменить названиями соответствующих объектов, взятых из таблиц-справочников (по аналогии с запросом 5.3).
CREATE VIEW v_orders AS
SELECT o.id AS order_id,
       o.created_at AS created_at,
       o.description AS order_description,
       o.issued_at AS issued_at,
       b.name AS book_name,
       concat(a.surname, ' ', a.name, ' ', a.patronymic) AS book_author,
       concat(c.surname, ' ', c.name, ' ', c.patronymic) AS customer
FROM orders o
         INNER JOIN customers c on c.id = o.customer_id
         INNER JOIN order_books ob on o.id = ob.order_id
         INNER JOIN books b on b.id = ob.book_id
         INNER JOIN authors a on a.id = b.author_id;
-- 7.2. Разработать запрос на языке SQL для создания представления на основе представления, созданного в п. 7.1, и добавить в него вычисляемое поле и сортировку по двум полям.
CREATE VIEW v_customer_orders AS
SELECT o.id AS order_id,
       o.issued_at - o.created_at AS processing_time,
       o.created_at AS created_at,
       o.description AS order_description,
       o.issued_at AS issued_at,
       count(b.id),
       concat(c.surname, ' ', c.name, ' ', c.patronymic) AS customer
FROM orders o
         INNER JOIN customers c on c.id = o.customer_id
         INNER JOIN order_books ob on o.id = ob.order_id
         INNER JOIN books b on b.id = ob.book_id
         INNER JOIN authors a on a.id = b.author_id
GROUP BY o.id, o.created_at, o.description, o.issued_at, concat(c.surname, ' ', c.name, ' ', c.patronymic)
ORDER BY concat(c.surname, ' ', c.name, ' ', c.patronymic), o.created_at DESC;
