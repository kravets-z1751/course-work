package by.kravets.coursework.entity.impl;

import by.kravets.coursework.entity.BaseEntity;
import java.time.LocalDate;
import java.util.Set;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@EqualsAndHashCode(callSuper = true)
@Data
@Entity
@Table(name = "books")
@NoArgsConstructor
@AllArgsConstructor
@SequenceGenerator(name = "course_work_sequence", sequenceName = "book_seq", allocationSize = 1)
public class Book extends BaseEntity {

  private String name;
  private String definition;
  private LocalDate date;

  @ManyToOne
  @JoinColumn(name = "author_id")
  private Author author;
}
