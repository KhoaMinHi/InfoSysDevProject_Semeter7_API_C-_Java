package Map.controller;

import org.springframework.boot.SpringApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/")
public class Debug {
	public static void main(String[] args) {
		SpringApplication.run(Debug.class, args);
	}
	
	public String Hello() {
		String message = "khoaminhi";
		return message;
	}
}
