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
		private var currentGame:Number;
		
		public function level_base()
		{
			initialize();
		}
		
		private function initialize():void
		{
			menuButton = new Image(Assets.getTexture("MenuIcon"));
			menuButton.x = 05;
			menuButton.y = 05;
			menuButton.addEventListener(TouchEvent.TOUCH, openMenu(currentGame))
			addChild(menuButton);
		}
		
		private function openMenu(currentGame:Number): Function
		{
			return function(e:TouchEvent):void
			{
				var menu:Menu = new Menu(currentGame);
				addChild(menu);
			}
		}
	}
}