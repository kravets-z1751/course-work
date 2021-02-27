package by.kravets.coursework.repository.payload;

import java.math.BigDecimal;

public interface CustomerProcessedOrderCount {

  Integer getCustomer_Id();

  Integer getCount();

  BigDecimal getAmount();
}
