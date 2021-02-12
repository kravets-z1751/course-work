package by.kravets.coursework.controller.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
@RequiredArgsConstructor
public class MainController {

  public static final String MAIN_PAGE = "main/main";

  @GetMapping
  public String mainPage() {
    return MAIN_PAGE;
  }

}
