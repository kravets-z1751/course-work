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
-- 3 --


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
