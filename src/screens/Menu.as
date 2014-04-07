package screens
{
	import starling.display.Sprite;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Menu extends Sprite
	{
		
		private var bg:Image;
		private var index:Array;
		private var homeBtn:Image;
		private var backBtn:Image;
		private var mainMenu:HomeScreen;
		import starling.events.TouchEvent;
		
		public function Menu(gameNumber:Number)
		{
			initialize();
			index = new Array();
		}
		
		private function initialize():void
		{
			bg = new Image(Assets.getTexture("BgYellow"));
			bg.x = 50;
			bg.y = 50;
			addChild(bg);
			
			addButtons();
		}
		
		private function addButtons():void
		{
			backBtn = new Image(Assets.getTexture("Back"));
			homeBtn = new Image(Assets.getTexture("Home"));
			
			
			setCoords(backBtn, 80, 210);
			setCoords(homeBtn, 180, 210);
			backBtn.addEventListener(TouchEvent.TOUCH, goBack)
			backBtn.addEventListener(TouchEvent.TOUCH, goHome)
			
			addChild(homeBtn);
			addChild(backBtn);
		}
		
		private function setCoords(img:Image, x:Number, y:Number): void
		{
			img.x = x;
			img.y = y;
			
		}
		
		private function goHome(e:TouchEvent):void
		{
			this.removeChildren();
			mainMenu = new HomeScreen();
			this.addChild(mainMenu);
		}
		
		private function goBack(e:TouchEvent):void
		{
			for each (var value:Number in index)
			{
				this.removeChildAt(value);
			}
		}
		
		public function setIndex(index:Number):void
		{
			this.index.push(index);
		}
	}

}