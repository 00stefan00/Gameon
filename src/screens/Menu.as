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
			// create a yellow background for the popup menu
			bg = new Image(Assets.getTexture("BgYellow"));
			
			setToCoords(bg, 50, 50);
			
			addButtons();
		}
	
		/**
		 * Increases value of the var that knows which game is the first one to display on the mainmenu
		 */
		private function addButtons():void
		{
			// Loads images from Assets
			redoBtn = new Image(Assets.getTexture("RedoIcon"));
			homeBtn = new Image(Assets.getTexture("HomeIcon"));
			muteBtn = new Image(Assets.getTexture("MuteIcon"));
			closeBtn = new Image(Assets.getTexture("CloseIcon"));
			nextBtn = new Image(Assets.getTexture("NextIcon"));
			
			// Puts images as buttons to coords
			setToCoords(redoBtn, 70, 210);
			setToCoords(homeBtn, 170, 210);
			setToCoords(muteBtn, 270, 210);
			setToCoords(nextBtn, 370, 210);
			setToCoords(closeBtn, bg.width + 35, 50)
			
			// Adds eventlisteners to the buttons
			redoBtn.addEventListener(TouchEvent.TOUCH, redo);
			homeBtn.addEventListener(TouchEvent.TOUCH, goHome);
			muteBtn.addEventListener(TouchEvent.TOUCH, mute);
			closeBtn.addEventListener(TouchEvent.TOUCH, goBack);
			nextBtn.addEventListener(TouchEvent.TOUCH, startNext);
		}
		
		/**
		 * Places image on coordinates X and Y
		 */
		private function setToCoords(img:Image, x:Number, y:Number):void
		{
			img.x = x;
			img.y = y;
			
			addChild(img);
		}
		
		
		/**
		 * returns to main menu
		 */
		private function goHome(e:TouchEvent):void
		{
			main.loadScreen("homescreen");
		}
		
		/**
		 * returns to where you came from, closes the menu
		 */
		private function goBack(e:TouchEvent):void
		{
			closeMenu()
		}
		
		/**
		 * Will restart the level that is running
		 */
		private function redo(e:TouchEvent):void
		{
			// not implemented yet
		}
		
		/**
		 * Continues to next level after completion
		 */
		private function startNext(e:TouchEvent):void
		{
			// not implemented yet
		}
		
		/**
		 * mutes the sound
		 */
		private function mute(e:TouchEvent):void
		{
			// not implemented yet
		}
		
		/**
		 * Removes menu from the screen
		 */
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