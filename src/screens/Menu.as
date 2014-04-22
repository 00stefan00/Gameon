package screens
{
	import starling.display.DisplayObjectContainer;
	import starling.display.Sprite;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Menu extends Sprite
	{
		
		private var bg:Image;
		
		private var homeBtn:Image;
		private var redoBtn:Image;
		private var muteBtn:Image;
		private var closeBtn:Image;
		private var nextBtn:Image;
		
		private var imgArray:Array;
		
		private var mainMenu:HomeScreen;
		import starling.events.TouchEvent;
		
		public function Menu(gameNumber:Number)
		{
			initialize();			
		}
		
		private function initialize():void
		{
			imgArray = new Array();
			
			bg = new Image(Assets.getTexture("BgYellow"));
						
			setToCoords(bg, 50, 50);
			
			addButtons();
		}
		
		private function addButtons():void
		{
			redoBtn = new Image(Assets.getTexture("RedoIcon"));
			homeBtn = new Image(Assets.getTexture("HomeIcon"));
			muteBtn = new Image(Assets.getTexture("MuteIcon"));
			closeBtn = new Image(Assets.getTexture("CloseIcon"));
			nextBtn = new Image(Assets.getTexture("NextIcon"));
						
			setToCoords(redoBtn, 80, 210);
			setToCoords(homeBtn, 180, 210);
			setToCoords(muteBtn, 280, 210);
			setToCoords(nextBtn, 380, 210);
			setToCoords(closeBtn, bg.width + 35, 50)
			
			closeBtn.addEventListener(TouchEvent.TOUCH, goBack)
			homeBtn.addEventListener(TouchEvent.TOUCH, goHome)
		}
		
		private function setToCoords(img:Image, x:Number, y:Number): void
		{
			img.x = x;
			img.y = y;		
			
			addChild(img);
			
			imgArray.push(img);
		}
		
		private function goHome(e:TouchEvent):void
		{
			this.removeChildren();
			mainMenu = new HomeScreen();
			this.addChild(mainMenu);
		}
		
		private function goBack(e:TouchEvent):void
		{
			while(imgArray.length > 0)
			{
				this.removeChild(imgArray.pop());	
			}
			
		}
	}

}