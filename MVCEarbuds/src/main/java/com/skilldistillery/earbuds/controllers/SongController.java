package com.skilldistillery.earbuds.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.earbuds.data.SongDAO;
import com.skilldistillery.earbuds.entities.PostDTO;
import com.skilldistillery.earbuds.entities.Song;
import com.skilldistillery.earbuds.entities.User;

@Controller
public class SongController {
	@Autowired
	private SongDAO dao;

	@RequestMapping(path = "addSong.do", method = RequestMethod.POST)
	public ModelAndView addSongToPlaylist(Integer playlistId, Song song,
			@RequestParam("genre") String genre) {

		ModelAndView mv = new ModelAndView();
		dao.addSongToPlaylist(song, playlistId, genre);
		mv.setViewName("redirect:getSongs.do?id=" + playlistId);

		return mv;
	}

	// *** Corresponds to action on viewPlaylists.jsp ***
	@RequestMapping(path = "displayAddSongForm.do", method = RequestMethod.GET)
	public ModelAndView getAddSongForm(Model model, RedirectAttributes redir,
			@RequestParam("id") Integer id) {

		ModelAndView mv = new ModelAndView();
		redir.addFlashAttribute("addFormButtonClicked", true);
		mv.setViewName("redirect:getSongs.do?id=" + id);

		return mv;
	}

	@RequestMapping(path = "deleteSong.do", method = RequestMethod.POST)
	public ModelAndView removeSongFromPlaylist(Integer playlistId,
			Integer songId) {

		ModelAndView mv = new ModelAndView();
		boolean result = dao.removeSong(playlistId, songId);
		mv.addObject("songDeleted", result);
		mv.setViewName("redirect:getSongs.do?id=" + playlistId);

		return mv;
	}

	// This method adds the song from the search page to the playlist selected
	// from the drop-down menu on the same page via the add to playlist button
	@RequestMapping(path = "addSongFromSearchPage.do",
			method = RequestMethod.POST)
	public ModelAndView addSongToPlaylistFromSearchPage(
			@RequestParam(name = "playlist", required = false) Integer playlistID,
			@RequestParam("songId") int songID,
			@RequestParam("searchSongInput") String searchSongInput,
			RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		if (playlistID == null) {
			mv.setViewName(
					"redirect:findSongs.do?searchSongInput=" + searchSongInput);
			return mv;
		}

		boolean result = dao.addSongToPlaylistFromSearchPage(playlistID, songID);
		redir.addFlashAttribute("wasAdditionSuccessful", result);
		redir.addFlashAttribute("songSuccessfulID", songID);

		mv.setViewName("redirect:findSongs.do?searchSongInput=" + searchSongInput);

		return mv;
	}

	@RequestMapping(path = "postSong.do", method = RequestMethod.POST)
	public ModelAndView addSongtoPost(PostDTO postDTO, HttpSession session) {

		ModelAndView mv = new ModelAndView();
		User currentUser = (User) session.getAttribute("UserInSession");
		Integer profileID = currentUser.getProfile().getId();

		dao.addSongtoPost(postDTO, profileID);
		mv.setViewName("redirect:homepage.do");

		return mv;
	}

	@RequestMapping(path = "addSongFromFriendPlaylist.do",
			method = RequestMethod.POST)
	public ModelAndView addSongToPlaylistFromProfilePlaylist(
			@RequestParam(name = "playlist", required = false) Integer playlistID,
			@RequestParam("songId") int songID,
			@RequestParam("friendPlaylistID") Integer friendPlaylistID,
			RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		if (playlistID == null) {
			mv.setViewName("redirect:getThisProfileSongs.do?id=" + friendPlaylistID);
			return mv;
		}

		boolean result = dao.addSongToPlaylistFromSearchPage(playlistID, songID);
		redir.addFlashAttribute("wasAdditionSuccessful", result);
		redir.addFlashAttribute("songSuccessfulID", songID);

		mv.setViewName("redirect:getThisProfileSongs.do?id=" + friendPlaylistID);

		return mv;
	}
}
