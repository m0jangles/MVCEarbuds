package com.skilldistillery.earbuds.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.earbuds.data.ProfileDAO;
import com.skilldistillery.earbuds.entities.User;

@Controller
public class ProfileController {
	@Autowired
	private ProfileDAO dao;
	
	@RequestMapping(path = "profile.do", method = RequestMethod.GET)
	public String showProfilePage() {
		return "profile";
	}
	
	@RequestMapping(path = "settings.do", method = RequestMethod.GET)
	public String profileSettings() {
		return "settings";
	}
	
	@RequestMapping(path = "updateProfile.do", params = "user", method = RequestMethod.POST)
	public ModelAndView updateSettings(User user) {
		ModelAndView mv = new ModelAndView();
		Boolean infoUpdated = dao.updateInfo(user);
		mv.addObject("infoUpdated", infoUpdated);
		mv.setViewName("profile");
		return mv;
	}
}
