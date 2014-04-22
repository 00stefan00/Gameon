package
{
	/**
	 * ...
	 * @author Stefan
	 */
	import screens.BaseScreen;
	import screens.levels.level_00;
	import screens.levels.level_01;
	import screens.levels.level_02;
	import screens.levels.level_03;
	import screens.Welcome;
	import screens.HomeScreen;
	import starling.display.Sprite;
	import starling.events.Event;
	
	import screens.HomeScreen;
	
	
	
	public class GameScreen extends Sprite
	{
		private var currentScreen:BaseScreen;
		
		private var screenWelcome:Welcome;
		private static var mainMenu:HomeScreen;
		
		public function GameScreen()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			loadScreen("welcome");
		}
		
		public function loadScreen(screenName:String):void {
			if (currentScreen != null) {
				currentScreen.disposeScreen();
				removeChild(currentScreen);
			}
			if (screenName == "welcome") {
				currentScreen = new Welcome(this);
			} else if (screenName == "homescreen") {
				currentScreen = new HomeScreen(this);
			} else if (screenName == "level_00") {
				currentScreen = new level_00(this);
			} else if (screenName == "level_01") {
				currentScreen = new level_01(this);
			} else if (screenName == "level_02") {
				currentScreen = new level_02(this);
			} else if (screenName == "level_03") {
				currentScreen = new level_03(this);
			}
			
			
			addChild(currentScreen);
		}
	}
}