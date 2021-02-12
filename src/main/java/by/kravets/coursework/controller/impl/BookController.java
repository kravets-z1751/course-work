package by.kravets.coursework.controller.impl;

import by.kravets.coursework.controller.BaseController;
import by.kravets.coursework.entity.impl.Author;
import by.kravets.coursework.entity.impl.Book;
import by.kravets.coursework.service.impl.BookService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/book")
@RequiredArgsConstructor
public class BookController extends BaseController<Book, BookService> {

  private final BookService service;

  @Override
  protected String getViewPage() {
    return "book/view";
  }

  @Override
  protected String getListPage() {
    return "book/list";
  }

  @Override
  protected BookService getService() {
    return service;
  }

  @GetMapping
  public String getList(@RequestParam(required = false) Integer countryId, Pageable pageable, Model model) {
    if (countryId == null) countryId = 1;
    model.addAttribute("page", getService().getBooks(countryId, pageable));
    return getListPage();
  }

  @GetMapping("/{id}")
  public String getOne(@PathVariable Integer id, Model model) {
    Book book = getService().getOne(id);
    Author author = book.getAuthor();
    model.addAttribute("book", book);
    model.addAttribute("author", author);
    return getViewPage();
  }

}
