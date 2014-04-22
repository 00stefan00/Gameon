package screens
{
	/**
	 * ...
	 * @author ...
	 */
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	
	public class Welcome extends BaseScreen
	{	
		private var bg:Image;		
		private var playBtn:Button;
		
		public function Welcome(main:GameScreen)
		{
			super(main);
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			drawScreen();
		}
		
		/**
		 * draws all images to welcome screen
		 */
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
			main.loadScreen("homescreen");
		}
	
	}

}