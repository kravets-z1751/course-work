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

    model.addAttribute("orders", service.getOrders());
    model.addAttribute("ordersDiff", service.getOrdersDiff());
    model.addAttribute("countOrders", service.getCountOrders());
    model.addAttribute("countOrdersAmount", service.getCountOrdersAmount());
    return "list";
  }

}
