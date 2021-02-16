package by.kravets.coursework.entity.impl;

import by.kravets.coursework.entity.BaseEntity;
import java.time.LocalDate;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "authors")
@NoArgsConstructor
@AllArgsConstructor
@SequenceGenerator(name = "course_work_sequence", sequenceName = "author_seq", allocationSize = 1)
public class Author extends BaseEntity {

  private String surname;
  private String name;
  private String patronymic;
  private LocalDate dateOfBirth;

  @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
  private Country country;

  @OneToMany(mappedBy = "author", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
  private Set<Book> books;

}
