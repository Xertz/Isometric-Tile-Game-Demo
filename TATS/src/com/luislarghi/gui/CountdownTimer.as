package com.luislarghi.gui
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.osmf.events.TimeEvent;
	
	public class CountdownTimer extends Timer
	{
		private var time:Number;
		private var mainGUI:GUI_Stage1;
		
		private var minutes:int;
		private var seconds:int;
		
		public function CountdownTimer(gui:GUI_Stage1, time:Number = Number.NEGATIVE_INFINITY, delay:Number=1000)
		{
			super(delay);
			
			if(isNaN(time)) this.time = 0;
			else this.time = time;
			
			mainGUI = gui;
			UpdateGUI("0" + (Math.floor(time / 60000)).toString() + ":00");
		}
		
		public override function start():void
		{
			super.start();
			
			addEventListener(TimerEvent.TIMER, HandleTime);
		}
		
		override public function stop():void
		{
			super.stop();
			
			removeEventListener(TimerEvent.TIMER, HandleTime);
		}
		
		private function HandleTime(e:TimerEvent):void
		{
			if(!mainGUI.GetPause && !mainGUI.GetGameOver)
			{
				time -= delay;
				
				minutes = time / 60000;
				seconds = (time / 1000) % 60;
				
				UpdateGUI((minutes < 10 ? "0" + minutes.toString() : minutes.toString()) + ":" +
					(seconds < 10 ? "0" + seconds.toString() : seconds.toString()));
				
				if(time <= 0)
				{
					mainGUI.ChangeInputText("Too bad!... now press RETURN to exit.");
					mainGUI.SetGameOver = true;
					mainGUI.SetTextVision = true;
				}
			}
		}
		
		private function UpdateGUI(text:String):void { mainGUI.ChangeTimerText(text); }
	}
}