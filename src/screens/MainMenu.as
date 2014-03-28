package screens
{
	/**
	 * ...
	 * @author Stefan
	 */
	
	import flash.utils.Dictionary;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	
	public class MainMenu extends Sprite
	{
		private var bg:Image;
		var game:Image;
		var firstGameToDisplay:Number = 0;
		var gameDict:Dictionary = new Dictionary();
		
		public function MainMenu()
		{
			super();
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
		}
		
		private function putGame(number:Number, game:Image)
		{
			if (number == 0)
			{
				game.x = 30;
				game.y = 30;
			}
			else if (number == 1)
			{
				game.x = 190;
				game.y = 30;
			}
			else if (number == 2)
			{
				game.x = 30;
				game.y = 190;
			}
			else if (number == 3)
			{
				game.x = 190;
				game.y = 190;
			}
			
			game.addEventListener(TouchEvent.TOUCH, onGamePressed(number));
			addChild(game);
		}
		
		private function onGamePressed(number:Number):Function {
			return function(e:TouchEvent):void {
				var gameNumber:Number = number + firstGameToDisplay;
				removeChildren();
				addChild(gameDict[gameNumber]);
			}
		}
	}
}