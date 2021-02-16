package by.kravets.coursework.entity.impl;

import by.kravets.coursework.entity.BaseEntity;
import java.time.LocalDate;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "customers")
@NoArgsConstructor
@AllArgsConstructor
@SequenceGenerator(name = "course_work_sequence", sequenceName = "customer_seq", allocationSize = 1)
public class Customer extends BaseEntity {

  private String surname;
  private String name;
  private String patronymic;
  private LocalDate dateOfBirth;
  private String phone;
  private String email;

  @OneToMany(mappedBy = "customer", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
  private Set<Order> orders;

}
