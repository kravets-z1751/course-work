package by.kravets.coursework.repository.payload;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

public interface Result {

  Integer getId();

  String getName();

  LocalDateTime getCreated_At();

  LocalDateTime getIssued_At();

  String getDescription();

  String getCustomer_Id();

  LocalDateTime getIssuedAt();

  String getCustomerFullName();

  String getCustomerPhone();

  String getCustomerEmail();

  Integer getCount();

  BigDecimal getAmount();

  String getProcess_Time();

  String getBook_Author();

  String getCustomer();

  LocalDate getDate_Of_Birth();

  String getPatronymic();

  String getSurname();

  Integer getCountry_Id();
}
