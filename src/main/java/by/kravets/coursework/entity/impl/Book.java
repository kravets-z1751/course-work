package by.kravets.coursework.entity.impl;

import by.kravets.coursework.entity.BaseEntity;
import java.math.BigDecimal;
import java.time.LocalDate;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "books")
@NoArgsConstructor
@AllArgsConstructor
@SequenceGenerator(name = "course_work_sequence", sequenceName = "book_seq", allocationSize = 1)
public class Book extends BaseEntity {

  private String name;
  private String definition;
  private LocalDate date;

  @ManyToOne(fetch = FetchType.LAZY)
  private Author author;

  private BigDecimal amount;
}
