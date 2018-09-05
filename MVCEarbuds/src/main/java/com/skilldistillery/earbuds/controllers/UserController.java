package com.skilldistillery.earbuds.controllers;

import java.util.List;

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
	public String createNewUser(@ModelAttribute("userSignUp") @Valid User newUser, BindingResult result, Model model,
			RedirectAttributes redir, @RequestParam("firstName") String firstName,
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

	@RequestMapping(path = "addFriend.do", method = RequestMethod.POST)
	public String userAddFriend(Model model, User userInSession, Integer friendId) {
		boolean friendAdded = userdao.addNewFriend(userInSession, friendId);
		if (friendAdded = true) {
			model.addAttribute("friendAdded", friendAdded);
		}
		return "homepage";
	}
	@RequestMapping(path = "removeFriend.do", method = RequestMethod.POST)
	public String userRemoveFriend(Model model, User userInSession, Integer friendId) {
		boolean notMyFriend = userdao.deleteFriend(userInSession, friendId);
		if (notMyFriend = true) {
			model.addAttribute("friendRemoved", notMyFriend);
		}
		return "homepage";
	}
	@RequestMapping(path = "viewMyFriends.do", method = RequestMethod.GET)
	public String showUserFriendsList(Model model, User user) {
		// If getting lazy load error, add fetch to User class
		List<User> myFriends = userdao.getFriendsList(user);
		if(myFriends != null) {
			model.addAttribute("myFriends", myFriends);
		}
		return "homepage";
	}

}
