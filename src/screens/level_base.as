package screens
{
	/**
	 * ...
	 * @author ...
	 */
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	
	public class level_base extends Sprite
	{
		private var menuButton:Image;
		
		public function level_base()
		{
			initialize();
		}
		
		private function initialize():void
		{
			menuButton = new Image(Assets.getTexture("MenuIconGrey"));
			menuButton.x = 05;
			menuButton.y = 05;
			addChild(menuButton);
		}
	}

}