package com.luislarghi.gameobjects
{
	import com.luislarghi.R;
	import com.luislarghi.myfirtsengine.Engine_SpriteSheet;
	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;

	public class Character extends Sprite
	{
		protected var mainStage:Stage;
		
		protected var SpriteSheet:Engine_SpriteSheet;
		protected var direcctionX:int;
		protected var direcctionY:int;
		protected var currentAnimTile:int;
		
		protected var currentTile:Point;
		protected var speed:Number;
		
		public function Character(s:Stage, startTile:Point)
		{
			mainStage = s;
			currentTile = startTile;
			
			this.addEventListener(Event.ADDED_TO_STAGE, Init);
			this.addEventListener(Event.REMOVED_FROM_STAGE, Clear);
		}
		
		protected function Init(e:Event):void {}
		protected function Clear(e:Event):void {}
		protected function UpdateAnim():void {}
		public function Logic():void {}
		public function Draw():void {}
		public function Move(x:int, y:int, nextPos:Point):void {}
	}
}