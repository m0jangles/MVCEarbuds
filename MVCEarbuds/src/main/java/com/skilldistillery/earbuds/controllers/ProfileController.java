package com.skilldistillery.earbuds.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.earbuds.data.AuthenticationDAO;
import com.skilldistillery.earbuds.data.ProfileDAO;
import com.skilldistillery.earbuds.data.UserDAO;
import com.skilldistillery.earbuds.entities.Post;
import com.skilldistillery.earbuds.entities.Profile;
import com.skilldistillery.earbuds.entities.User;

@Controller
public class ProfileController {

	@Autowired
	private ProfileDAO dao;

	@Autowired
	private AuthenticationDAO authDao;
	
	@Autowired
	private UserDAO userdao;

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
			@RequestParam("locationCountry") String country, HttpSession session) {

		ModelAndView mv = new ModelAndView();

		// In case we want to do something with the updated profile later
		Profile updatedProfile = dao.updateInfo(profile, id, city, state, country);

		User loggedInUser = (User) session.getAttribute("UserInSession");
		session.setAttribute("UserInSession",
				authDao.findUserById(loggedInUser.getId()));

		mv.setViewName("profile");

		return mv;
	}
	
	@RequestMapping(path = "createPost.do", method = RequestMethod.POST)
	public ModelAndView createPost(Integer id,
			@RequestParam("message") String message) {
		Post newPost = dao.addPost(id, message);
		ModelAndView mv = new ModelAndView();
		mv.addObject("user", id);
		mv.addObject("newPost", newPost);
		mv.setViewName("redirect:homepage.do");
		return mv;
	}
	
	 
	@RequestMapping(path = "deletePost.do", method = RequestMethod.POST)
	public String deletePost(Model model, HttpSession session, 
			@RequestParam("postId") Integer postId) {
		User user = (User)session.getAttribute("UserInSession");
		boolean postDeleted = dao.deletePost(user, postId);
		if(postDeleted = true) {
		model.addAttribute("postDeleted", postDeleted);
		}
		return "redirect:homepage.do";	
	}
	
	@RequestMapping(path = "friendProfile.do", method = RequestMethod.GET)
	public String viewAnotherUserProfile(Model model, Integer friendID) {
		User friend = authDao.findUserById(friendID);
		model.addAttribute("otherUser", friend);
		return "friendProfile";
	}

}
