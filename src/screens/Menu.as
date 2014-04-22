package screens
{
	import starling.display.Sprite;
	import starling.display.Image;
	
	import starling.events.TouchEvent;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Menu extends BaseScreen
	{
		private var bg:Image;
		private var homeBtn:Image;
		private var redoBtn:Image;
		private var muteBtn:Image;
		private var closeBtn:Image;
		private var nextBtn:Image;
		
		private var mainMenu:HomeScreen;
		
		public function Menu(main:GameScreen)
		{
			super(main);
			initialize();
		}
		
		private function initialize():void
		{
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
			
			redoBtn.addEventListener(TouchEvent.TOUCH, redo);
			homeBtn.addEventListener(TouchEvent.TOUCH, goHome);
			muteBtn.addEventListener(TouchEvent.TOUCH, mute);
			closeBtn.addEventListener(TouchEvent.TOUCH, goBack);
			nextBtn.addEventListener(TouchEvent.TOUCH, startNext);
		}
		
		private function setToCoords(img:Image, x:Number, y:Number):void
		{
			img.x = x;
			img.y = y;
			
			addChild(img);
		}
		
		private function goHome(e:TouchEvent):void
		{
			main.loadScreen("homescreen");
		}
		
		private function goBack(e:TouchEvent):void
		{
			closeMenu()
		}
		
		private function redo(e:TouchEvent):void
		{
		
		}
		
		private function startNext(e:TouchEvent):void
		{
		
		}
		
		private function mute(e:TouchEvent):void
		{
		
		}
		
		private function closeMenu():void
		{
			this.removeChild(redoBtn);
			this.removeChild(homeBtn);
			this.removeChild(muteBtn);
			this.removeChild(closeBtn);
			this.removeChild(nextBtn);
			this.removeChild(bg);
		}
	}

}