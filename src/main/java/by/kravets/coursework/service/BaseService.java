package by.kravets.coursework.service;

import by.kravets.coursework.entity.BaseEntity;
import by.kravets.coursework.repository.BaseRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public abstract class BaseService<E extends BaseEntity, T extends BaseRepository<E>> {

  protected abstract T getRepository();

  public E getOne(Integer authorId) {
    return getRepository()
        .findById(authorId)
        .orElseThrow();
  }

  public Page<E> getList(Pageable pageable) {
    return getRepository().findAll(pageable);
  }

  public void add(E entity) {
    getRepository().save(entity);
  }
}
