package com.acorn.project.DTO;

import org.springframework.stereotype.Component;

@Component
public class Tile {
	String code;
	String img;
	String background="resources/images/house_floor1.png";
	boolean talkable =false;
	boolean passable =false;
	boolean battle =false;
	String nextMap="";
	
	public Tile getClone() {
		Tile newTile= new Tile();
		newTile.setCode(this.code);
		newTile.setImg(this.img);
		newTile.setBackground(this.background);
		newTile.setTalkable(this.talkable);
		newTile.setPassable(this.passable);
		newTile.setBattle(this.battle);
		newTile.setNextMap(this.nextMap);
		return newTile;
		
	}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getBackground() {
		return background;
	}
	public void setBackground(String background) {
		this.background = background;
	}
	public boolean isTalkable() {
		return talkable;
	}
	public void setTalkable(boolean talkable) {
		this.talkable = talkable;
	}
	public boolean isPassable() {
		return passable;
	}
	public void setPassable(boolean passable) {
		this.passable = passable;
	}
	public boolean isBattle() {
		return battle;
	}
	public void setBattle(boolean battle) {
		this.battle = battle;
	}
	public String getNextMap() {
		return nextMap;
	}
	public void setNextMap(String nextMap) {
		this.nextMap = nextMap;
	}
	
	
	
}



class floor1 extends Tile{
	public floor1() {
		code="15";
		img="resources/images/house_floor1.png";
		passable= true;
	}
}
class left_wall extends Tile{
	public left_wall() {
		code="14";
		img="resources/images/house_left_wall1.png";
	}
}
class width_wall extends Tile{
	public width_wall() {
		code="8";
		img="resources/images/house_width_wall1.png";
	}
}
class right_wall extends Tile{
	public right_wall() {
		code="16";
		img="resources/images/house_right_wall1.png";
	}
}
class paint3 extends Tile{
	public paint3() {
		code="0";
		img="resources/images/paint3.png";
		background="resources/images/house_width_wall1.png";
	}
}
class paint2 extends Tile{
	public paint2() {
		code="2";
		img="resources/images/paint2.png";
		background="resources/images/house_width_wall1.png";

	}
}
class paint1 extends Tile{
	public paint1() {
		code="1";
		img="resources/images/paint1.png";
		background="resources/images/house_width_wall1.png";

	}
}
class clock extends Tile{
	public clock() {
		code="32";
		img="resources/images/clock1.png";
		background="resources/images/house_width_wall1.png";

	}
}
class drawer1 extends Tile{
	public drawer1() {
		code="21";
		img="resources/images/drawer1.png";
	}
}
class green_light extends Tile{
	public green_light() {
		code="12";
		img="resources/images/green_light.png";
	}
}
class blue_light extends Tile{
	public blue_light() {
		code="13";
		img="resources/images/blue_light.png";
	}
}
class red_light extends Tile{
	public red_light() {
		code="17";
		img="resources/images/red_light.png";
	}
}

class green_bed1 extends Tile{
	public green_bed1() {
		code="9";
		img="resources/images/green_bed1.png";
	}
}
class blue_bed1 extends Tile{
	public blue_bed1() {
		code="10";
		img="resources/images/blue_bed1.png";
	}
}
class red_bed1 extends Tile{
	public red_bed1() {
		code="11";
		img="resources/images/red_bed1.png";
	}
}
class green_bed2 extends Tile{
	public green_bed2() {
		code="18";
		img="resources/images/green_bed2.png";
	}
}
class blue_bed2 extends Tile{
	public blue_bed2() {
		code="19";
		img="resources/images/blue_bed2.png";
	}
}
class red_bed2 extends Tile{
	public red_bed2() {
		code="20";
		img="resources/images/red_bed2.png";
	}
}
class chair_left1 extends Tile{
	public chair_left1() {
		code="48";
		img="resources/images/chair_left1.png";
	}
}
class chair_right1 extends Tile{
	public chair_right1() {
		code="23";
		img="resources/images/chair_right1.png";
	}
}
class chair_up1 extends Tile{
	public chair_up1() {
		code="24";
		img="resources/images/chair_up1.png";
	}
}
class chair_down1 extends Tile{
	public chair_down1() {
		code="25";
		img="resources/images/chair_down1.png";
	}
}
class table1 extends Tile{
	public table1() {
		code="30";
		img="resources/images/table1.png";
	}
}
class flowerpot3 extends Tile{
	public flowerpot3() {
		code="3";
		img="resources/images/flowerpot3.png";
	}
}
class flowerpot2 extends Tile{
	public flowerpot2() {
		code="5";
		img="resources/images/flowerpot2.png";
	}
}
class flowerpot1 extends Tile{
	public flowerpot1() {
		code="4";
		img="resources/images/flowerpot1.png";
	}
}
class green_tile1 extends Tile{
	public green_tile1() {
		code="45";
		img="resources/images/green_tile1.png";
		passable= true;
	}
}
class red_tile1 extends Tile{
	public red_tile1() {
		code="46";
		img="resources/images/red_tile1.png";
		passable= true;
	}
}
class blue_tile1 extends Tile{
	public blue_tile1() {
		code="47";
		img="resources/images/blue_tile1.png";
		passable= true;
	}
}


class empty extends Tile{
	
	public empty() {
		code="100";
		background="transparent";
		img="transparent";
		passable= true;
	}
}

class player extends Tile{

	public player() {
		code="101";
		img="resources/images/player_dot_front.gif";
		talkable=true;
		passable= true;
	}
}


