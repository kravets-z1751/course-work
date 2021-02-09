package by.kravets.coursework.controller;


import by.kravets.coursework.entity.BaseEntity;
import by.kravets.coursework.service.BaseService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

public abstract class BaseController<E extends BaseEntity,
    T extends BaseService<E, ? extends JpaRepository<E, Integer>>> {

  protected abstract T getService();

  @GetMapping("/{id}")
  public ResponseEntity<E> getOne(@PathVariable Integer id) {
    return getService().getOne(id);
  }

  @GetMapping
  public ResponseEntity<Page<E>> getList(Pageable pageable) {
    return getService().getList(pageable);
  }

  @PostMapping
  public ResponseEntity<?> add(@RequestBody E entity) {
    return getService().add(entity);
  }

}
