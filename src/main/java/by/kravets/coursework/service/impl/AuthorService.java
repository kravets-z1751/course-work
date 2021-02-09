package by.kravets.coursework.service.impl;

import by.kravets.coursework.entity.impl.Author;
import by.kravets.coursework.repository.impl.AuthorRepository;
import by.kravets.coursework.service.BaseService;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AuthorService extends BaseService<Author, AuthorRepository> {

  private final AuthorRepository repository;

  @Override
  protected AuthorRepository getRepository() {
    return repository;
  }

  public List<Author> getCountryAuthors(Integer countryId) {
    return getRepository().findByCountryId(countryId);
  }

}
