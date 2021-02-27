package by.kravets.coursework.repository;

import by.kravets.coursework.entity.impl.Order;
import by.kravets.coursework.repository.payload.CustomerProcessedOrderCount;
import by.kravets.coursework.repository.payload.OrderInfo;
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
  List<OrderInfo> getOrders();

  //6.2. Разработать запрос на языке SQL, отображающий определенные поля одной таблицы с отбором по сложному условию и сортировкой по двум полям.
  @Query(value = "SELECT * FROM orders "
      + "WHERE (date(created_at) >= date(:startDate) AND date(created_at) <= date(:endDate)) "
      + "OR (date(issued_at) >= date(:startDate) AND date(issued_at) <= date(:endDate)) "
      + "ORDER BY issued_at DESC, created_at", nativeQuery = true)
  List<OrderInfo> getBookOrdersProcessedInPeriod(@Param("startDate") LocalDate startDate,
      @Param("endDate") LocalDate endDate);

  //6.3. Разработать запрос на языке SQL с выполнением групповой операции над данными.
  @Query(value = "SELECT customer_id, COUNT(issued_at) FROM orders GROUP BY customer_id", nativeQuery = true)
  List<CustomerProcessedOrderCount> getCountCustomerProcessedOrders();
  //6.4. Разработать запрос на языке SQL с выполнением групповой операции над данными и агрегирующей функцией.
  @Query(value = "SELECT customer_id, COUNT(issued_at), sum(amount) as amount FROM orders INNER JOIN order_books ob on orders.id = ob.order_id INNER JOIN books b on b.id = ob.book_id GROUP BY customer_id", nativeQuery = true)
  List<CustomerProcessedOrderCount> getCountCustomerProcessedOrdersAmount();
  //6.5. Создать запрос с выполнением групповой операции над данными и отбором определенных групп.
  //6.6. Разработать запрос на языке SQL, результирующая таблица которого соответствовала бы по структуре записи таблице, созданной по агрегированной сущности, но объекты бы представлялись своими наименованиями, взятыми из соответствующих таблиц-справочников, с условием отбора по одному полю. Выполнить сортировку.
  //6.7. Разработать запрос на языке SQL, результирующая таблица которого, должна содержать все поля предыдущего запроса и добавить вычисляемое поле. Выполнить сортировку по нескольким полям.
  //6.8. Разработать запросы на языке SQL, выполняющий объединение нескольких таблиц.
  //6.9. Разработать запрос на языке SQL, выполняющий пересечение нескольких таблиц. Разработать запросы на языке SQL с различными видами подзапросов: с однострочными и многострочными операторами сравнения, с табличными выражениями.
  //6.10. Разработать запрос на языке SQL с самосоединением таблицы.

}
