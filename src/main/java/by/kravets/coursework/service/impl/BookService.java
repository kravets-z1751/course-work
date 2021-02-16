package by.kravets.coursework.service.impl;

import by.kravets.coursework.entity.impl.Book;
import by.kravets.coursework.repository.impl.BookRepository;
import by.kravets.coursework.repository.impl.payload.BookRow;
import by.kravets.coursework.service.BaseService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class BookService extends BaseService<Book, BookRepository> {

  private final BookRepository repository;

  @Override
  public String getViewPage() {
    return "book/view";
  }

  @Override
  public String getListPage() {
    return "book/list";
  }

  @Override
  protected BookRepository getRepository() {
    return repository;
  }

  public Page<BookRow> getBooks(Integer countryId, Pageable pageable) {
    return countryId == null ?
        getRepository().getBooks(pageable) :
        getRepository().getBooks(countryId, pageable);
  }
}
