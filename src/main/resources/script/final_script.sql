-- 5.1. Разработать запросы на языке SQL для создания базы данных, указать место хранения, размер и названия файлов базы данных.
-- CREATE DATABASE course_work;
-- 5.2. Разработать запросы на языке SQL для создания всех таблиц (с учетом ограничений целостности данных, ограничений на значения, значений по умолчанию и т.п.).
CREATE TABLE public.authors (
                                id integer NOT NULL,
                                date_of_birth date,
                                name character varying(255),
                                patronymic character varying(255),
                                surname character varying(255),
                                country_id integer
);

CREATE TABLE public.books (
                              id integer NOT NULL,
                              date date,
                              definition character varying(255),
                              name character varying(255),
                              author_id integer,
                              amount numeric(19, 2),
                              count integer
);

CREATE TABLE public.countries (
                                  id integer NOT NULL,
                                  name character varying(255)
);

CREATE TABLE public.customers (
                                  id integer NOT NULL,
                                  date_of_birth date,
                                  email character varying(255),
                                  name character varying(255),
                                  patronymic character varying(255),
                                  phone character varying(255),
                                  surname character varying(255)
);

CREATE TABLE public.order_books (
                                    order_id integer NOT NULL,
                                    book_id integer NOT NULL
);

CREATE TABLE public.orders (
                               id integer NOT NULL,
                               created_at timestamp without time zone,
                               description character varying(255),
                               issued_at timestamp without time zone,
                               customer_id integer
);

-- 5.3. Разработать запросы на языке SQL для создания индексов и ограничений для таблиц БД.
CREATE SEQUENCE author_seq START 1 INCREMENT 1;
CREATE SEQUENCE book_seq START 1 INCREMENT 1;
CREATE SEQUENCE country_seq START 1 INCREMENT 1;
CREATE SEQUENCE customer_seq START 1 INCREMENT 1;
CREATE SEQUENCE order_seq START 1 INCREMENT 1;

ALTER TABLE ONLY public.authors ADD CONSTRAINT authors_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.books ADD CONSTRAINT books_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.countries ADD CONSTRAINT countries_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.customers ADD CONSTRAINT customers_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.orders ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.order_books ADD CONSTRAINT fk7jqqp3k5449j9c6sllmyp263l FOREIGN KEY (book_id) REFERENCES public.books(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.order_books ADD CONSTRAINT fk9ai8wib7jbokb4njnkwb8cy5i FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.books ADD CONSTRAINT fkfjixh2vym2cvfj3ufxj91jem7 FOREIGN KEY (author_id) REFERENCES public.authors(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.authors ADD CONSTRAINT fkln690lik2kyd7hatb4ndtwtdx FOREIGN KEY (country_id) REFERENCES public.countries(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.orders ADD CONSTRAINT fkpxtb8awmi0dk6smoh2vp1litg FOREIGN KEY (customer_id) REFERENCES public.customers(id) ON DELETE CASCADE;

CREATE INDEX authors_country_id ON public.authors USING btree (country_id);
CREATE INDEX books_author_id ON public.books USING btree (author_id);

-- 5.4. Создать схему данных (диаграмму), включить в нее необходимые таблицы. Все связи между таблицами должны иметь свойства «Обеспечение целостности данных». Определить свойства «Каскадное обновление», «Каскадное удаление» в соответствии с бизнес-правилами.
-- 5.5. Разработать запросы на языке SQL для заполнения данными таблиц-справочников и таблицы, соответствующей агрегированной сущности. Количество записей в справочниках должно быть не менее 3-4, а в таблице, соответствующей агрегированной сущности, - не менее 10
INSERT INTO countries(id, name) VALUES (1, 'Беларусь');
INSERT INTO countries(id, name) VALUES (2, 'Россия');
INSERT INTO countries(id, name) VALUES (3, 'Украина');
INSERT INTO countries(id, name) VALUES (4, 'Англия');
INSERT INTO countries(id, name) VALUES (5, 'Италия');
INSERT INTO countries(id, name) VALUES (6, 'Испания');

INSERT INTO authors(id, date_of_birth, surname, name, patronymic, country_id) VALUES (1, date('1891-05-03'), 'Булгаков', 'Михаил', 'Афанасьевич', 2);
INSERT INTO authors(id, date_of_birth, surname, name, patronymic, country_id) VALUES (2, date('1798-09-24'), 'Мицкевич', 'Адам', 'Бернард', 1);
INSERT INTO authors(id, date_of_birth, surname, name, patronymic, country_id) VALUES (3, date('1882-06-25'), 'Луцевич (Купала)', 'Иван (Янка)', 'Доминикович', 1);
INSERT INTO authors(id, date_of_birth, surname, name, patronymic, country_id) VALUES (4, date('1882-10-22'), 'Мицкевич (Колас)', 'Константин (Якуб)', 'Михайлович', 1);
INSERT INTO authors(id, date_of_birth, surname, name, patronymic, country_id) VALUES (5, date('1859-05-22'), 'Дойл', 'Артур', 'Конан', 4);
INSERT INTO authors(id, date_of_birth, surname, name, patronymic, country_id) VALUES (6, date('1547-09-29'), 'Сервантес', 'Мигель', 'де', 6);

INSERT INTO books(id, date, definition, name, author_id, amount) VALUES (1, date('1929-01-01'),'Поэма в 10 пунктах с прологом и эпилогом, 5 октября 1921', 'Похождения Чичикова', 1, 10.0);
INSERT INTO books(id, date, definition, name, author_id, amount) VALUES (2, date('1940-01-01'),'Роман, 1929—1940, в СССР опубликован в 1966—1967 годах, второй вариант в 1973 году, окончательный вариант в 1990 году', 'Мастер и Маргарита', 1, 20.0);
INSERT INTO books(id, date, definition, name, author_id, amount) VALUES (3, date('1925-01-01'),'', 'На рубяжы', 4, 30.0);
INSERT INTO books(id, date, definition, name, author_id, amount) VALUES (4, date('1913-01-01'),'', 'Нёманаў дар', 4, 40.0);
INSERT INTO books(id, date, definition, name, author_id, amount) VALUES (5, date('1908-01-01'),'', 'Жалейка', 3, 50.0);
INSERT INTO books(id, date, definition, name, author_id, amount) VALUES (6, date('1942-01-01'),'', 'Белорусским партизанам', 3, 60.0);

INSERT INTO customers (id, date_of_birth, email, name, patronymic, phone, surname) VALUES (1, '2021-02-10', 'email@gmail.com', 'Петр', 'Петрович', '+375296666666', 'Петров');
INSERT INTO customers (id, date_of_birth, email, name, patronymic, phone, surname) VALUES (2, '2021-02-01', 'tut@tut.by', 'Иван', 'Иванович', '+375333333333', 'Иванов');
INSERT INTO customers (id, date_of_birth, email, name, patronymic, phone, surname) VALUES (3, '2021-02-02', 'alex@gmail.com', 'Алексей', 'Алексеевич', '+375295555555', 'Алексеев');

INSERT INTO orders (id, created_at, description, issued_at, customer_id) VALUES (1, '2021-02-21 20:25:12.000000', 'first', '2021-02-20 20:25:22.000000', 1);
INSERT INTO orders (id, created_at, description, issued_at, customer_id) VALUES (2, '2021-02-22 20:25:35.000000', 'second', '2021-02-21 20:25:40.000000', 2);
INSERT INTO orders (id, created_at, description, issued_at, customer_id) VALUES (3, '2021-02-23 20:25:48.000000', 'third', '2021-02-22 20:25:53.000000', 3);
INSERT INTO orders (id, created_at, description, issued_at, customer_id) VALUES (4, '2021-02-24 20:25:48.000000', 'third', '2021-02-23 20:25:53.000000', 3);
INSERT INTO orders (id, created_at, description, issued_at, customer_id) VALUES (5, '2021-02-25 20:25:48.000000', 'third', '2021-02-24 20:25:53.000000', 3);
INSERT INTO orders (id, created_at, description, issued_at, customer_id) VALUES (6, '2021-02-26 20:25:48.000000', 'third', '2021-02-25 20:25:53.000000', 3);
INSERT INTO orders (id, created_at, description, issued_at, customer_id) VALUES (7, '2021-02-27 20:25:48.000000', 'third', '2021-02-26 20:25:53.000000', 3);
INSERT INTO orders (id, created_at, description, issued_at, customer_id) VALUES (8, '2021-02-28 20:25:48.000000', 'third', '2021-02-27 20:25:53.000000', 3);
INSERT INTO orders (id, created_at, description, issued_at, customer_id) VALUES (9, '2021-03-01 20:25:48.000000', 'third', '2021-02-28 20:25:53.000000', 3);
INSERT INTO orders (id, created_at, description, issued_at, customer_id) VALUES (10, '2021-03-2 20:25:48.000000', 'third', '2021-03-01 20:25:53.000000', 3);

INSERT INTO public.order_books (order_id, book_id) VALUES (1, 1);
INSERT INTO public.order_books (order_id, book_id) VALUES (1, 2);
INSERT INTO public.order_books (order_id, book_id) VALUES (2, 3);
INSERT INTO public.order_books (order_id, book_id) VALUES (2, 4);
INSERT INTO public.order_books (order_id, book_id) VALUES (2, 5);
INSERT INTO public.order_books (order_id, book_id) VALUES (3, 6);
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
-- 8. Создание запросов-действий в MS SQL Server
-- 8.1. Создать новую таблицу, подобную таблице, разработанной в запросе 6.6 с помощью запроса на языке SQL на создание таблицы (условие добавления записей выбрать самостоятельно).
CREATE TABLE temp_table AS SELECT o.id,
               o.created_at,
               o.description,
               o.issued_at,
               (o.created_at - o.issued_at)::varchar                       AS process_time,
               b.name,
               concat(a.surname, ' ', a.name, ' ', a.patronymic) AS book_author,
               concat(c.surname, ' ', c.name, ' ', c.patronymic) AS customer
        FROM orders o
                 INNER JOIN customers c on c.id = o.customer_id
                 INNER JOIN order_books ob on o.id = ob.order_id
                 INNER JOIN books b on b.id = ob.book_id
                 INNER JOIN authors a on a.id = b.author_id
        ORDER BY o.created_at DESC, concat(a.surname, ' ', a.name, ' ', a.patronymic);
-- 8.2. Обновить структуру созданной таблицы, добавив в нее новое поле.
ALTER TABLE temp_table ADD COLUMN temp_column VARCHAR;
-- 8.3. Заполнить новое поле с помощью запроса на обновление данных на языке SQL.
UPDATE temp_table SET temp_column = 'temp_new';
-- 8.4. Обновить значения в поле с помощью запроса на языке SQL с учетом определенного условия.
UPDATE temp_table SET temp_column = 'temp_update';
-- 8.5. Создать запрос на языке SQL на добавление в созданную таблицу новых записей.
INSERT INTO public.temp_table (id, created_at, description, issued_at, process_time, name, book_author, customer, temp_column) VALUES (11, '2021-02-21 20:25:12.000000', 'first', '2021-02-20 20:25:22.000000', '23:59:50', 'Похождения Чичикова', 'Булгаков Михаил Афанасьевич', 'Петров Петр Петрович', null);
-- 8.6. Составить запрос на языке SQL на удаление записей из созданной таблицы (условие удаления записей выбрать самостоятельно).
DELETE FROM temp_table WHERE id = 11;
-- 9. Разработка триггеров, пользовательских функций и хранимых процедур в MS SQL Server
-- 9.1. Разработать хранимые процедуры трех типов для решения актуальных задач (не менее 3) с различным числом и типами данных входных и выходных параметров. Проверить правильность их выполнения с различными исходными данными.
-- 1 --
CREATE PROCEDURE add_book_to_order(orderId integer, bookId integer)
    LANGUAGE SQL
AS
$$
INSERT INTO order_books (order_id, book_id)
VALUES (orderId, bookId);
$$;

-- CALL add_book_to_order(1, 6);
-- CALL add_book_to_order(2, 7);
-- CALL add_book_to_order(3, null);

-- 2 --
CREATE PROCEDURE delete_book_order(orderId integer)
    LANGUAGE SQL
AS
$$
DELETE
FROM order_books
WHERE order_id = orderId;
DELETE
FROM orders
WHERE id = orderId;
$$;
-- CALL delete_book_order(1);
-- CALL delete_book_order(2);
-- CALL delete_book_order(null);

-- 3 --
CREATE PROCEDURE close_orders(p_date date)
    LANGUAGE SQL
AS
$$
UPDATE orders SET issued_at = now() WHERE issued_at IS NULL AND date(created_at) < date(p_date)
$$;

-- CALL close_orders('2021-02-28');
-- CALL close_orders('2021-01-01');
-- CALL close_orders(null);
-- 9.2. Создать несколько определяемых пользователем функции каждого из трех типов: Scalar, Inline Table-valued, Multi-statement able-valued для решения актуальных задач. Проверить правильность их выполнения с различными исходными данными.
-- 1 --
CREATE OR REPLACE FUNCTION get_date() RETURNS text AS
$BODY$
BEGIN
    RETURN now();
END
$BODY$
    LANGUAGE 'plpgsql';
-- 2 --
CREATE OR REPLACE FUNCTION get_book (p_pattern VARCHAR)
    RETURNS TABLE (
                      name VARCHAR,
                      definition VARCHAR
                  )
    LANGUAGE PLPGSQL
AS $$
BEGIN
    RETURN QUERY
        SELECT books.name,
               books.definition
        FROM
            books
        WHERE books.name ILIKE p_pattern;
END;$$;

-- select get_book('%ма%');
-- select get_book('%дар%');
-- select get_book('%ыва%');

-- 3 --
CREATE OR REPLACE FUNCTION get_author_books(
    p_author_id INT
)
    RETURNS TABLE
            (
                title      varchar,
                definition varchar
            )
    LANGUAGE PLPGSQL
AS
$$
DECLARE
    var RECORD;
BEGIN
    FOR var IN (
        SELECT books.name, books.definition
        FROM books
                 INNER JOIN authors a on a.id = books.author_id
        WHERE a.id = p_author_id
    )
        LOOP
            title := UPPER(var.name);
            definition := var.definition;
            RETURN NEXT;
        END LOOP;
END;
$$;

-- select get_author_books(1);
-- select get_author_books(2);
-- select get_author_books(null);

-- 9.3. Разработать триггеры разных типов для разных таблиц (не менее 3). Желательно, чтобы триггеры производили обработку или анализ данных.
-- 1 --
CREATE OR REPLACE FUNCTION function_reduce_count()
    RETURNS TRIGGER
    LANGUAGE PLPGSQL
AS
$$
BEGIN
    UPDATE books
    SET count = (SELECT count - 1 FROM books WHERE id = NEW.book_id)
    WHERE id = NEW.book_id;
    RETURN NEW;
END;
$$;

CREATE TRIGGER trigger_reduce_count
    AFTER INSERT
    ON order_books
    FOR EACH ROW EXECUTE PROCEDURE function_reduce_count();
-- 2 --
CREATE OR REPLACE FUNCTION function_increase_amount()
    RETURNS TRIGGER
    LANGUAGE PLPGSQL
AS
$$
BEGIN
    NEW.amount = NEW.amount + 50;
    RETURN NEW;
END;
$$;

CREATE TRIGGER trigger_increase_amount
    BEFORE INSERT
    ON books
    FOR EACH ROW EXECUTE PROCEDURE function_increase_amount();

-- 9.4. Разработать несколько триггеров и/или хранимых процедур с использованием курсоров.
CREATE OR REPLACE FUNCTION get_book_titles(p_author_id INTEGER)
    RETURNS TEXT AS $$
DECLARE
    titles TEXT DEFAULT '';
    rec_book  RECORD;
    cur_books CURSOR(p_author_id INTEGER)
        FOR SELECT books.name, books.date, concat(a.surname, ' ', a.name) as author
            FROM books
                     INNER JOIN authors a on a.id = books.author_id
            WHERE a.id = p_author_id;
BEGIN
    -- OPEN THE CURSOR
    OPEN cur_books(p_author_id);

    LOOP
        -- FETCH ROW INTO THE FILM
        FETCH cur_books INTO rec_book;
        -- EXIT WHEN NO MORE ROW TO FETCH
        EXIT WHEN NOT FOUND;

        titles := titles || rec_book.author || ' - ' || rec_book.name || ';';
    END LOOP;

    -- CLOSE THE CURSOR
    CLOSE cur_books;

    RETURN titles;
END; $$

    LANGUAGE PLPGSQL;
-- select get_book_titles(1);
-- select get_book_titles(2);
-- select get_book_titles(null);
