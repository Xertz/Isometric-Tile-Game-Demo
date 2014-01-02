package com
{
	import com.luislarghi.Game;
	
	import flash.display.Sprite;
	
	[SWF(width = 800, height = 600, frameRate = 60, backgroundColor = 0x000000)]
	public class Main extends Sprite
	{
		private var mainGame:Game;
		
		public function Main()
		{
			mainGame = new Game(this.stage);
		}
	}
}