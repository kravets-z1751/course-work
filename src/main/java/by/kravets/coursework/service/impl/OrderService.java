package by.kravets.coursework.service.impl;

import by.kravets.coursework.entity.impl.Order;
import by.kravets.coursework.repository.impl.OrderRepository;
import by.kravets.coursework.repository.impl.payload.CustomerProcessedOrderCount;
import by.kravets.coursework.service.BaseService;
import java.time.LocalDate;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class OrderService extends BaseService<Order, OrderRepository> {

  private final OrderRepository repository;

  @Override
  public String getViewPage() {
    return null;
  }

  @Override
  public String getListPage() {
    return null;
  }

  @Override
  protected OrderRepository getRepository() {
    return repository;
  }

  public List<Order> getBookOrdersProcessedInPeriod(LocalDate startDate, LocalDate endDate) {
    return getRepository().getBookOrdersProcessedInPeriod(startDate, endDate);
  }

  public List<CustomerProcessedOrderCount> getCountCustomerProcessedOrders() {
    return getRepository().getCountCustomerProcessedOrders();
  }
}
