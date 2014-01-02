package com.luislarghi.gameobjects
{
	import com.luislarghi.R;
	import com.luislarghi.gui.GUI_Stage1;
	
	import flash.geom.Point;
	
	public class TriggerMap
	{
		private var triggerArray:Array;
		private var mainGUI:GUI_Stage1;
		
		public function TriggerMap(gui:GUI_Stage1)
		{
			mainGUI = gui;
			Init();
		}
		
		public function Init():void { if(!triggerArray) triggerArray = R.TG_Stage1; }
		
		public function Clear():void
		{
			triggerArray = null;
			mainGUI = null;
		}
		
		public function CheckTrigger(tile:Point):void
		{
			if(triggerArray[Math.floor(tile.x)][Math.floor(tile.y)] != 0)
			{
				ExecuteTrigger(triggerArray[Math.floor(tile.x)][Math.floor(tile.y)]);
				mainGUI.SetTextVision = true;
			}
			else mainGUI.SetTextVision = false;
		}
		
		private function ExecuteTrigger(action:int):void
		{
			switch(action)
			{
				case R.TG_NOCKDOOR:
					mainGUI.ChangeInputText("Press SPACE to nock!");
					break;
				case R.TG_EXIT:
					mainGUI.ChangeInputText("Congrats!.. now press RETURN to exit.");
					mainGUI.SetGameOver = true;
					break;
			}
		}
	}
}