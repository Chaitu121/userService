package com.chaitanya.userService.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class cchai {
	
	@GetMapping("/hello")
	public String gh() {
		return "hello chai";
	}

}
