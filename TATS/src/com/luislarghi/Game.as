package com.luislarghi
{
	import com.Main;
	import com.luislarghi.gamestates.Credits;
	import com.luislarghi.gamestates.MainMenu;
	import com.luislarghi.gamestates.Stage_1;
	import com.luislarghi.myfirtsengine.Engine_Game;
	import com.luislarghi.myfirtsengine.Engine_States;
	
	import flash.display.Stage;
	import flash.system.System;
	
	public class Game extends Engine_Game
	{
		public function Game()
		{
			super(Main.mainStage);
			
			SetNextState(Engine_States.STATE_MAINMENU);
		}
		
		protected override function ChangeState():void
		{
			// If there's a stage to change to
			if(nextState != Engine_States.STATE_NULL)
			{
				// If the next stage is not exit remove the current one...
				if(nextState != Engine_States.STATE_EXITAPP && currentState)
				{
					mainStage.removeChild(currentState);
					currentState = null;
				}
				
				// and change to the new one
				switch(nextState)
				{
					case Engine_States.STATE_MAINMENU:
						currentState = new MainMenu(this);
						mainStage.addChild(currentState);
						break;
					
					case Engine_States.STATE_CREDITS:
						currentState = new Credits(this);
						mainStage.addChild(currentState);
						break;
					
					case Engine_States.STATE_INGAME:
						currentState = new Stage_1(this);
						mainStage.addChild(currentState);
						break;
				}
				
				stateID = nextState;
				
				nextState = Engine_States.STATE_NULL;
			}
		}
		
		protected override function ExitApp():void
		{
			System.exit(0);
		}
	}
}