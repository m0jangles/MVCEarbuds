package com.skilldistillery.earbuds.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.earbuds.data.ProfileDAO;

@Controller
public class ProfileController {
	@Autowired
	private ProfileDAO dao;
	
	@RequestMapping(path = "profile.do", method = RequestMethod.GET)
	public String showProfilePage() {
		return "profile";
	}
}
