package by.kravets.coursework.repository.impl;

import by.kravets.coursework.entity.impl.Author;
import by.kravets.coursework.repository.BaseRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface AuthorRepository extends BaseRepository<Author> {

  //6.1. Разработать запрос на языке SQL, отображающий все поля одной таблицы с отбором
  // по одному условию и сортировкой.
  @Query(value = "SELECT * FROM authors WHERE country_id =:countryId ORDER BY surname, name, patronymic",
      nativeQuery = true)
  Page<Author> getAuthors(@Param("countryId") Integer countryId, Pageable pageable);

  @Query(value = "SELECT * FROM authors ORDER BY surname, name, patronymic", nativeQuery = true)
  Page<Author> getAuthors(Pageable pageable);
}
