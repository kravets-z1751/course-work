package by.kravets.coursework.controller.impl;

import by.kravets.coursework.controller.BaseController;
import by.kravets.coursework.entity.impl.Book;
import by.kravets.coursework.service.impl.BookService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/book")
@RequiredArgsConstructor
public class BookController extends BaseController<Book, BookService> {

  private final BookService service;

  @Override
  protected BookService getService() {
    return service;
  }

}
