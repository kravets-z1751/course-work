package by.kravets.coursework.controller.impl;

import by.kravets.coursework.controller.BaseController;
import by.kravets.coursework.entity.impl.Author;
import by.kravets.coursework.service.impl.AuthorService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/author")
@RequiredArgsConstructor
public class AuthorController extends BaseController<Author, AuthorService> {

  private final AuthorService service;

  @Override
  protected String getViewPage() {
    return "author/view";
  }

  @Override
  protected String getListPage() {
    return "author/list";
  }

  @Override
  protected AuthorService getService() {
    return service;
  }

}
