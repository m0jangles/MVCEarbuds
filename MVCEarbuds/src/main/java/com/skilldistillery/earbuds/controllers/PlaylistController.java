package com.skilldistillery.earbuds.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.earbuds.data.PlaylistDAO;
import com.skilldistillery.earbuds.entities.Genre;
import com.skilldistillery.earbuds.entities.Playlist;
import com.skilldistillery.earbuds.entities.Song;

@Controller
public class PlaylistController {

	@Autowired
	private PlaylistDAO dao;

	@RequestMapping(path = "viewPlaylists.do", params = "id",
			method = RequestMethod.GET)
	public String viewPlaylists(Model model, Integer id) {
		List<Playlist> playlists = dao.getPlaylists(id);
		if (!playlists.isEmpty()) {
			model.addAttribute("playlists", playlists);
		}
		return "homepage";
	}

	@RequestMapping(path = "getSongs.do", params = "id",
			method = RequestMethod.GET)
	public String getSongs(Model model, @RequestParam("id") Integer playlistId) {

		List<Song> songs = dao.getSongs(playlistId);

		// ** NEW STUFF ** TODO
		// Get the list of genres for every song in the song list
		
		
		List<Genre> genreList = songs.get(0).getGenres();
		
		List<List<Genre>> genreListofLists = new ArrayList<>();
		for (Song song : songs) {
			genreListofLists.add(song.getGenres());
		}

		model.addAttribute("genreList", genreListofLists);
		
		// ** END NEW STUFF **

		String playlistName = dao.getPlaylistById(playlistId).getPlaylistName();
		if (songs != null) {
			model.addAttribute("songs", songs);
		}
		model.addAttribute("playlistName", playlistName);
		model.addAttribute("id", playlistId);
		return "viewPlaylists";
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
}
