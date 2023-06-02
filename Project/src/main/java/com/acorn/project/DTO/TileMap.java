package com.acorn.project.DTO;

import org.springframework.stereotype.Component;

@Component
public class TileMap {
	String name;
	int width;
	int height;
	Tile[] tiles;
	int[] tileInt;
	int[] nextInts;
	String[] nextMaps;

	static Tile[] all_tile = new Tile[] { new floor1(),new empty(), new player(),
			new left_wall(),new right_wall(), new width_wall(),new paint1(),new paint2(),
			new paint3(), new flowerpot1(),new flowerpot2(), new flowerpot3(),new green_light(),
			new red_light(), new blue_light(), new green_bed1(),new green_bed2(),new red_bed1(),new red_bed2(),
			new blue_bed1(),new blue_bed2(), new drawer1(),new chair_left1(), new chair_right1(),
			new chair_up1(), new chair_down1(), new table1(), new clock(),new green_tile1(),
			new red_tile1(), new blue_tile1()
			 };

	public String all_tile_script() {
		String script = "";
		for (int i = 0; i < all_tile.length; i++) {
			if (all_tile[i].code != "101") {
				script += " function make_" + all_tile[i].code + "(){\r\n" + "            let tile={\r\n"
						+ "                            code:'" + all_tile[i].getCode() + "',\r\n"
						+ "                            pass:" + all_tile[i].isPassable() + ",\r\n"
						+ "                            battle:" + all_tile[i].isBattle() + ",\r\n"
						+ "                            url:'" + all_tile[i].img + "',\r\n" 
						+ "                            nextMap:'" + all_tile[i].getNextMap() + "',\r\n" 
						+ "    background: '"+all_tile[i].background+"' }\r\n"
						+ "            return tile;\r\n" + "        }; ";
			}else {
				script += " function make_" + all_tile[i].code + "(where){\r\n" + "            let tile={\r\n"
						+ "                            code:'" + all_tile[i].getCode() + "',\r\n"						+ "                            battle:" + all_tile[i].isBattle() + ",\r\n"
						+ "                            pass:" + all_tile[i].isPassable() + ",\r\n"
						+ "                            url:'" + all_tile[i].img + "',\r\n"
						+ "                            nextMap:'" + all_tile[i].getNextMap() + "',\r\n" 
						+ "    background: '"+all_tile[i].background+"' };\r\n"	
						+ "                          switch(where){ \r\n " 
						+ "							   case \"up\":\r\n"
						+ "                                tile.url=\"resources/images/player_dot_behind.gif\";\r\n"
						+ "                                break;\r\n"
						+ "                            case \"left\":\r\n"
						+ "                                tile.url =\"resources/images/player_dot_left.gif\";\r\n"
						+ "                                break;    \r\n"
						+ "                            case \"right\":\r\n"
						+ "                                tile.url =\"resources/images/player_dot_right.gif\";\r\n"
						+ "                                break;\r\n"
						+ "                            case \"down\":\r\n"
						+ "                                tile.url =\"resources/images/player_dot_front.gif\";\r\n"
						+ "                                break;\r\n"
						+ "                        } "
						+ "            return tile;\r\n}";
						
			}
			

		}

		return script;
	}

	public int[] getTileInt() {
		return tileInt;
	}

	public void setTileInt(int[] tileInt) {
		this.tileInt = tileInt;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int[] getNextInts() {
		return nextInts;
	}

	public void setNextInts(int[] nextInts) {
		this.nextInts = nextInts;
	}

	public Tile[] getTiles() {
		return tiles;
	}

	public void setTiles(Tile[] tiles) {
		this.tiles = tiles;
	}

	public String[] getNextMaps() {
		return nextMaps;
	}

	public void setNextMaps(String[] nextMaps) {
		this.nextMaps = nextMaps;
	}

	public void setTiles(int[] tileInt) {
		tiles = new Tile[tileInt.length];
		for (int i = 0; i < tiles.length; i++) {
			for (int j = 0; j < all_tile.length; j++) {
				if (all_tile[j].code.equals(Integer.toString(tileInt[i]))) {
					tiles[i] = all_tile[j].getClone();
				}
			}
		}
	}

	public TileMap() {
	}

	public TileMap(String name, int width, int height, int[] tileInt,int[] nextInts,String[] nextMaps) {
		this.name = name;
		this.width = width;
		this.height = height;
		this.tileInt = tileInt;
		this.nextInts= nextInts;
		this.nextMaps= nextMaps;
		setTiles(tileInt);
	}

}
