package com.skilldistillery.earbuds.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.earbuds.data.SongDAO;
import com.skilldistillery.earbuds.entities.Song;

@Controller
public class SongController {
	@Autowired
	private SongDAO dao;
	
//	@RequestMapping(path = "addSong.do", method = RequestMethod.POST)
//	Public ModelAndView addSongToPlaylist(Integer id,  Song song, 
//			@RequestParam("title")String title, 
//			@RequestParam("album")String album, 
//			@RequestParam("albumImage")String albumImage, 
//			@RequestParam("url")String url, 
//			@RequestParam("artist")String artist ) {
//		Song song = dao.addSongToPlaylist(song);
//		
//		return "homepage";
//	}
	
	

}
