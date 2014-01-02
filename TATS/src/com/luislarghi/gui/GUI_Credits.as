package com.luislarghi.gui
{
	import com.luislarghi.myfirtsengine.Engine_GUI;
	import com.luislarghi.myfirtsengine.Engine_Game;
	
	import flash.display.Stage;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public class GUI_Credits extends Engine_GUI
	{
		private var TF_Developer:TextField;
		private var TF_Class:TextField;
		private var TF_Professor:TextField;
		private var TF_Assignment:TextField;
		private var TF_InputFeedback:TextField;
		
		private var TFormat:TextFormat;
		
		public function GUI_Credits(s:Stage, g:Engine_Game) { super(s, g); }
		
		protected override function InstantiateAllTF():void
		{
			if(!TF_Developer)
			{
				TF_Developer = new TextField();
				TF_Developer.text = "Programador: Luis Larghi";
				TF_Developer.x = (mainStage.stageWidth / 2) - (TF_Developer.width / 2);
				TF_Developer.y = (mainStage.stageHeight / 2) - 100;
				TF_Developer.selectable = false;
				TF_Developer.mouseEnabled = false;
			}
			
			if(!TF_Class)
			{
				TF_Class = new TextField();
				TF_Class.text = "Class: Programming II";
				TF_Class.x = (mainStage.stageWidth / 2) - (TF_Class.width / 2);
				TF_Class.y = (mainStage.stageHeight / 2) - 50;
				TF_Class.selectable = false;
				TF_Class.mouseEnabled = false;
			}
			
			if(!TF_Professor)
			{
				TF_Professor = new TextField();
				TF_Professor.text = "Professor: Miguel Vedoya";
				TF_Professor.x = (mainStage.stageWidth / 2) - (TF_Professor.width / 2);
				TF_Professor.y = (mainStage.stageHeight / 2);
				TF_Professor.selectable = false;
				TF_Professor.mouseEnabled = false;
			}
			
			if(!TF_Assignment)
			{
				TF_Assignment = new TextField();
				TF_Assignment.text = "Assignment: TP1";
				TF_Assignment.x = (mainStage.stageWidth / 2) - (TF_Assignment.width / 2);
				TF_Assignment.y = (mainStage.stageHeight / 2) + 50;
				TF_Assignment.selectable = false;
				TF_Assignment.mouseEnabled = false;
			}
			
			if(!TF_InputFeedback)
			{
				TF_InputFeedback = new TextField();
				TF_InputFeedback.text = "Press ESC to return.";
				TF_InputFeedback.x = (mainStage.stageWidth / 2) - (TF_InputFeedback.width / 2);
				TF_InputFeedback.y = mainStage.stageHeight - TF_InputFeedback.height;
				TF_InputFeedback.selectable = false;
				TF_InputFeedback.mouseEnabled = false;
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
			mainStage.addChild(TF_Developer);
			mainStage.addChild(TF_Class);
			mainStage.addChild(TF_Professor);
			mainStage.addChild(TF_Assignment);
			mainStage.addChild(TF_InputFeedback);
		}
		
		public override function Clear():void
		{
			mainStage.removeChild(TF_Developer);
			mainStage.removeChild(TF_Class);
			mainStage.removeChild(TF_Professor);
			mainStage.removeChild(TF_Assignment);
			mainStage.removeChild(TF_InputFeedback);
		}
		
		public override function Draw():void
		{
			TF_Developer.setTextFormat(TFormat, 0, TF_Developer.length);
			TF_Developer.autoSize = TextFieldAutoSize.CENTER;
			
			TF_Class.setTextFormat(TFormat, 0, TF_Class.length);
			TF_Class.autoSize = TextFieldAutoSize.CENTER;
			
			TF_Professor.setTextFormat(TFormat, 0, TF_Professor.length);
			TF_Professor.autoSize = TextFieldAutoSize.CENTER;
			
			TF_Assignment.setTextFormat(TFormat, 0, TF_Assignment.length);
			TF_Assignment.autoSize = TextFieldAutoSize.CENTER;
			
			TF_InputFeedback.setTextFormat(TFormat, 0, TF_InputFeedback.length);
			TF_InputFeedback.autoSize = TextFieldAutoSize.CENTER;
		}
	}
}