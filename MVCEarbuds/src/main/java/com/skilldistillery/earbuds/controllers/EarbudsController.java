package com.skilldistillery.earbuds.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.earbuds.data.EarbudsDAO;

//@Controller
public class EarbudsController {
//	@Autowired
//	private EarbudsDAO earbudsdao;
	
	@RequestMapping(path = "about.do", method = RequestMethod.GET)
	public String viewAboutPage() {
		return "about";
	}
	
}
