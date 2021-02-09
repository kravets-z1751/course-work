package by.kravets.coursework.service.impl;

import by.kravets.coursework.entity.impl.Book;
import by.kravets.coursework.repository.impl.BookRepository;
import by.kravets.coursework.service.BaseService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class BookService extends BaseService<Book, BookRepository> {

  private final BookRepository repository;

  @Override
  protected BookRepository getRepository() {
    return repository;
  }
}
