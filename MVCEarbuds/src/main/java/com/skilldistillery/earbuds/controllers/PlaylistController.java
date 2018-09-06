package com.skilldistillery.earbuds.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.earbuds.data.GenreDAO;
import com.skilldistillery.earbuds.data.PlaylistDAO;
import com.skilldistillery.earbuds.entities.Genre;
import com.skilldistillery.earbuds.entities.Playlist;
import com.skilldistillery.earbuds.entities.Song;
import com.skilldistillery.earbuds.entities.User;

@Controller
public class PlaylistController {

	@Autowired
	private PlaylistDAO dao;
	@Autowired
	private GenreDAO gdao;
	
	public static final String USER_IN_SESSION_KEY = "UserInSession";

	@RequestMapping(path = "viewPlaylists.do", params = "id",
			method = RequestMethod.GET)
	public String viewPlaylists(Model model, Integer id) {
		List<Playlist> playlists = dao.getPlaylists(id);
		if (!playlists.isEmpty()) {
			model.addAttribute("playlists", playlists);
		}
		return "profile";
	}

	@RequestMapping(path = "getSongs.do", params = "id",
			method = RequestMethod.GET)
	public String getSongs(Model model, @RequestParam("id") Integer playlistId) {

		// Get a list of songs for a particular playlist ID
		List<Song> songs = dao.getSongs(playlistId);

		// This line calls the gdao's impl method to retrieve the entire genre list
		// from the database. This is so that we can use the genre list in a
		// <c:foreach> loop on the jsp page for a dropdown selection of all genres.
		List<Genre> genres = gdao.getEntireGenreList();

		String playlistName = dao.getPlaylistById(playlistId).getPlaylistName();
		if (songs != null) {
			model.addAttribute("songs", songs);
		}

		// This is to be able to display the playlist's title on the
		// viewPlaylists.jsp page
		model.addAttribute("playlistName", playlistName);

		// This line is so that we can reference the playlist in the
		// viewPlaylists.jsp page
		model.addAttribute("id", playlistId);

		model.addAttribute("genres", genres);
		return "viewPlaylist";
	}

	@RequestMapping(path = "showVideo.do", method = RequestMethod.GET)
	public String showVideo() {

		return "homepage";

	}

	@RequestMapping(path = "newPlaylist.do", method = RequestMethod.POST)
	public ModelAndView createNewPlaylist(RedirectAttributes redir, String name,
			@RequestParam("playlistProfileId") Integer playlistProfileId) {
		ModelAndView mv = new ModelAndView();
		if (!name.isEmpty()) {
			Playlist newPlaylist = dao.createPlaylist(playlistProfileId, name);
			if (newPlaylist != null) {
				redir.addFlashAttribute("newPlaylist", newPlaylist);
				mv.setViewName("redirect:homepage.do");
			}
			return mv;
		} else {
			mv.setViewName("homepage");
			return mv;
		}
	}

	@RequestMapping(path = "removePlaylist.do", method = RequestMethod.POST)
	public ModelAndView deletePlaylist(Integer playlistId) {
		ModelAndView mv = new ModelAndView();
		Boolean deletedPlaylist = dao.removePlaylist(playlistId);
		mv.addObject("deletedPlaylist", deletedPlaylist); // To be able to display a
																											// message when the
																											// playlist is deleted
		mv.setViewName("homepage");
		return mv;
	}
	@RequestMapping(path = "getThisProfileSongs.do", params = "id",
			method = RequestMethod.GET)
	public String getPublicSongs(Model model, @RequestParam("id") Integer playlistId, HttpSession session) {
		User me = (User)session.getAttribute(USER_IN_SESSION_KEY);
		Integer userID = me.getId();
		List<Song> songs = dao.getSongs(playlistId);
		List<Genre> genres = gdao.getEntireGenreList();
		List<Playlist> myPlaylists = dao.getPlaylistsByUserID(userID);
		String playlistName = dao.getPlaylistById(playlistId).getPlaylistName();
		if (songs != null) {
			model.addAttribute("songs", songs);
		}
		model.addAttribute("myPlaylists", myPlaylists);
		model.addAttribute("playlistName", playlistName);
		model.addAttribute("id", playlistId);
		model.addAttribute("genres", genres);
		return "profilePlaylist";
	}
}
