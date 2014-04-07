package screens
{
	/**
	 * ...
	 * @author ...
	 */
	import screens.HomeScreen;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	
	public class Welcome extends Sprite
	{ 
		private var bg:Image;
		
		private var playBtn:Button;
		
		private var mainMenu:HomeScreen;
		
		public function Welcome()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			drawScreen();
		}
		
		private function drawScreen():void
		{
			bg = new Image(Assets.getTexture("Background"));
			this.addChild(bg);
			
			playBtn = new Button(Assets.getTexture("StartBtn"));
			playBtn.x = 177;
			playBtn.y = 100;
			playBtn.addEventListener(TouchEvent.TOUCH, this.onStartButtonClicked);
			this.addChild(playBtn);
		}
		
		private function onStartButtonClicked(e:TouchEvent):void
		{
			this.removeChildren();
			mainMenu = new HomeScreen();
			this.addChild(mainMenu);
		}
	
	}

}