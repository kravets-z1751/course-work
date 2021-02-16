package by.kravets.coursework.controller.impl;

import by.kravets.coursework.controller.BaseController;
import by.kravets.coursework.entity.impl.Author;
import by.kravets.coursework.service.impl.AuthorService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/author")
@RequiredArgsConstructor
public class AuthorController extends BaseController<Author, AuthorService> {

  private final AuthorService service;

  @Override
  protected AuthorService getService() {
    return service;
  }

  @GetMapping
  public String getList(@RequestParam(required = false) Integer countryId,
      Pageable pageable, Model model) {
    model.addAttribute("page", getService().getAuthors(countryId, pageable));
    return getService().getListPage();
  }

  @GetMapping("/{id}")
  @Transactional(propagation = Propagation.REQUIRES_NEW)
  public String getOne(@PathVariable Integer id, Model model) {
    return getService().getAuthorDetails(id, model);
  }


}
