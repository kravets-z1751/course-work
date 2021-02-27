package by.kravets.coursework.repository.payload;

import java.time.LocalDateTime;

public interface OrderInfo {

  Integer getId();

  LocalDateTime getCreated_At();

  LocalDateTime getIssued_At();

  String getDescription();

  String getCustomer_Id();

  LocalDateTime getIssuedAt();

  String getCustomerFullName();

  String getCustomerPhone();

  String getCustomerEmail();
}
