package com.recreadejuerga.recrea;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Contact;
import io.swagger.v3.oas.annotations.info.Info;
import io.swagger.v3.oas.annotations.info.License;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@OpenAPIDefinition(
		info= @Info(
				description = "Una API REST sobre mi equipo (Recrea de Juerga)",
				version = "1.0",
				contact = @Contact(
						email = "jorgemodric@gmail.com",
						name = "Jorge González Pérez"
				),
				license = @License(name = "All Rights Reserved"),
				title = "Una API sobre Recrea de Juerga"
		)
)
@SpringBootApplication
public class RecreaApplication {

	public static void main(String[] args) {
		SpringApplication.run(RecreaApplication.class, args);
	}

}
