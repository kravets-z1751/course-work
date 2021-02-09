package by.kravets.coursework.repository.impl;

import by.kravets.coursework.entity.impl.Author;
import by.kravets.coursework.repository.BaseRepository;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface AuthorRepository extends BaseRepository<Author> {

  //6.1. Разработать запрос на языке SQL, отображающий все поля одной таблицы с отбором по одному условию и сортировкой.
  @Query(value = "SELECT * FROM authors WHERE country_id =:countryId ORDER BY country_id",
      nativeQuery = true)
  List<Author> findByCountryId(@Param("countryId") Integer countryId);
}
