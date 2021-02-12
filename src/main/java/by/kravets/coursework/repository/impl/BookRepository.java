package by.kravets.coursework.repository.impl;

import by.kravets.coursework.entity.impl.Book;
import by.kravets.coursework.entity.impl.Order;
import by.kravets.coursework.repository.BaseRepository;
import by.kravets.coursework.repository.impl.payload.BookRow;
import java.time.LocalDate;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BookRepository extends BaseRepository<Book> {

  // 6.2. Разработать запрос на языке SQL, отображающий определенные поля одной таблицы с отбором
  // по сложному условию и сортировкой по двум полям.
  @Query(value = "SELECT * FROM orders "
      + "WHERE (date(created_at) >= date(:startDate) AND date(created_at) <= date(:endDate)) "
      + "OR (date(issued_at) >= date(:startDate) AND date(issued_at) <= date(:endDate)) "
      + "ORDER BY issued_at DESC, created_at", nativeQuery = true)
  List<Order> getBookOrdersProcessedInPeriod(@Param("startDate") LocalDate startDate,
      @Param("endDate") LocalDate endDate);

  // 6.6. Разработать запрос на языке SQL, результирующая таблица которого соответствовала
  // бы по структуре записи таблице, созданной по агрегированной сущности, но объекты бы
  // представлялись своими наименованиями, взятыми из соответствующих таблиц-справочников,
  // с условием отбора по одному полю. Выполнить сортировку.
  @Query(value = "SELECT b.id as bookId, b.name as bookName, a.id as authorId, "
      + "concat(a.surname, ' ',a.name, ' ',a.patronymic) as authorFullName, c.name as countryName "
      + "FROM books b\n"
      + "    INNER JOIN authors a on a.id = b.author_id\n"
      + "    INNER JOIN countries c on c.id = a.country_id\n"
      + "WHERE CASE WHEN pg_typeof(:countryId) = pg_typeof('null'\\:\\:bytea) THEN true ELSE c.id\\:\\:INT = :countryId\\:\\:INT END "
      + "ORDER BY b.name ", nativeQuery = true)
  Page<BookRow> getBooks(@Param("countryId") Integer countryId, Pageable pageable);
}
