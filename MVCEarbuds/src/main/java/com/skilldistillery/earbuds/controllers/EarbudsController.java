package com.skilldistillery.earbuds.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.earbuds.data.EarbudsDAO;
import com.skilldistillery.earbuds.data.PlaylistDAO;
import com.skilldistillery.earbuds.entities.Playlist;
import com.skilldistillery.earbuds.entities.Profile;
import com.skilldistillery.earbuds.entities.Song;
import com.skilldistillery.earbuds.entities.User;

@Controller
public class EarbudsController {
	@Autowired
	private EarbudsDAO dao;

	@Autowired
	private PlaylistDAO playlistDao;

	@RequestMapping(path = "about.do", method = RequestMethod.GET)
	public String viewAboutPage() {
		return "about";
	}

	@RequestMapping(path = "findUsers.do", method = RequestMethod.GET)
	public String viewUserResults(String searchUserInput, Model model) {
		List<Profile> profiles = dao.searchForUsers(searchUserInput);
		model.addAttribute("profiles", profiles);
		return "results";
	}

	@RequestMapping(path = "findSongs.do", method = RequestMethod.GET)
	public String viewSongResults(String searchSongInput, Model model,
			HttpSession session) {

		User currentUser = (User) session.getAttribute("UserInSession");

		List<Playlist> profilePlaylists = playlistDao
				.getPlaylists(currentUser.getProfile().getId());

		List<Song> songs = dao.searchForSongs(searchSongInput);

		model.addAttribute("songs", songs);
		model.addAttribute("playlists", profilePlaylists);

		return "results";
	}

}
