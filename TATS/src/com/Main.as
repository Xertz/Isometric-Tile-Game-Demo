package com
{
	import com.luislarghi.Game;
	
	import flash.display.Sprite;
	import flash.display.Stage;
	
	[SWF(width = 800, height = 600, frameRate = 60, backgroundColor = 0x000000)]
	public class Main extends Sprite
	{
		private var mainGame:Game;
		public static var mainStage:Stage;
		
		public function Main()
		{
			mainStage = this.stage;
			
			mainGame = new Game();
		}
	}
}