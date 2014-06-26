import util.Assets;
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
	import flash.events.ProgressEvent;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import starling.events.TouchPhase;
	import util.Assets;
	
	public class Welcome extends BaseScreen
	{
		private var bg:Image;
		private var logo:Image;
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
		
		private function drawScreen():void
		{
			bg = new Image(Assets.getTexture("Background"));
			this.addChild(bg);
			
			logo = new Image(Assets.getTexture("Logo"));
			logo.x = ((480 / 2) - (logo.width / 2));
			logo.y = 25;
			this.addChild(logo);
			
			playBtn = new Button(Assets.getTexture("StartBtn"));
			playBtn.x = ((480 / 2) - (playBtn.width / 2));
			playBtn.y = 255;
			playBtn.addEventListener(TouchEvent.TOUCH, this.onStartButtonClicked);
			this.addChild(playBtn);
		}
		
		private function onStartButtonClicked(e:TouchEvent):void
		{
			if (e.getTouch(this, TouchPhase.BEGAN))
				main.loadScreen("homescreen");
		}
	
	}

}