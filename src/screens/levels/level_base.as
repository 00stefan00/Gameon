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
		
		/**
		 * Adds a button that will open a menu when clicked
		 */
		public function addMenuButton():void
		{
			menuButton = new Image(Assets.getTexture("MenuIcon"));
			menuButton.x = 05;
			menuButton.y = 05;
			menuButton.addEventListener(TouchEvent.TOUCH, openMenu(currentGame))
			addChild(menuButton);
		}
		
		/**
		 * opens the Menu
		 */
		private function openMenu(currentGame:Number):Function
		{
			return function(e:TouchEvent):void
			{
				var menu:Menu = new Menu(main);
				addChild(menu);
			}
		}
		
		/**
		 * Places image on coordinates X and Y
		 */
		public function setToCoords(img:Image, x:Number, y:Number):void
		{
			img.x = x;
			img.y = y;
			
			addChild(img);
		}
		
		public function makeResizedImg(img:Image, width:Number, height:Number):Image
		{
			img.width = width;
			img.height = height;
			
			return img;
		}
	
	}
}