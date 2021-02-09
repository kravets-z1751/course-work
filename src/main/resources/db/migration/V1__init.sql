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

CREATE SEQUENCE author_seq START 1 INCREMENT 1;
CREATE SEQUENCE book_seq START 1 INCREMENT 1;
CREATE SEQUENCE country_seq START 1 INCREMENT 1;
CREATE SEQUENCE customer_seq START 1 INCREMENT 1;
CREATE SEQUENCE order_seq START 1 INCREMENT 1;

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.order_books
    ADD CONSTRAINT fk7jqqp3k5449j9c6sllmyp263l FOREIGN KEY (book_id) REFERENCES public.books(id) ON DELETE CASCADE;

ALTER TABLE ONLY public.order_books
    ADD CONSTRAINT fk9ai8wib7jbokb4njnkwb8cy5i FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;

ALTER TABLE ONLY public.books
    ADD CONSTRAINT fkfjixh2vym2cvfj3ufxj91jem7 FOREIGN KEY (author_id) REFERENCES public.authors(id) ON DELETE CASCADE;

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT fkln690lik2kyd7hatb4ndtwtdx FOREIGN KEY (country_id) REFERENCES public.countries(id) ON DELETE CASCADE;

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fkpxtb8awmi0dk6smoh2vp1litg FOREIGN KEY (customer_id) REFERENCES public.customers(id) ON DELETE CASCADE;

CREATE INDEX authors_country_id ON public.authors USING btree (country_id);

CREATE INDEX books_author_id ON public.books USING btree (author_id);
