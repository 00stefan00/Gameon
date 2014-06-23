package screens
{
	import flash.utils.Timer;
	import screens.levels.level_base;
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
		private var confirmBtn:Image;
		private var menuText:Image;
		
		private var mainMenu:HomeScreen;
		private var myTimer:Timer;
		private var gameState:String;
		private var score:Number;
		import starling.events.TouchPhase;
		
		public function Menu(main:GameScreen, myTimer:Timer, gameState:String, score:Number = 0)
		{
			super(main);
			this.myTimer = myTimer;
			this.gameState = gameState;
			this.score = score;
			initialize();
		}
		
		private function initialize():void
		{
			// create a yellow background for the popup menu
			bg = new Image(Assets.getTexture("InfoBg"));
			
			setToCoords(bg, 15, 15);
			
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
			closeBtn.name = "CloseBtn";
			
			// Puts images as buttons to coords
			setToCoords(redoBtn, 55, 225);
			setToCoords(homeBtn, 160, 225);
			setToCoords(muteBtn, 265, 225);
			setToCoords(nextBtn, 370, 225);
			setToCoords(closeBtn, bg.width - 30, 25)
			
			// Adds eventlisteners to the buttons
			redoBtn.addEventListener(TouchEvent.TOUCH, redo);
			homeBtn.addEventListener(TouchEvent.TOUCH, goHome);
			muteBtn.addEventListener(TouchEvent.TOUCH, mute);
			closeBtn.addEventListener(TouchEvent.TOUCH, goBack);
			nextBtn.addEventListener(TouchEvent.TOUCH, startNext);
			
			if (gameState == "Victory")
			{
				initializeVictory();
			}
			
			if (gameState == "Start")
			{
				addIntroText();
			}
			if (gameState == "Lose")
			{
				addLoseText();
			}
		}
		
		private function initializeVictory():void
		{
			var numberOfHearts:Number = score;
			removeChild(closeBtn);
			
			for (var i:Number = 60; (i < 390 && numberOfHearts > 0); i += 75)
			{
				setToCoords(new Image(Assets.getTexture("TinyHeart")), i, 25);
				numberOfHearts--;
			}
		
			var level:String = main.getCurrentScreenName().split("_")[1];
			menuText = new Image(Assets.getTexture("Text"+level+"e"));
			setToCoords(menuText, (480 / 2) - (menuText.width / 2), 110)
			main.setLevelScore(new Number(level), score);
		}
	
		private function addIntroText():void {
			var level:String = main.getCurrentScreenName().split("_")[1];
			menuText = new Image(Assets.getTexture("Text"+level+"s"));
			setToCoords(menuText, (480 / 2) - (menuText.width / 2), 110);
			
			redoBtn.dispose();
			removeChild(redoBtn);
			closeBtn.dispose();
			removeChild(closeBtn);
			nextBtn.dispose()
			removeChild(nextBtn);
			
			confirmBtn = new Image(Assets.getTexture("Confirm"));
			confirmBtn.addEventListener(TouchEvent.TOUCH, goBack);
			setToCoords(confirmBtn, 55, 225);			
		}
		
		private function addLoseText():void {
			menuText = new Image(Assets.getTexture("GameOver"));
			setToCoords(menuText, 40, 110);

			closeBtn.dispose();
			removeChild(closeBtn);
			
		
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
		
		private function goHome(e:TouchEvent):void
		{
			if (e.getTouch(this, TouchPhase.BEGAN))
				main.loadScreen("homescreen");
		}
		
		/**
		 * returns to where you came from, closes the menu
		 */
		private function goBack(e:TouchEvent):void
		{
			if (e.getTouch(this, TouchPhase.BEGAN))
				closeMenu()
		}
		
		private function redo(e:TouchEvent):void
		{
			if (e.getTouch(this, TouchPhase.BEGAN))
				main.loadScreen(main.getCurrentScreenName());
		}
		
		private function startNext(e:TouchEvent):void
		{
			if (e.getTouch(this, TouchPhase.BEGAN))
			{
				if (main.getCurrentScreenName() != "level_08")
				{
					var level:String = main.getCurrentScreenName() as String;
					var number:Number = Number(level.charAt(7).toString()) as Number;
					
					number++;
					closeMenu();
					main.loadScreen("level_0" + number);
				}
			}
		}
		
		private function mute(e:TouchEvent):void
		{
			if (e.getTouch(this, TouchPhase.BEGAN))
			{
			}
		}
		
		/**
		 * Removes menu from the screen
		 */
		private function closeMenu():void
		{
			if (gameState != "Victory")
			{
				this.dispose();
				this.removeChildren();
				myTimer.start();
			}
		}
	
	}
}