package
{
	/**
	 * ...
	 * @author Stefan
	 */
	import screens.BaseScreen;
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
			}
			
			addChild(currentScreen);
		}
	}
}