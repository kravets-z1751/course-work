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
    author_id integer
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

INSERT INTO books(id, date, definition, name, author_id) VALUES (1, date('1929-01-01'),'Поэма в 10 пунктах с прологом и эпилогом, 5 октября 1921', 'Похождения Чичикова', 1);
INSERT INTO books(id, date, definition, name, author_id) VALUES (2, date('1940-01-01'),'Роман, 1929—1940, в СССР опубликован в 1966—1967 годах, второй вариант в 1973 году, окончательный вариант в 1990 году', 'Мастер и Маргарита', 1);
INSERT INTO books(id, date, definition, name, author_id) VALUES (3, date('1925-01-01'),'', 'На рубяжы', 4);
INSERT INTO books(id, date, definition, name, author_id) VALUES (4, date('1913-01-01'),'', 'Нёманаў дар', 4);
INSERT INTO books(id, date, definition, name, author_id) VALUES (5, date('1908-01-01'),'', 'Жалейка', 3);
INSERT INTO books(id, date, definition, name, author_id) VALUES (6, date('1942-01-01'),'', 'Белорусским партизанам', 3);

INSERT INTO customers (id, date_of_birth, email, name, patronymic, phone, surname) VALUES (1, '2021-02-10', 'email@gmail.com', 'Петр', 'Петрович', '+375296666666', 'Петров');
INSERT INTO customers (id, date_of_birth, email, name, patronymic, phone, surname) VALUES (2, '2021-02-01', 'tut@tut.by', 'Иван', 'Иванович', '+375333333333', 'Иванов');
INSERT INTO customers (id, date_of_birth, email, name, patronymic, phone, surname) VALUES (3, '2021-02-02', 'alex@gmail.com', 'Алексей', 'Алексеевич', '+375295555555', 'Алексеев');

INSERT INTO orders (id, created_at, description, issued_at, customer_id) VALUES (1, '2021-02-25 20:25:12.000000', 'first', '2021-02-25 20:25:22.000000', 1);
INSERT INTO orders (id, created_at, description, issued_at, customer_id) VALUES (2, '2021-02-25 20:25:35.000000', 'second', '2021-02-25 20:25:40.000000', 2);
INSERT INTO orders (id, created_at, description, issued_at, customer_id) VALUES (3, '2021-02-25 20:25:48.000000', 'third', '2021-02-25 20:25:53.000000', 3);
INSERT INTO orders (id, created_at, description, issued_at, customer_id) VALUES (4, '2021-02-25 20:25:48.000000', 'third', '2021-02-25 20:25:53.000000', 3);
INSERT INTO orders (id, created_at, description, issued_at, customer_id) VALUES (5, '2021-02-25 20:25:48.000000', 'third', '2021-02-25 20:25:53.000000', 3);
INSERT INTO orders (id, created_at, description, issued_at, customer_id) VALUES (6, '2021-02-25 20:25:48.000000', 'third', '2021-02-25 20:25:53.000000', 3);
INSERT INTO orders (id, created_at, description, issued_at, customer_id) VALUES (7, '2021-02-25 20:25:48.000000', 'third', '2021-02-25 20:25:53.000000', 3);
INSERT INTO orders (id, created_at, description, issued_at, customer_id) VALUES (8, '2021-02-25 20:25:48.000000', 'third', '2021-02-25 20:25:53.000000', 3);
INSERT INTO orders (id, created_at, description, issued_at, customer_id) VALUES (9, '2021-02-25 20:25:48.000000', 'third', '2021-02-25 20:25:53.000000', 3);
INSERT INTO orders (id, created_at, description, issued_at, customer_id) VALUES (10, '2021-02-25 20:25:48.000000', 'third', '2021-02-25 20:25:53.000000', 3);

INSERT INTO public.order_books (order_id, book_id) VALUES (1, 1);
INSERT INTO public.order_books (order_id, book_id) VALUES (1, 2);
INSERT INTO public.order_books (order_id, book_id) VALUES (2, 3);
INSERT INTO public.order_books (order_id, book_id) VALUES (2, 4);
INSERT INTO public.order_books (order_id, book_id) VALUES (2, 5);
INSERT INTO public.order_books (order_id, book_id) VALUES (3, 6);
