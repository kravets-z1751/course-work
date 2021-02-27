package by.kravets.coursework.repository;

import by.kravets.coursework.entity.impl.Order;
import by.kravets.coursework.repository.payload.Result;
import java.time.LocalDate;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface MainRepository extends JpaRepository<Order, Integer> {

  //6. Запросы на выборку данных в MS SQL Server
  //6.1. Разработать запрос на языке SQL, отображающий все поля одной таблицы с отбором по одному условию и сортировкой.
  @Query(value = "SELECT * FROM orders WHERE id > 3 ORDER BY id DESC; ", nativeQuery = true)
  List<Result> get61();

  //6.2. Разработать запрос на языке SQL, отображающий определенные поля одной таблицы с отбором по сложному условию и сортировкой по двум полям.
  @Query(value = "SELECT * FROM orders "
      + "WHERE (date(created_at) >= date(:startDate) AND date(created_at) <= date(:endDate)) "
      + "OR (date(issued_at) >= date(:startDate) AND date(issued_at) <= date(:endDate)) "
      + "ORDER BY issued_at DESC, created_at", nativeQuery = true)
  List<Result> get62(@Param("startDate") LocalDate startDate,
      @Param("endDate") LocalDate endDate);

  //6.3. Разработать запрос на языке SQL с выполнением групповой операции над данными.
  @Query(value = "SELECT customer_id, COUNT(issued_at) FROM orders GROUP BY customer_id", nativeQuery = true)
  List<Result> get63();

  //6.4. Разработать запрос на языке SQL с выполнением групповой операции над данными и агрегирующей функцией.
  @Query(value = "SELECT customer_id, COUNT(issued_at), sum(amount) as amount FROM orders INNER JOIN order_books ob on orders.id = ob.order_id INNER JOIN books b on b.id = ob.book_id GROUP BY customer_id", nativeQuery = true)
  List<Result> get64();

  //6.5. Создать запрос с выполнением групповой операции над данными и отбором определенных групп.
  @Query(value = "SELECT customer_id, COUNT(*), sum(amount) as amount\n"
      + "FROM orders\n"
      + "         INNER JOIN order_books ob on orders.id = ob.order_id\n"
      + "         INNER JOIN books b on b.id = ob.book_id\n"
      + "GROUP BY customer_id HAVING count(*) > 2\n", nativeQuery = true)
  List<Result> get65();

  //6.6. Разработать запрос на языке SQL, результирующая таблица которого соответствовала бы по структуре записи таблице, созданной по агрегированной сущности, но объекты бы представлялись своими наименованиями, взятыми из соответствующих таблиц-справочников, с условием отбора по одному полю. Выполнить сортировку.
  //6.7. Разработать запрос на языке SQL, результирующая таблица которого, должна содержать все поля предыдущего запроса и добавить вычисляемое поле. Выполнить сортировку по нескольким полям.
  //6.8. Разработать запросы на языке SQL, выполняющий объединение нескольких таблиц.
  @Query(value = "SELECT o.id,\n"
      + "       o.created_at,\n"
      + "       o.description,\n"
      + "       o.issued_at,\n"
      + "       (o.created_at - o.issued_at)\\:\\:varchar                       AS process_time,\n"
      + "       b.name,\n"
      + "       concat(a.surname, ' ', a.name, ' ', a.patronymic) AS book_author,\n"
      + "       concat(c.surname, ' ', c.name, ' ', c.patronymic) AS customer\n"
      + "FROM orders o\n"
      + "         INNER JOIN customers c on c.id = o.customer_id\n"
      + "         INNER JOIN order_books ob on o.id = ob.order_id\n"
      + "         INNER JOIN books b on b.id = ob.book_id\n"
      + "         INNER JOIN authors a on a.id = b.author_id\n"
      + "ORDER BY o.created_at DESC, concat(a.surname, ' ', a.name, ' ', a.patronymic);", nativeQuery = true)
  List<Result> get66();

  //6.9. Разработать запрос на языке SQL, выполняющий пересечение нескольких таблиц. Разработать запросы на языке SQL с различными видами подзапросов: с однострочными и многострочными операторами сравнения, с табличными выражениями.
  @Query(value = "SELECT * FROM authors WHERE id IN (SELECT author_id FROM books);", nativeQuery = true)
  List<Result> get69();

  //6.10. Разработать запрос на языке SQL с самосоединением таблицы.
  @Query(value = "SELECT o1.id, o1.description FROM orders o1 JOIN orders o2 ON o1.customer_id = o2.customer_id WHERE o1.customer_id = 1;", nativeQuery = true)
  List<Result> get610();

}
