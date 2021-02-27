package by.kravets.coursework.controller;

import by.kravets.coursework.service.MainService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
@RequiredArgsConstructor
public class MainController {

  public final MainService service;

  @GetMapping
  public String get(Model model) {

    model.addAttribute("result61", service.get61());
    model.addAttribute("result62", service.get62());
    model.addAttribute("result63", service.get63());
    model.addAttribute("result64", service.get64());
    model.addAttribute("result65", service.get65());
    model.addAttribute("result66", service.get66());
    model.addAttribute("result69", service.get69());
    model.addAttribute("result610", service.get610());
    return "list";
  }

}
