package com.skilldistillery.earbuds.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.earbuds.data.UserDAO;
import com.skilldistillery.earbuds.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO userdao;

	@RequestMapping(path = "signUp.do", method = RequestMethod.POST)
	public String createNewUser(@ModelAttribute("userSignUp") @Valid User newUser,
			BindingResult result, Model model, RedirectAttributes redir,
			@RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName) {

		if (result.hasErrors()) {
			model.addAttribute("user", new User());
			return "login";
		}

		User signedUp = userdao.createUser(newUser, firstName, lastName);

		if (signedUp != null) {
			redir.addFlashAttribute("wasSignUpSuccessful", true);
		}

		return "redirect:login.do";
	}

}
