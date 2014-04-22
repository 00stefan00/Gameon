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
			
			putGames();
			
			placeArrows()
			
			character = new Image(Assets.getTexture("Character"));
			character.x = 370
			character.y = 130
			this.addChild(character);
		}
		
		private function placeArrows():void
		{
			if (firstGameToDisplay < 8)
			{
				arrow = new Image(Assets.getTexture("ArrowRight"));
				arrow.x = 315;
				arrow.y = 105;
				this.addChild(arrow);
				arrow.addEventListener(TouchEvent.TOUCH, onArrowRight)
			}
			if (firstGameToDisplay > 3)
			{
				arrow = new Image(Assets.getTexture("ArrowLeft"));
				arrow.x = 1;
				arrow.y = 105;
				this.addChild(arrow);
				arrow.addEventListener(TouchEvent.TOUCH, onArrowLeft)
			}
		
		}
		
		private function onArrowRight(e:TouchEvent):void
		{
			firstGameToDisplay += 4;
		}
		
		private function onArrowLeft(e:TouchEvent):void
		{
			firstGameToDisplay -= 4;
		}
		
		
		private function putGames():void
		{
			putGame(0, gameDict[0 + firstGameToDisplay]);
			putGame(1, gameDict[1 + firstGameToDisplay]);
			putGame(2, gameDict[2 + firstGameToDisplay]);
			putGame(3, gameDict[3 + firstGameToDisplay]);
		}
		
		private function putGame(number:Number, miniGame:Image):void
		{
			if (number == 0)
			{
				miniGame.x = 50;
				miniGame.y = 30;
			}
			else if (number == 1)
			{
				miniGame.x = 210;
				miniGame.y = 30;
			}
			else if (number == 2)
			{
				miniGame.x = 50;
				miniGame.y = 190;
			}
			else if (number == 3)
			{
				miniGame.x = 210;
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
				
				getLevelByNumber(gameNumber);
			}
		}
		
		private function getLevelByNumber(gameNumber:Number):void
		{
			if (gameNumber < 10)
				main.loadScreen("level_0" + gameNumber);
			else
				main.loadScreen("level_" + gameNumber);
		}
		
		public function removeGame(level:DisplayObjectContainer):void
		{
			removeChild(level);
		}
	}
}