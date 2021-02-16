package by.kravets.coursework.service.impl;

import by.kravets.coursework.entity.impl.Country;
import by.kravets.coursework.repository.impl.CountryRepository;
import by.kravets.coursework.service.BaseService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CountryService extends BaseService<Country, CountryRepository> {

  private final CountryRepository repository;

  @Override
  public String getViewPage() {
    return null;
  }

  @Override
  public String getListPage() {
    return null;
  }

  @Override
  protected CountryRepository getRepository() {
    return repository;
  }
}
