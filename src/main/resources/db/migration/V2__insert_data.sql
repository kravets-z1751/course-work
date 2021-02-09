-- Countries
INSERT INTO countries(id, name) VALUES (1, 'Беларусь');
INSERT INTO countries(id, name) VALUES (2, 'Россия');
INSERT INTO countries(id, name) VALUES (3, 'Украина');
INSERT INTO countries(id, name) VALUES (4, 'Англия');
INSERT INTO countries(id, name) VALUES (5, 'Италия');
INSERT INTO countries(id, name) VALUES (6, 'Испания');

-- Authors
INSERT INTO authors(id, date_of_birth, surname, name, patronymic, country_id)
    VALUES (1, date('1891-05-03'), 'Булгаков', 'Михаил', 'Афанасьевич', 2);
INSERT INTO authors(id, date_of_birth, surname, name, patronymic, country_id)
    VALUES (2, date('1798-09-24'), 'Мицкевич', 'Адам', 'Бернард', 1);
INSERT INTO authors(id, date_of_birth, surname, name, patronymic, country_id)
    VALUES (3, date('1882-06-25'), 'Луцевич (Купала)', 'Иван (Янка)', 'Доминикович', 1);
INSERT INTO authors(id, date_of_birth, surname, name, patronymic, country_id)
    VALUES (4, date('1882-10-22'), 'Мицкевич (Колас)', 'Константин (Якуб)', 'Михайлович', 1);
INSERT INTO authors(id, date_of_birth, surname, name, patronymic, country_id)
    VALUES (5, date('1859-05-22'), 'Дойл', 'Артур', 'Конан', 4);
INSERT INTO authors(id, date_of_birth, surname, name, patronymic, country_id)
    VALUES (6, date('1547-09-29'), 'Сервантес', 'Мигель', 'де', 6);

-- Books
INSERT INTO books(id, date, definition, name, author_id)
    VALUES (1, date('1929-01-01'),'Поэма в 10 пунктах с прологом и эпилогом, 5 октября 1921', 'Похождения Чичикова', 1);
INSERT INTO books(id, date, definition, name, author_id)
    VALUES (2, date('1940-01-01'),'Роман, 1929—1940, в СССР опубликован в 1966—1967 годах, второй вариант в 1973 году, окончательный вариант в 1990 году', 'Мастер и Маргарита', 1);
INSERT INTO books(id, date, definition, name, author_id)
    VALUES (3, date('1925-01-01'),'', 'На рубяжы', 4);
INSERT INTO books(id, date, definition, name, author_id)
    VALUES (4, date('1913-01-01'),'', 'Нёманаў дар', 4);
INSERT INTO books(id, date, definition, name, author_id)
    VALUES (5, date('1908-01-01'),'', 'Жалейка', 3);
INSERT INTO books(id, date, definition, name, author_id)
    VALUES (6, date('1942-01-01'),'', 'Белорусским партизанам', 3);




