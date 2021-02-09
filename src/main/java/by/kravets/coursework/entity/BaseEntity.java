package by.kravets.coursework.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import lombok.Data;

@Data
@MappedSuperclass
public class BaseEntity implements Serializable {

  @JsonIgnore
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO, generator = "course_work_sequence")
  private Integer id;

}
