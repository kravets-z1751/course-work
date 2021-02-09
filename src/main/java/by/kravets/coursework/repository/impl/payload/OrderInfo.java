package by.kravets.coursework.repository.impl.payload;

import java.time.LocalDateTime;

public interface OrderInfo {

  Integer getId();

  LocalDateTime getCreatedAt();

  String getDescription();

  LocalDateTime getIssuedAt();

  String getCustomerFullName();

  String getCustomerPhone();

  String getCustomerEmail();
}
