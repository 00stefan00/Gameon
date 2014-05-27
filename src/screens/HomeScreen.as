package screens
{
	/**
	 * ...
	 * @author Stefan
	 */
	import screens.levels.*;
	import flash.utils.Dictionary;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.display.DisplayObjectContainer;
	
	public class HomeScreen extends BaseScreen
	{
		private var arrow:Image;
		private var bg:Image;
		private var character:Image;
		private var firstGameToDisplay:Number = 0;
		private var miniGame:Image;
		private var gameDict:Dictionary = new Dictionary();
		
		public function HomeScreen(main:GameScreen)
		{
			super(main);
			initGameButtons();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function initGameButtons():void
		{
			// Put all gameIcons in a dict
			gameDict[0] = new Image(Assets.getTexture("LevelPlaceHolder"));
			gameDict[1] = new Image(Assets.getTexture("LevelPlaceHolder"));
			gameDict[2] = new Image(Assets.getTexture("LevelPlaceHolder"));
			gameDict[3] = new Image(Assets.getTexture("LevelPlaceHolder"));
		}
		
		private function onAddedToStage(event:Event):void
		{
			drawScreen();
		}
		
		private function drawScreen():void
		{	//place background on screen
			bg = new Image(Assets.getTexture("MainBackground"));
			this.addChild(bg);
			
			putGames();
			
			placeArrows()
			
			//place character on screen
			character = new Image(Assets.getTexture("SickBoy"));
			character.x = 350
			character.y = 160
			
			this.addChild(character);
		}
		
		private function placeArrows():void
		{
			// checks if there are more levels that can be scrolled to with arrow buttons. If there are place arrow to the right.
			if (firstGameToDisplay < 8)
			{
				arrow = new Image(Assets.getTexture("ArrowRight"));
				arrow.x = 315;
				arrow.y = 105;
				this.addChild(arrow);
				arrow.addEventListener(TouchEvent.TOUCH, onArrowRight)
			}
			// checks if there are previous levels that can be scrolled to with arrow buttons. If there are place arrow to the left.
			if (firstGameToDisplay > 3)
			{
				arrow = new Image(Assets.getTexture("ArrowLeft"));
				arrow.x = 1;
				arrow.y = 105;
				this.addChild(arrow);
				arrow.addEventListener(TouchEvent.TOUCH, onArrowLeft)
			}
		
		}
		
		/**
		 * Increases value of the var that knows which game is the first one to display on the mainmenu
		 */
		private function onArrowRight(e:TouchEvent):void
		{
			//firstGameToDisplay += 4;
		}
		
		/**
		 * Decreases value of the var that knows which game is the first one to display on the mainmenu
		 */
		private function onArrowLeft(e:TouchEvent):void
		{
			//firstGameToDisplay -= 4;
		}
		
		/**
		 * Puts all gameIcons on the screen
		 */
		private function putGames():void
		{
			putGame(0, gameDict[0 + firstGameToDisplay]);
			putGame(1, gameDict[1 + firstGameToDisplay]);
			putGame(2, gameDict[2 + firstGameToDisplay]);
			putGame(3, gameDict[3 + firstGameToDisplay]);
		}
		
		/**
		 * puts a icon on the selected position on the screen.
		 * There are 4 positions numbering from 0 tot 3.
		 * 
		 *  0 1 
		 *  2 3 
		 */
		private function putGame(number:Number, miniGame:Image):void
		{
			if (number == 0)
			{
				miniGame.x = 50;
				miniGame.y = 30;
			}
			else if (number == 1)
			{
				miniGame.x = 190;
				miniGame.y = 30;
			}
			else if (number == 2)
			{
				miniGame.x = 50;
				miniGame.y = 190;
			}
			else if (number == 3)
			{
				miniGame.x = 190;
				miniGame.y = 190;
			}
			
			miniGame.addEventListener(TouchEvent.TOUCH, onGamePressed(number));
			addChild(miniGame);
		}
		
		/**
		 * Launches the gamescreen that is associated with the icon clicked. 
		 * The dict is used to retrieve it.
		 */
		private function onGamePressed(number:Number):Function
		{
			return function(e:TouchEvent):void
			{
				var gameNumber:Number = number + firstGameToDisplay;
				removeChildren();
				addChild(gameDict[gameNumber]);
				
				getLevelByNumber(gameNumber);
			}
		}
		
		/**
		 * Loads a lvl by the number given
		 */
		private function getLevelByNumber(gameNumber:Number):void
		{
			if (gameNumber < 10)
				main.loadScreen("level_0" + gameNumber);
			else
				main.loadScreen("level_" + gameNumber);
		}
	}
}