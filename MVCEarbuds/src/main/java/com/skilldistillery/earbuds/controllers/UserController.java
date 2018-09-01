package com.skilldistillery.earbuds.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.earbuds.data.UserDAO;
import com.skilldistillery.earbuds.entities.User;

@Controller
public class UserController {
	@Autowired
	private UserDAO userdao;
	
	@RequestMapping(path = "signUp.do", method = RequestMethod.POST)
	public String createNewUser(User newuser, Model model) {
		User signedUp = userdao.createUser(newuser);
		model.addAttribute("userSignUp", signedUp);
		return "login";
	}


}
