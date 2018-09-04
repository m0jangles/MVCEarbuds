package com.skilldistillery.earbuds.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.earbuds.data.SongDAO;
import com.skilldistillery.earbuds.entities.Song;

@Controller
public class SongController {
	@Autowired
	private SongDAO dao;

	@RequestMapping(path = "addSong.do", method = RequestMethod.POST)
	public ModelAndView addSongToPlaylist(Integer playlistId, @RequestParam("title") String title,
			@RequestParam("album") String album, @RequestParam("albumImage") String albumImage,
			@RequestParam("url") String url, @RequestParam("artist") String artist) {

		dao.addSongToPlaylist(playlistId, title, album, albumImage, url, artist);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("homepage");

		return mv;
	}

	// *** Corresponds to action on viewPlaylists.jsp ***
	@RequestMapping(path = "displayAddSongForm.do", method = RequestMethod.GET)
	public ModelAndView getAddSongForm(Model model, RedirectAttributes redir, @RequestParam("id") Integer id) {

		ModelAndView mv = new ModelAndView();
		redir.addFlashAttribute("addFormButtonClicked", true);
		mv.setViewName("redirect:getSongs.do?id=" + id);

		return mv;
	}

	@RequestMapping(path = "deleteSong.do", method = RequestMethod.POST)
	public ModelAndView removeSongFromPlaylist(Integer id, Song song) {
		ModelAndView mv = new ModelAndView();

		boolean result = dao.removeSong(id, song);
		mv.addObject("songDeleted", result);
		mv.setViewName("redirect:getSongs.do?id="+id);
		
		return mv;
	}
}
