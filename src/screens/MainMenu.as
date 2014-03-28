package screens
{
	/**
	 * ...
	 * @author Stefan
	 */
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class MainMenu extends Sprite
	{
		private var bg:Image;
		var game:Image;
		var firstGameToDisplay:Number = 1;
		
		public function MainMenu()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			drawScreen();
		}
		
		private function drawScreen():void
		{
			bg = new Image(Assets.getTexture("Background"));
			this.addChild(bg);
			
			putGame(1, new Image(Assets.getTexture("Game01")));
			
			putGame(2, new Image(Assets.getTexture("Game02")));
			
			putGame(3, new Image(Assets.getTexture("Game03")));
			
			putGame(4, new Image(Assets.getTexture("Game04")));
		}
		
		private function putGame(number:Number, game:Image)
		{
			if (number == 1) {
				game.x = 30;
				game.y = 30;
			}
			else if (number == 2) {
				game.x = 190;
				game.y = 30;
			}
			else if (number == 3) {
				game.x = 30;
				game.y = 190;
			}
			else if (number == 4) {
				game.x = 190;
				game.y = 190;
			}
			
			addChild(game);
		}
	}
}