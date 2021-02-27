package by.kravets.coursework.service;

import by.kravets.coursework.repository.MainRepository;
import by.kravets.coursework.repository.payload.CustomerProcessedOrderCount;
import by.kravets.coursework.repository.payload.OrderInfo;
import java.time.LocalDate;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MainService {

  private final MainRepository repository;

  public List<OrderInfo> getOrders() {
    return repository.getOrders();
  }

  public List<OrderInfo> getOrdersDiff() {
    return repository.getBookOrdersProcessedInPeriod(
        LocalDate.of(2021, 02, 25),
        LocalDate.of(2021, 02, 28));
  }

  public List<CustomerProcessedOrderCount> getCountOrders() {
    return repository.getCountCustomerProcessedOrders();
  }

  public List<CustomerProcessedOrderCount> getCountOrdersAmount() {
    return repository.getCountCustomerProcessedOrdersAmount();
  }
}
