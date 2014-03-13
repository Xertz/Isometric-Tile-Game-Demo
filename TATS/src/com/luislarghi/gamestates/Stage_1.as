package com.luislarghi.gamestates
{
	import com.Main;
	import com.luislarghi.R;
	import com.luislarghi.gameobjects.Player;
	import com.luislarghi.gameobjects.TileMap;
	import com.luislarghi.gameobjects.TriggerMap;
	import com.luislarghi.gui.GUI_Stage1;
	import com.luislarghi.myfirtsengine.Engine_Game;
	import com.luislarghi.myfirtsengine.Engine_GameState;
	import com.luislarghi.myfirtsengine.Engine_States;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	
	public class Stage_1 extends Engine_GameState
	{
		private var mainPlayer:Player;
		private var keysMapper:Array;
		private var tileMap:TileMap;
		private var triggerMap:TriggerMap;
		
		private var GUI_Component:GUI_Stage1;
		
		public function Stage_1(g:Engine_Game) { super(Main.mainStage, g); }
		
		protected override function Init(e:Event):void
		{		
			if(!GUI_Component) GUI_Component = new GUI_Stage1(mainStage, mainGame);
			GUI_Component.Init();
			if(!tileMap) tileMap = new TileMap(mainStage, this);
			if(!triggerMap) triggerMap = new TriggerMap(GUI_Component);
			if(!mainPlayer) mainPlayer = new Player(mainStage, new Point(1, 19));
			tileMap.Init(mainPlayer);
			this.addChild(mainPlayer);
			keysMapper = new Array();
			
			mainStage.addEventListener(KeyboardEvent.KEY_DOWN, KeyDown);
			mainStage.addEventListener(KeyboardEvent.KEY_UP, KeyUp);

			trace("You are INGAME");
		}
		
		protected override function Clear(e:Event):void
		{
			this.removeChild(mainPlayer);
			mainPlayer = null;
			tileMap.Clear();
			tileMap = null;
			triggerMap.Clear();
			triggerMap = null;
			keysMapper = null;
			
			GUI_Component.Clear();
			GUI_Component = null;
			
			mainStage.removeEventListener(KeyboardEvent.KEY_DOWN, KeyDown);
			mainStage.removeEventListener(KeyboardEvent.KEY_UP, KeyUp);
		}
		
		public override function Logic():void
		{
			if(!GUI_Component.GetGameOver)
			{
				if(!GUI_Component.GetPause)
				{
					if(keysMapper[Keyboard.DOWN]) { Move(0, -1); }
					else if (keysMapper[Keyboard.RIGHT]) { Move(-1, 0); }
					else if (keysMapper[Keyboard.UP]) { Move(0, 1); }
					else if (keysMapper[Keyboard.LEFT]) { Move(1, 0); }
					
					if(GUI_Component.GetTextVision) if(keysMapper[Keyboard.SPACE]) { trace("IT's ALIVE!"); }
				}
				else
					if(keysMapper[Keyboard.BACKSPACE]) { mainGame.SetNextState(Engine_States.STATE_MAINMENU); }
			}
			else
				if (keysMapper[Keyboard.BACKSPACE]) { mainGame.SetNextState(Engine_States.STATE_MAINMENU); }
		} 
		
		protected override function Draw():void
		{ 
			tileMap.Draw();
			mainPlayer.Draw();
			GUI_Component.Draw();
		}
		
		private function Move(x:int, y:int):void
		{	
			var nextIsoPos:Point = R.Map2Screen(new Point(x * mainPlayer.Speed, y * mainPlayer.Speed));

			if(CheckNextTileCollition(Math.round(mainPlayer.CurrentTile.x - (x * mainPlayer.Speed)),
				Math.round(mainPlayer.CurrentTile.y - (y * mainPlayer.Speed))))
			{
				this.x += nextIsoPos.x;
				this.y += nextIsoPos.y;
				
				mainPlayer.Move(x, y, nextIsoPos);
				triggerMap.CheckTrigger(mainPlayer.CurrentTile);
			}
		}
		
		private function CheckNextTileCollition(x:int, y:int):Boolean
		{
			trace("Next tile is (" + x + ", " + y + ")");
			
			return ((x < R.TM_Stage1.length && x >= 0) &&
					(y < R.TM_Stage1[x].length && y >= 0) &&
					(R.TM_Stage1[x][y] == R.TILE_GRASS ||
					R.TM_Stage1[x][y] == R.TILE_STREET_H ||
					R.TM_Stage1[x][y] == R.TILE_STREET_V ||
					R.TM_Stage1[x][y] == R.TILE_SIDEW ||
					R.TM_Stage1[x][y] == R.TILE_STREET_B ||
					R.TM_Stage1[x][y] == R.TILE_HOUSE_3))
			? true : false;
		}
		
		private function KeyDown(e:KeyboardEvent):void { keysMapper[e.keyCode] = true; }
		
		private function KeyUp(e:KeyboardEvent):void 
		{ 
			keysMapper[e.keyCode] = false; 
			if (e.keyCode == Keyboard.ESCAPE)
			{ 
				GUI_Component.SetPause = !GUI_Component.GetPause;
				GUI_Component.ChangeInputText("ESCAPE to resume. RETURN to exit.");
				GUI_Component.SetTextVision = GUI_Component.GetPause;
			}
		}
	}
}