package screens
{
	/**
	 * ...
	 * @author Stefan
	 */
	
	import flash.utils.Dictionary;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.display.DisplayObjectContainer;
	
	public class HomeScreen extends BaseScreen
	{		
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
			gameDict[0] = new Image(Assets.getTexture("Game01"));
			gameDict[1] = new Image(Assets.getTexture("Game02"));
			gameDict[2] = new Image(Assets.getTexture("Game03"));
			gameDict[3] = new Image(Assets.getTexture("Game04"));
		}
		
		private function onAddedToStage(event:Event):void
		{
			drawScreen();
		}
		
		private function drawScreen():void
		{
			bg = new Image(Assets.getTexture("Background"));
			this.addChild(bg);
			
			putGame(0, gameDict[0]);
			
			putGame(1, gameDict[1]);
			
			putGame(2, gameDict[2]);
			
			putGame(3, gameDict[3]);
			
			character = new Image(Assets.getTexture("Character"));
			character.x = 350
			character.y = 130
			this.addChild(character);
		}
		
		private function putGame(number:Number, miniGame:Image):void
		{
			if (number == 0)
			{
				miniGame.x = 30;
				miniGame.y = 30;
			}
			else if (number == 1)
			{
				miniGame.x = 190;
				miniGame.y = 30;
			}
			else if (number == 2)
			{
				miniGame.x = 30;
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
		
		private function onGamePressed(number:Number):Function
		{
			return function(e:TouchEvent):void
			{
				var gameNumber:Number = number + firstGameToDisplay;
				removeChildren();
				addChild(gameDict[gameNumber]);
				
				addChild(getLevelByNumber(gameNumber));
			}
		}
		
		private function getLevelByNumber(gameNumber:Number):DisplayObject
		{
			if (gameNumber == 0)
				return new level_00(main);
			else if (gameNumber == 1)
				return new level_01(main);
			else if (gameNumber == 2)
				return new level_02(main);
			else if (gameNumber == 3)
				return new level_03(main);
			
			return null
		}
		
		public function removeGame(level:DisplayObjectContainer):void
		{
			removeChild(level);
		}
	}
}