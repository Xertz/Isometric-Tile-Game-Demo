package com.luislarghi.gui
{
	import com.luislarghi.Game;
	import com.luislarghi.R;
	import com.luislarghi.myfirtsengine.Engine_Game;
	import com.luislarghi.myfirtsengine.Engine_SpriteSheet;
	import com.luislarghi.myfirtsengine.Engine_States;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class GUI_Button extends Sprite
	{
		private var currentSprite:Engine_SpriteSheet;
		private var spriteSheet:Bitmap;
		
		private var changeToStage:int;
		private var mainGame:Engine_Game;
		
		private var minTile:int;
		private var maxTile:int;
		
		public function GUI_Button(x:int, y:int, s:int, g:Engine_Game, b:Bitmap, min:int = 0, max:int = 0)
		{
			this.x = x;
			this.y = y;
			minTile = min;
			maxTile = max;
			changeToStage = s;
			mainGame = g;
			spriteSheet = b;
			
			this.addEventListener(Event.ADDED_TO_STAGE, Init);
			this.addEventListener(Event.REMOVED_FROM_STAGE, Clear);
		}
		
		private function Init(e:Event):void
		{
			this.addEventListener(MouseEvent.CLICK, ButtonPressed);
			
			if(spriteSheet)
			{
				currentSprite = new Engine_SpriteSheet(spriteSheet, false, R.TILE_WIDTH * 3, R.TILE_WIDTH * 2);
			}
			
			this.addChild(currentSprite);
			
			currentSprite.drawTile(minTile);
		}
		
		private function Clear(e:Event):void
		{
			this.removeEventListener(MouseEvent.CLICK, ButtonPressed);
			this.removeChild(currentSprite);
		}
		
		private function ButtonPressed(e:MouseEvent):void
		{
			mainGame.SetNextState(changeToStage);
		}
	}
}