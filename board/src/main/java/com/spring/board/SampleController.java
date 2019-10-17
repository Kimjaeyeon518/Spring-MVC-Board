package com.spring.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping(value = "/main")
@Controller
public class SampleController {
	
	@RequestMapping(value = "")
	public String goFirst(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "main/first";
	}
	
	@RequestMapping(value = "/main")
	public String goMain(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "main/main";
	}
	
	@RequestMapping(value = "/study")
	public String goStudy(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "main/study";
	}
	
	@RequestMapping(value = "/goal")
	public String goGoal(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "main/goal";
	}
	
	@RequestMapping(value = "/profile")
	public String goProfile(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "main/profile";
	}
}
