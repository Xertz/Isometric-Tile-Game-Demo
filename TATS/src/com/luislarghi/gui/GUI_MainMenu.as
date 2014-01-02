package com.luislarghi.gui
{
	import com.luislarghi.R;
	import com.luislarghi.myfirtsengine.Engine_GUI;
	import com.luislarghi.myfirtsengine.Engine_Game;
	import com.luislarghi.myfirtsengine.Engine_States;
	
	import flash.display.Bitmap;
	import flash.display.Stage;
	
	public class GUI_MainMenu extends Engine_GUI
	{
		private var spriteSheet:Bitmap;
		
		private var BT_Play:GUI_Button;
		private var BT_Credits:GUI_Button;
		private var BT_Exit:GUI_Button;
		
		public function GUI_MainMenu(s:Stage, g:Engine_Game) { super(s, g); }
		
		public override function Init():void
		{
			if(!spriteSheet) { spriteSheet = new R.GUI(); }
			BT_Play = new GUI_Button((mainStage.stageWidth / 2) - (R.TILE_WIDTH * 2), 0,
									  Engine_States.STATE_INGAME, mainGame, spriteSheet);
			BT_Credits = new GUI_Button((mainStage.stageWidth / 2) - (R.TILE_WIDTH * 2), (mainStage.stageHeight / 2) - ((R.TILE_HEIGHT * 2) / 2) - 50,
									  Engine_States.STATE_CREDITS, mainGame, spriteSheet, 2, 2);
			BT_Exit = new GUI_Button((mainStage.stageWidth / 2) - (R.TILE_WIDTH * 2), (mainStage.stageHeight / 2) + (R.TILE_HEIGHT * 2) - 50,
									  Engine_States.STATE_EXITAPP, mainGame, spriteSheet, 4, 4);
			
			mainStage.addChild(BT_Play);
			mainStage.addChild(BT_Credits);
			mainStage.addChild(BT_Exit);
		}
		
		public override function Clear():void
		{
			mainStage.removeChild(BT_Play);
			mainStage.removeChild(BT_Credits);
			mainStage.removeChild(BT_Exit);
			spriteSheet = null;
		}
	}
}