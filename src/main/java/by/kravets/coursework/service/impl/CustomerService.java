package by.kravets.coursework.service.impl;

import by.kravets.coursework.entity.impl.Customer;
import by.kravets.coursework.repository.impl.CustomerRepository;
import by.kravets.coursework.service.BaseService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CustomerService extends BaseService<Customer, CustomerRepository> {

  private final CustomerRepository repository;

  @Override
  protected CustomerRepository getRepository() {
    return repository;
  }
}
