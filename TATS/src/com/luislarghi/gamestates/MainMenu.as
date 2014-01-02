package com.luislarghi.gamestates
{
	import com.luislarghi.gui.GUI_MainMenu;
	import com.luislarghi.myfirtsengine.Engine_Game;
	import com.luislarghi.myfirtsengine.Engine_GameState;
	import com.luislarghi.myfirtsengine.Engine_States;
	
	import flash.display.BitmapData;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	public class MainMenu extends Engine_GameState
	{
		private var GUI_component:GUI_MainMenu;
		
		public function MainMenu(s:Stage, g:Engine_Game, c:BitmapData)
		{ 
			super(s, g, c);
			GUI_component = new GUI_MainMenu(mainStage, mainGame);
		}
		
		protected override function Init(e:Event):void
		{
			mainStage.addEventListener(KeyboardEvent.KEY_DOWN, Handle_Events);
			GUI_component.Init();
			trace("You are in the MAINMENU");
		}
		
		protected override function Clear(e:Event):void
		{
			mainStage.removeEventListener(KeyboardEvent.KEY_DOWN, Handle_Events);
			GUI_component.Clear();
			GUI_component = null;
		}
		
		private function Handle_Events(e:KeyboardEvent):void
		{
			if(e.keyCode == Keyboard.ENTER) { mainGame.SetNextState(Engine_States.STATE_INGAME); }
			else if(e.keyCode == Keyboard.ESCAPE) { mainGame.SetNextState(Engine_States.STATE_EXITAPP); }
		}
	}
}