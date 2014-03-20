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
	
	public class Welcome extends Sprite
	{
		private var bg:Image;
		
		private var playBtn:Button;
		
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
			bg = new Image(Assets.getTexture("Mushroom"));
			this.addChild(bg);
			
			playBtn = new Button(Assets.getTexture("PlayBtn"));
			playBtn.x = 100;
			playBtn.y = 100;
			this.addChild(playBtn);
			
		}
	
	}

}