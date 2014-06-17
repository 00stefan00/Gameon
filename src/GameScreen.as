package
{
	/**
	 * ...
	 * @author Stefan
	 */
	import screens.BaseScreen;
	import screens.levels.*;
	import screens.Welcome;
	import screens.HomeScreen;
	import starling.display.Sprite;
	import starling.events.Event;
	import flash.utils.Dictionary;
	
	import screens.HomeScreen;
	
	public class GameScreen extends Sprite
	{
		private var currentScreen:BaseScreen;
		private var screenWelcome:Welcome;
		private var currentScreenName:String;
		private static var mainMenu:HomeScreen;
		private static var gameCount:Number = 9 - 1;		
		private var scoreDict:Dictionary = new Dictionary();
		
		public function GameScreen()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		/**
		 * Starts the welcomming screen on first boot
		 */
		private function onAddedToStage(event:Event):void
		{
			loadScreen("welcome");
		}
		
		public function getCurrentScreenName():String
		{
			return currentScreenName;
		}
		
		/**
		 * Switches to a new screen by giving a string (screenName)
		 */
		public function loadScreen(screenName:String):void
		{
			currentScreenName = screenName;
			if (currentScreen != null)
			{
				removeChild(currentScreen);
			}
			if (screenName == "welcome")
			{
				currentScreen = new Welcome(this);
			}
			else if (screenName == "homescreen")
			{
				currentScreen = new HomeScreen(this);
			}
			else if (screenName == "level_00")
			{
				currentScreen = new level_00(this);
			}
			else if (screenName == "level_01")
			{
				currentScreen = new level_01(this);
			}
			else if (screenName == "level_02")
			{
				currentScreen = new level_02(this);
			}
			else if (screenName == "level_03")
			{
				currentScreen = new level_03(this);
			}
			else if (screenName == "level_04")
			{
				currentScreen = new level_04(this);
			}
			else if (screenName == "level_05")
			{
				currentScreen = new level_05(this);
			}
			else if (screenName == "level_06")
			{
				currentScreen = new level_06(this);
			}
			else if (screenName == "level_07")
			{
				currentScreen = new level_07(this);
			}
			else if (screenName == "level_08")
			{
				currentScreen = new level_08(this);
			}
			currentScreenName = screenName;
			addChild(currentScreen);
		}
		
		public function getLevelScore(level:Number):Number
		{
			if (scoreDict[level] == null)
			{
				scoreDict[level] = 0;
			}
			return scoreDict[level];
		}
		
		public function setLevelScore(level:Number, score:Number):void
		{
			if (scoreDict[level] < score)
			{
				scoreDict[level] = score;
			}
		}
		
		public function getTotalScore():Number
		{
			var totalScore:Number = 0;
			for each(var level:Number in scoreDict) {
				totalScore + scoreDict[level];
			}
			return totalScore;
		}
	}
}