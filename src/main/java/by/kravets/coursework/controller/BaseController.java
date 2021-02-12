package by.kravets.coursework.controller;


import by.kravets.coursework.entity.BaseEntity;
import by.kravets.coursework.service.BaseService;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

public abstract class BaseController<E extends BaseEntity,
    T extends BaseService<E, ? extends JpaRepository<E, Integer>>> {

  protected abstract String getViewPage();

  protected abstract String getListPage();

  protected abstract T getService();

  @PostMapping
  public void add(@RequestBody E entity) {
    getService().add(entity);
  }

}
