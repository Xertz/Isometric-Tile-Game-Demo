package com.luislarghi
{
	import com.luislarghi.gamestates.Credits;
	import com.luislarghi.gamestates.MainMenu;
	import com.luislarghi.gamestates.Stage_1;
	import com.luislarghi.myfirtsengine.Engine_Game;
	import com.luislarghi.myfirtsengine.Engine_States;
	
	import flash.display.Stage;
	
	public class Game extends Engine_Game
	{
		public function Game(s:Stage)
		{
			super(s);
			
			//The game starts with it's menu
			stateID = Engine_States.STATE_MAINMENU;
			currentState = new MainMenu(mainStage, this, mainCanvas);
			mainStage.addChild(currentState);
		}
		
		protected override function ChangeState():void
		{
			// If there's a stage to change to
			if(nextState != Engine_States.STATE_NULL)
			{
				// If the next stage is not exit remove the current one...
				if(nextState != Engine_States.STATE_EXITAPP)
				{
					mainStage.removeChild(currentState);
					currentState = null;
				}
				
				// and change to the new one
				switch(nextState)
				{
					case Engine_States.STATE_MAINMENU:
						currentState = new MainMenu(mainStage, this, mainCanvas);
						mainStage.addChild(currentState);
						break;
					
					case Engine_States.STATE_CREDITS:
						currentState = new Credits(mainStage, this, mainCanvas);
						mainStage.addChild(currentState);
						break;
					
					case Engine_States.STATE_INGAME:
						currentState = new Stage_1(mainStage, this, mainCanvas);
						mainStage.addChild(currentState);
						break;
					
					/*case Engine_States.STATE_GAMEOVER:
						currentState = new GameOver(mainStage, this, mainCanvas, mainScoreM);
						mainStage.addChild(currentState);
						break;*/
				}
				
				stateID = nextState;
				
				nextState = Engine_States.STATE_NULL;
			}
		}
	}
}