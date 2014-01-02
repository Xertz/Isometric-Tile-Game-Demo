package com.luislarghi.gameobjects
{
	import com.luislarghi.R;
	import com.luislarghi.myfirtsengine.Engine_SpriteSheet;
	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.geom.Point;
	
	public class TileMap
	{
		private var mainStage:Stage;
		private var mapArray:Vector.<Engine_SpriteSheet>;
		private var container:Sprite;
		
		private var startTileCenter:Point;
		
		public function TileMap(s:Stage, c:Sprite) { mainStage = s; container = c; }
		
		public function Init(player:Player):void
		{
			if(!mapArray) mapArray = new Vector.<Engine_SpriteSheet>;
			CreateMapArray();
			AdjustMapPosition(player);
		}
		
		public function Clear():void
		{
			for(var i:int = 0; i < mapArray.length; i++)
			{
				container.removeChild(mapArray[i]);
				//mapArray.splice(i, 1);
			}
			
			mapArray = null;
		}
		
		public function Draw():void
		{
			for(var e:int = 0; e < mapArray.length; e++) mapArray[e].drawTile(0);
		}
		
		private function CreateMapArray():void
		{
			for(var row:int = 0; row < R.TM_Stage1.length; row++)
			{
				for(var col:int = 0; col < R.TM_Stage1[row].length; col++)
				{
					var tmpTile:Engine_SpriteSheet;
					var isoPos:Point;
					
					if(R.TM_Stage1[row][col] == R.TILE_GRASS)
					{
						tmpTile = new Engine_SpriteSheet(new R.BG_Cesped(), false, R.TILE_WIDTH, R.TILE_HEIGHT, R.TM_Stage1[row][col]);
						isoPos = R.Map2Screen(new Point(row, col));
						tmpTile.x = isoPos.x;
						tmpTile.y = isoPos.y;
						mapArray.push(tmpTile);
						
						//trace("A new grass tile added in: (" + tmpTile.x + "," + tmpTile.y + ")");
					}
					else if(R.TM_Stage1[row][col] == R.TILE_STREET_H)
					{
						tmpTile = new Engine_SpriteSheet(new R.BG_nsStreet(), false, R.TILE_WIDTH, R.TILE_HEIGHT, R.TM_Stage1[row][col]);
						isoPos = R.Map2Screen(new Point(row, col));
						tmpTile.x = isoPos.x;
						tmpTile.y = isoPos.y;
						mapArray.push(tmpTile);
						
						//trace("A new H street tile added in: (" + tmpTile.x + "," + tmpTile.y + ")");
					}
					else if(R.TM_Stage1[row][col] == R.TILE_STREET_V)
					{
						tmpTile = new Engine_SpriteSheet(new R.BG_ewStreet(), false, R.TILE_WIDTH, R.TILE_HEIGHT, R.TM_Stage1[row][col]);
						isoPos = R.Map2Screen(new Point(row, col));
						tmpTile.x = isoPos.x;
						tmpTile.y = isoPos.y;
						mapArray.push(tmpTile);
						
						//trace("A new V street tile added in: (" + tmpTile.x + "," + tmpTile.y + ")");
					}
					else if(R.TM_Stage1[row][col] == R.TILE_STREET_B)
					{
						tmpTile = new Engine_SpriteSheet(new R.BG_blankStreet(), false, R.TILE_WIDTH, R.TILE_HEIGHT, R.TM_Stage1[row][col]);
						isoPos = R.Map2Screen(new Point(row, col));
						tmpTile.x = isoPos.x;
						tmpTile.y = isoPos.y;
						mapArray.push(tmpTile);
						
						//trace("A new B street tile added in: (" + tmpTile.x + "," + tmpTile.y + ")");
					}
					else if(R.TM_Stage1[row][col] == R.TILE_TREES)
					{
						tmpTile = new Engine_SpriteSheet(new R.BG_Arboles(), true, R.TILE_WIDTH, 128, R.TM_Stage1[row][col]);
						isoPos = R.Map2Screen(new Point(row, col));
						tmpTile.x = isoPos.x;
						tmpTile.y = isoPos.y - R.TILE_WIDTH / 2;
						mapArray.push(tmpTile);
						
						//trace("A new trees tile added in: (" + tmpTile.x + "," + tmpTile.y + ")");
					}
					else if(R.TM_Stage1[row][col] == R.TILE_SIDEW)
					{
						tmpTile = new Engine_SpriteSheet(new R.BG_Sidewalk(), false, R.TILE_WIDTH, 67, R.TM_Stage1[row][col]);
						isoPos = R.Map2Screen(new Point(row, col));
						tmpTile.x = isoPos.x;
						tmpTile.y = isoPos.y - (67 - R.TILE_HEIGHT);
						mapArray.push(tmpTile);
						
						//trace("A new V street tile added in: (" + tmpTile.x + "," + tmpTile.y + ")");
					}
					else if(R.TM_Stage1[row][col] == R.TILE_HOUSE_1)
					{
						tmpTile = new Engine_SpriteSheet(new R.BG_Casa1(), true, 128, 128, R.TM_Stage1[row][col]);
						isoPos = R.Map2Screen(new Point(row, col));
						tmpTile.x = isoPos.x;
						tmpTile.y = isoPos.y - R.TILE_WIDTH / 2;
						mapArray.push(tmpTile);
						
						//trace("A new small house tile added in: (" + tmpTile.x + "," + tmpTile.y + ")");
					}
					else if(R.TM_Stage1[row][col] == R.TILE_HOUSE_2)
					{
						tmpTile = new Engine_SpriteSheet(new R.BG_Casa2(), true, R.TILE_WIDTH * 2, 256, R.TM_Stage1[row][col]);
						isoPos = R.Map2Screen(new Point(row, col));
						tmpTile.x = isoPos.x;
						tmpTile.y = isoPos.y - R.TILE_WIDTH;
						mapArray.push(tmpTile);
						
						//trace("A new big house tile added in: (" + tmpTile.x + "," + tmpTile.y + ")");
					}
					else if(R.TM_Stage1[row][col] == R.TILE_HOUSE_3)
					{
						tmpTile = new Engine_SpriteSheet(new R.BG_Casa3(), true, R.TILE_WIDTH * 3, 384, R.TM_Stage1[row][col]);
						isoPos = R.Map2Screen(new Point(row, col));
						tmpTile.x = isoPos.x;
						tmpTile.y = isoPos.y - (R.TILE_WIDTH  * 3 - R.TILE_HEIGHT);
						mapArray.push(tmpTile);
						
						//trace("A new tall building tile added in: (" + tmpTile.x + "," + tmpTile.y + ")");
					}
				}
			}
			
			for(var i:int = 0; i < mapArray.length; i++) { container.addChild(mapArray[i]); }
		}
		
		private function AdjustMapPosition(mainPlayer:Player):void
		{
			var screenCenter:Point = new Point(mainStage.stageWidth / 2, mainStage.stageHeight / 2);
			startTileCenter = new Point(R.Map2Screen(mainPlayer.CurrentTile).x + R.TILE_WIDTH / 2, R.Map2Screen(mainPlayer.CurrentTile).y + R.TILE_HEIGHT / 2);
			var distance:Point = new Point(screenCenter.x - startTileCenter.x, screenCenter.y - startTileCenter.y);
			
			container.x += distance.x;
			container.y += distance.y;
			
			mainPlayer.AdjustPlayerPosition(startTileCenter);
		}
		
		public function get StartTilePos():Point { return startTileCenter; }
	}
}