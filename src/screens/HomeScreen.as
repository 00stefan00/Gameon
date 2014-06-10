package screens
{
	/**
	 * ...
	 * @author Stefan
	 */
	import flash.media.Sound;
	import screens.levels.*;
	import flash.utils.Dictionary;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import flash.media.SoundChannel;
	
	public class HomeScreen extends BaseScreen
	{
		
		private var arrow:Image;
		private var bg:Image;
		private var character:Image;
		private var firstGameToDisplay:Number = 0;
		private var miniGame:Image;
		private var gameDict:Dictionary = new Dictionary();
		private var heart_sprite:Heart;
		private var bgmusic:Sound;
		private var bgChannel:SoundChannel; 
		
		public function HomeScreen(main:GameScreen)
		{
			super(main);
			initGameButtons();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function initGameButtons():void
		{
			gameDict[0] = new Image(Assets.getTexture("Level00"));
			gameDict[1] = new Image(Assets.getTexture("Level01"));
			gameDict[2] = new Image(Assets.getTexture("Level02"));
			gameDict[3] = new Image(Assets.getTexture("Level03"));
			gameDict[4] = new Image(Assets.getTexture("Level04"));
			gameDict[5] = new Image(Assets.getTexture("Level05"));
			gameDict[6] = new Image(Assets.getTexture("Level06"));
			gameDict[7] = new Image(Assets.getTexture("Level07"));
		}
		
		private function onAddedToStage(event:Event):void
		{
			drawScreen();
		}
		
		private function drawScreen():void
		{ //place background on screen
			bg = new Image(Assets.getTexture("Background"));
			this.addChild(bg);
			
			putGames();
			
			placeArrows()
			
			heart_sprite = new Heart();
			heart_sprite.x = 100;
			heart_sprite.y = 100;
			heart_sprite.play();
			
			character = new Image(Assets.getTexture("SickBoy"));
			character.x = 350
			character.y = 160
			
			this.addChild(character);
			
			startBackgroundMusic();
		}
		
		private function startBackgroundMusic():void {
			bgmusic = AudioSources.getSound("BGMusic");
			bgChannel = bgmusic.play(0, 100);
		}
		
		
		private function placeArrows():void
		{
			removeChild(getChildByName("arrow_right"));
			removeChild(getChildByName("arrow_left"));
			// checks if there are more levels that can be scrolled to with arrow buttons. If there are place arrow to the right.
			if (firstGameToDisplay < 8)
			{
				arrow = new Image(Assets.getTexture("ArrowRight"));
				arrow.name = "arrow_right";
				arrow.x = 315;
				arrow.y = 105;
				this.addChild(arrow);
				arrow.addEventListener(TouchEvent.TOUCH, onArrowRight)
			}
			// checks if there are previous levels that can be scrolled to with arrow buttons. If there are place arrow to the left.
			if (firstGameToDisplay > 3)
			{
				arrow = new Image(Assets.getTexture("ArrowLeft"));
				arrow.name = "arrow_left"
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
			if (e.getTouch(this, TouchPhase.BEGAN))
			{
				removeGames();
				firstGameToDisplay += 4;
				placeArrows();
				putGames();
			}
		}
		
		/**
		 * Decreases value of the var that knows which game is the first one to display on the mainmenu
		 */
		private function onArrowLeft(e:TouchEvent):void
		{
			if (e.getTouch(this, TouchPhase.BEGAN))
			{
				removeGames();
				firstGameToDisplay -= 4;
				placeArrows();				
				putGames();
			}
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
		
		private function removeGames():void
		{
			removeChild(gameDict[0 + firstGameToDisplay]);
			removeChild(gameDict[1 + firstGameToDisplay]);
			removeChild(gameDict[2 + firstGameToDisplay]);
			removeChild(gameDict[3 + firstGameToDisplay]);
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
			if (miniGame == null)
				return
				
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
				if (e.getTouch(e.currentTarget as Image, TouchPhase.BEGAN))
				{
					var gameNumber:Number = number + firstGameToDisplay;
					
					getLevelByNumber(gameNumber);
				}
			}
		}
		
		/**
		 * Loads a lvl by the number given
		 */
		private function getLevelByNumber(gameNumber:Number):void
		{
			bgChannel.stop();
			if (gameNumber < 10)
				main.loadScreen("level_0" + gameNumber);
			else
				main.loadScreen("level_" + gameNumber);
		}
	}
}