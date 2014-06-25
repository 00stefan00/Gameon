package
{
	/**
	 * ...
	 * @author Stefan
	 */
	import flash.media.Sound;
	import screens.BaseScreen;
	import screens.levels.*;
	import screens.Welcome;
	import screens.HomeScreen;
	import starling.display.Sprite;
	import starling.events.Event;
	import flash.utils.Dictionary;
	import ao.ExternalStorageAO;
	import util.Config;
	import SoundManager;
	
	import screens.HomeScreen;
	
	public class GameScreen extends Sprite
	{
		private var currentScreen:BaseScreen;
		private var screenWelcome:Welcome;
		private var currentScreenName:String;
		private static var mainMenu:HomeScreen;
		private var scoreDict:Dictionary = new Dictionary();
		private var muted:Boolean = false;
		private var soundManager:SoundManager;
		
		public function GameScreen()
		{
			super();
			if (Config.SAVES_ENABLED)
			{
				loadData();
			}
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
			getSoundManager().stopAllMusic();
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
			if (scoreDict[level] == null)
			{
				scoreDict[level] = 0;
			}
			if (scoreDict[level] < score)
			{
				scoreDict[level] = score;
				if (Config.SAVES_ENABLED)
				{
					saveData();
				}
			}
		}
		
		private function saveData():void
		{
			var rawData:String = "";
			
			for (var key:String in scoreDict)
			{
				rawData += "" + key + ";" + scoreDict[key] + "?";
			}
			ExternalStorageAO.saveFileToDirectory("SaveFile.txt", Config.SAVE_GAME_DIRECTORY, rawData);
		}
		
		private function loadData():void
		{
			var rawData:String = ExternalStorageAO.loadFile(Config.SAVE_GAME_DIRECTORY + "SaveFile.txt");
			
			var dataArray:Array = rawData.split("?")
			while (dataArray.length > 0)
			{
				var temp:String = dataArray.pop();
				var tempArray:Array = temp.split(";");
				var score:String = tempArray.pop();
				setLevelScore(new Number(tempArray.pop()), new Number(score));
			}
		}
		
		public function getTotalScore():Number
		{
			var totalScore:Number = 0;
			for (var level:String in scoreDict)
			{
				totalScore += scoreDict[level];
			}
			return totalScore;
			trace(totalScore);
		}
		
		public function getSoundManager():SoundManager
		{
			if (soundManager == null)
			{				
				soundManager = new SoundManager();
			}
			return soundManager;
		}
	}
}