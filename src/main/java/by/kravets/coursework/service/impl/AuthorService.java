package by.kravets.coursework.service.impl;

import by.kravets.coursework.entity.impl.Author;
import by.kravets.coursework.entity.impl.Book;
import by.kravets.coursework.repository.impl.AuthorRepository;
import by.kravets.coursework.service.BaseService;
import java.util.Set;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

@Service
@RequiredArgsConstructor
public class AuthorService extends BaseService<Author, AuthorRepository> {

  private final AuthorRepository repository;

  @Override
  public String getViewPage() {
    return "author/view";
  }

  @Override
  public String getListPage() {
    return "author/list";
  }

  @Override
  protected AuthorRepository getRepository() {
    return repository;
  }

  public Page<Author> getAuthors(Integer countryId, Pageable pageable) {
    return countryId == null ?
        getRepository().getAuthors(pageable) :
        getRepository().getAuthors(countryId, pageable);
  }

  @Transactional(propagation = Propagation.MANDATORY)
  public String getAuthorDetails(Integer id, Model model) {
    Author author = repository.getOne(id);
//    Hibernate.initialize(author.getBooks());
    Set<Book> books = author.getBooks();
    model.addAttribute("author", author);
    model.addAttribute("books", books);
    return getViewPage();
  }

}
