package com.company.controller.testController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test")
public class TestController {
	
	// An end point for testing spring mvc
	@RequestMapping("/test")
	public String test() {
		return "test-success";
	}

}
