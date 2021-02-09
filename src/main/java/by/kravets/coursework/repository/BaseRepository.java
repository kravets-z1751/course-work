package by.kravets.coursework.repository;

import by.kravets.coursework.entity.BaseEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BaseRepository<E extends BaseEntity> extends JpaRepository<E, Integer> {

}
