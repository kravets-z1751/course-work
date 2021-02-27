package by.kravets.coursework.service;

import by.kravets.coursework.repository.MainRepository;
import by.kravets.coursework.repository.payload.Result;
import java.time.LocalDate;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MainService {

  private final MainRepository repository;

  public List<Result> get61() {
    return repository.get61();
  }

  public List<Result> get62() {
    return repository.get62(
        LocalDate.of(2021, 02, 25),
        LocalDate.of(2021, 02, 28));
  }

  public List<Result> get63() {
    return repository.get63();
  }

  public List<Result> get64() {
    return repository.get64();
  }

  public List<Result> get65() {
    return repository.get65();
  }

  public List<Result> get66() {
    return repository.get66();
  }

  public List<Result> get69() {
    return repository.get69();
  }

  public List<Result> get610() {
    return repository.get610();
  }
}
