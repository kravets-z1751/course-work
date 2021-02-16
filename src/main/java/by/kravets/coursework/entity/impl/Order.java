package by.kravets.coursework.entity.impl;

import by.kravets.coursework.entity.BaseEntity;
import java.time.LocalDateTime;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
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
@Table(name = "orders")
@NoArgsConstructor
@AllArgsConstructor
@SequenceGenerator(name = "course_work_sequence", sequenceName = "order_seq", allocationSize = 1)
public class Order extends BaseEntity {

  private String description;
  private LocalDateTime createdAt;
  private LocalDateTime issuedAt;

  @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
  private Customer customer;

  @ManyToMany(fetch = FetchType.LAZY)
  @JoinTable(name = "order_books",
      joinColumns = @JoinColumn(
          name = "order_id",
          referencedColumnName = "id"
      ),
      inverseJoinColumns = @JoinColumn(
          name = "book_id",
          referencedColumnName = "id"
      ))
  private List<Book> books;
}
