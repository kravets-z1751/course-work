package by.kravets.coursework.repository.impl;

import by.kravets.coursework.entity.impl.Order;
import by.kravets.coursework.repository.BaseRepository;
import by.kravets.coursework.repository.impl.payload.CustomerProcessedOrderCount;
import java.time.LocalDate;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository extends BaseRepository<Order> {

  //6.2. Разработать запрос на языке SQL, отображающий определенные поля одной таблицы с отбором по сложному условию и сортировкой по двум полям.
  @Query(value = "SELECT * FROM orders "
      + "WHERE (date(created_at) >= date(:startDate) AND date(created_at) <= date(:endDate)) "
      + "OR (date(issued_at) >= date(:startDate) AND date(issued_at) <= date(:endDate)) "
      + "ORDER BY issued_at DESC, created_at", nativeQuery = true)
  List<Order> getBookOrdersProcessedInPeriod(@Param("startDate") LocalDate startDate,
      @Param("endDate") LocalDate endDate);

  //6.3. Разработать запрос на языке SQL с выполнением групповой операции над данными.
  @Query(value = "SELECT customer_id, COUNT(issued_at) FROM orders GROUP BY customer_id", nativeQuery = true)
  List<CustomerProcessedOrderCount> getCountCustomerProcessedOrders();
}
