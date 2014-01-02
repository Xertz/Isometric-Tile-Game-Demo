package com.luislarghi.gui
{
	import com.luislarghi.myfirtsengine.Engine_GUI;
	import com.luislarghi.myfirtsengine.Engine_Game;
	
	import flash.display.Stage;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.utils.getTimer;
	
	public class GUI_Stage1 extends Engine_GUI
	{
		private var TF_InputFeedback:TextField;
		private var TF_Timer:TextField;
		private var TFormat:TextFormat;
		
		private var textViewable:Boolean;
		private var pause:Boolean;
		private var gameOver:Boolean;
		
		private var timer:CountdownTimer;
		
		public function GUI_Stage1(s:Stage, g:Engine_Game) { super(s, g); }
		
		protected override function InstantiateAllTF():void
		{
			if(!TF_InputFeedback)
			{
				TF_InputFeedback = new TextField();
				TF_InputFeedback.x = (mainStage.stageWidth / 2) - (TF_InputFeedback.width / 2);
				TF_InputFeedback.y = mainStage.stageHeight - TF_InputFeedback.height;
				TF_InputFeedback.selectable = false;
				TF_InputFeedback.mouseEnabled = false;
				TF_InputFeedback.visible = false;
			}
			
			if(!TF_Timer)
			{
				TF_Timer = new TextField();
				TF_Timer.x = (mainStage.stageWidth / 2) - (TF_Timer.width / 2);
				TF_Timer.y = 10;
				TF_Timer.selectable = false;
				TF_Timer.mouseEnabled = false;
			}
			
			if(!TFormat)
			{
				TFormat = new TextFormat();
				TFormat.color = 0xFFFFFF;
				TFormat.size = 40;
				TFormat.font = "Arial";
			}
		}
		
		public override function Init():void
		{ 
			mainStage.addChild(TF_InputFeedback);
			mainStage.addChild(TF_Timer);
			
			if(!timer) timer = new CountdownTimer(this, 1 * 60 * 1000);
			timer.start();
			
			textViewable = false;
			pause = false;
			gameOver = false;
		}		
		
		public override function Clear():void
		{ 
			mainStage.removeChild(TF_InputFeedback);
			mainStage.removeChild(TF_Timer);
			
			timer.stop();
			timer = null;
		}
		
		public override function Draw():void
		{
			if(textViewable)
			{
				TF_InputFeedback.visible = true;
				TF_InputFeedback.setTextFormat(TFormat, 0, TF_InputFeedback.length);
				TF_InputFeedback.autoSize = TextFieldAutoSize.CENTER;
			}
			else TF_InputFeedback.visible = false;
			
			TF_Timer.setTextFormat(TFormat, 0, TF_Timer.length);
			TF_Timer.autoSize = TextFieldAutoSize.CENTER;
		}
		
		public function ChangeInputText(text:String):void { TF_InputFeedback.text = text; }
		public function ChangeTimerText(text:String):void { TF_Timer.text = text; }

		public function get GetTextVision():Boolean { return textViewable; }
		public function set SetTextVision(value:Boolean):void { textViewable = value; }
		
		public function get GetPause():Boolean { return pause; }
		public function set SetPause(value:Boolean):void { pause = value; }
		
		public function get GetGameOver():Boolean { return gameOver; }
		public function set SetGameOver(value:Boolean):void { gameOver = value; }
	}
}