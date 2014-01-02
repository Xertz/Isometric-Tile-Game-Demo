package com.luislarghi.gameobjects
{
	import com.luislarghi.R;
	import com.luislarghi.myfirtsengine.Engine_SpriteSheet;
	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.ui.Keyboard;

	public class Player extends Character
	{
		public function Player(s:Stage, startTile:Point) { super(s, startTile); }
		
		protected override function Init(e:Event):void
		{
			SpriteSheet = new Engine_SpriteSheet(new R.SS_Petra, false, R.SS_WIDTH, R.SS_HEIGHT);
			this.addChild(SpriteSheet);
			
			speed = 0.1;
			currentAnimTile = 0;
			trace("Petra start tile is " + currentTile);
		}
		
		protected override function Clear(e:Event):void
		{	
			this.removeChild(SpriteSheet);
			SpriteSheet = null;
		}
		
		/*	ANIMATION TILES POSITION
		DOWN -> 0 - 7
		RIGHT -> 8 - 15
		LEFT -> 16 - 23
		UP -> 24 - 31
		*/
		protected override function UpdateAnim():void
		{
			if(direcctionY < 0) { currentAnimTile = 0; }
			else if(direcctionX < 0) { currentAnimTile = 8; }
			else if(direcctionY > 0) { currentAnimTile = 24; }
			else if(direcctionX > 0) { currentAnimTile = 16; }
		}
		
		public override function Draw():void { SpriteSheet.drawTile(currentAnimTile); }		
		public override function Move(x:int, y:int, nextPos:Point):void
		{ 
			direcctionX = x;
			direcctionY = y;
			UpdateAnim();
			
			this.x -= nextPos.x;
			this.y -= nextPos.y;
			
			currentTile.x -= (x * speed);
			currentTile.y -= (y * speed);
			
			trace("Petra is in tile (" + Math.floor(currentTile.x) + ", " + Math.floor(currentTile.y) + ")");
		}		
		public function get Speed():Number { return speed; }
		public function get CurrentTile():Point { return currentTile; }
		public function AdjustPlayerPosition(pt:Point):void { this.x = pt.x - R.TILE_HEIGHT; this.y = pt.y - R.TILE_WIDTH; }
	}
}