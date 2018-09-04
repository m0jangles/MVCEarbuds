package com.skilldistillery.earbuds.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.earbuds.data.ProfileDAO;
import com.skilldistillery.earbuds.entities.Profile;
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

	@RequestMapping(path = "updateProfile.do", method = RequestMethod.POST)
	public ModelAndView updateSettings(Profile profile,
			@RequestParam("updateID") int id,
			@RequestParam("locationCity") String city,
			@RequestParam("locationState") String state,
			@RequestParam("locationCountry") String country) {

		ModelAndView mv = new ModelAndView();

		// In case we want to do something with the updated profile later
		Profile updatedProfile = dao.updateInfo(profile, id, city, state, country);

		mv.setViewName("profile");

		return mv;
	}

}
