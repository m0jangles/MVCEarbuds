package com.skilldistillery.earbuds.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.earbuds.data.SongDAO;

@Controller
public class SongController {
	@Autowired
	private SongDAO dao;
	
	@RequestMapping(path = "addSong.do", method = RequestMethod.POST)
	public ModelAndView addSongToPlaylist(Integer playlistId,  
			@RequestParam("title")String title, 
			@RequestParam("album")String album, 
			@RequestParam("albumImage")String albumImage, 
			@RequestParam("url")String url, 
			@RequestParam("artist")String artist ) {
		dao.addSongToPlaylist(playlistId, title, album, albumImage, url, artist);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("homepage");
		
		return mv;
	}
	
	

}
