package com.acorn.project.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acorn.project.DTO.TileMap;
import com.acorn.project.service.GameService;
import com.acorn.project.service.MapService;

@Controller
public class GameController {
	@Autowired
	MapService mapService;
	
	@Autowired
	GameService gameService;
	
	
	@GetMapping("map2") //추후 session에 저장된 아이디로 교체
	public void goMap2(HttpServletRequest request) {
		request.setAttribute("tileMap", new TileMap[]{mapService.getTileMap1(),mapService.getTileMap2()});		
	}
	
	@PostMapping("/insert_point")
	 @ResponseBody 
	 public void insertChat(@RequestParam int point, @RequestParam String id  ) {
		gameService.updateGamePoint(id, point);
	 }
	
}
