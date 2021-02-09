package by.kravets.coursework.service;

import by.kravets.coursework.entity.BaseEntity;
import by.kravets.coursework.repository.BaseRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;

public abstract class BaseService<E extends BaseEntity, T extends BaseRepository<E>> {

  protected abstract T getRepository();

  public ResponseEntity<E> getOne(Integer authorId) {
    return getRepository()
        .findById(authorId)
        .map(ResponseEntity::ok)
        .orElseGet(() -> ResponseEntity.notFound().build());
  }

  public ResponseEntity<Page<E>> getList(Pageable pageable) {
    return ResponseEntity.ok(getRepository().findAll(pageable));
  }

  public ResponseEntity<?> add(E entity) {
    return ResponseEntity.ok(getRepository().save(entity));
  }
}
