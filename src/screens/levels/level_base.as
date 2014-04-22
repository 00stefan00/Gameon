package screens.levels
{
	/**
	 * ...
	 * @author ...
	 */
	import screens.BaseScreen;
	import screens.Menu;
	import starling.display.DisplayObjectContainer;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	
	public class level_base extends BaseScreen
	{
		private var menuButton:Image;
		private var currentGame:Number;
		
		public function level_base(main:GameScreen)
		{
			super(main);
			initialize();
		}
		
		private function initialize():void
		{
		
		}
		
		private function openMenu(currentGame:Number):Function
		{
			return function(e:TouchEvent):void
			{
				var menu:Menu = new Menu(main);
				addChild(menu);
			}
		}
		
		public function addMenuButton():void
		{
			menuButton = new Image(Assets.getTexture("MenuIcon"));
			menuButton.x = 05;
			menuButton.y = 05;
			menuButton.addEventListener(TouchEvent.TOUCH, openMenu(currentGame))
			addChild(menuButton);
		}
	
	}
}