package com.skilldistillery.earbuds.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.earbuds.data.AuthenticationDAO;
import com.skilldistillery.earbuds.entities.User;

@Controller
public class AuthenticationController {
	
	@Autowired
	private AuthenticationDAO dao;

	public static final String USER_IN_SESSION_KEY = "UserInSession";

	// Login a user
	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public ModelAndView loginUser(User inputUser, Errors errors,
			HttpSession session) {

		ModelAndView mv = new ModelAndView();

		User daoUser = dao.getUserByUserNameAndPassword(inputUser.getUsername(),
				inputUser.getPassword());

		if (daoUser == null) {
			mv.setViewName("login");
			errors.rejectValue("username", "error.username", "Invalid credentials");
			errors.rejectValue("password", "error.password", "Invalid credentials");
			// We have to provide the modelAttribute("userSignUp") from the login.jsp
			// the object it needs in order for the login page to display
			mv.addObject("userSignUp", new User());
		} else {
			// load the User object into session, and redirect to their feed,
			// homepage.do
			session.setAttribute(USER_IN_SESSION_KEY, daoUser);
			mv.setViewName("redirect:homepage.do");
		}

		return mv;
	}

	@RequestMapping(path = "login.do", method = RequestMethod.GET)
	public String login(Model model, HttpSession session) {

		model.addAttribute("user", new User());
		model.addAttribute("userSignUp", new User());

		// If a user is logged in and requests login.do, they should be redirected
		// to their feed (homepage.do)
		User userInSession = (User) session.getAttribute(USER_IN_SESSION_KEY);

		if (userInSession != null) {
			return "redirect:homepage.do";
		}

		return "login";
	}

	// Homepage display
	@RequestMapping(path = "homepage.do", method = RequestMethod.GET)
	public String showHomepage() {
		return "homepage";
	}

	// Logout
	@RequestMapping(path = "logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute(USER_IN_SESSION_KEY);
		return "redirect:login.do";
	}
}
