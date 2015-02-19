package screens.levels
{
	/**
	 * ...
	 * @author Kati & Stefan
	 */
		
	// Import classes this script uses
	import flash.utils.Timer;
	import screens.levels.level_base;
	import screens.Menu;
	import starling.display.Image;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	
	public class level_06 extends level_base
	{
		private var bg:Image;
		private var healthyFacesArray:Array;
		private var sickFacesArray:Array;
		private var collisionTimer:Timer;
		private var victory:Boolean;
		private var paused:Boolean = false;
			
		public function level_06(main:GameScreen)
		{
			super(main);
			initialize(5, 5);
			addGauge();
			addMenuButton();
			setLevelName("level_06");
			addEventListener(Event.ENTER_FRAME, onNewFrame);
			afterInit();
		}
		
		private function initialize(sickFaces:Number, healthyFaces:Number):void
		{
			sickFacesArray = new Array();
			healthyFacesArray = new Array();
			
			bg = new Image(Assets.getTexture("Background"));
			bg = makeResizedImg(bg, 480, 320);
			bg.addEventListener(TouchEvent.TOUCH, gameStart)
			addChild(bg);
			
			startLevelMusic();
			
			for (var i:int = 0; i < sickFaces; i++)
			{
				var sickFace:SickFace = new SickFace(Assets.getTexture("SickFace"));
				sickFace.setCorrectness(false);
				addChild(sickFace);
				sickFacesArray.push(sickFace);
				sickFace.addEventListener(TouchEvent.TOUCH, choose)
				
				sickFace.x = Math.random() * 480;
				sickFace.y = Math.random() * 320;
				sickFace.width *= main.getScreenWidth() / 480
				sickFace.height *= main.getScreenHeight()/320
			}
			
			for (var j:int = 0; j < healthyFaces; j++)
			{
				var healthyFace:HealthyFace = new HealthyFace(Assets.getTexture("HealthyFace"));
				healthyFace.setCorrectness(true);
				addChild(healthyFace);
				healthyFacesArray.push(healthyFace);
				healthyFace.addEventListener(TouchEvent.TOUCH, choose)
				
				healthyFace.x = Math.random() * 480;
				healthyFace.y = Math.random() * 320;
				healthyFace.width *= main.getScreenWidth() / 480
				healthyFace.height *= main.getScreenHeight()/320
			}
			
			pauseGame();
		
		}
		
		private function pauseGame():void
		{
			for each (var healthyFace:Object in healthyFacesArray)
			{
				healthyFace.pause();
			}
			for each (var sickFace:Object in sickFacesArray)
			{
				sickFace.pause();
			}
			paused = true;
			pauseTimer();
		}
		
		private function continueGame():void
		{
			continueTimer();
			for each (var healthyFace:Object in healthyFacesArray)
			{
				healthyFace.unpause();
			}
			for each (var sickFace:Object in sickFacesArray)
			{
				sickFace.unpause();
			}
			paused = false;
		}
		
		private function onNewFrame(event:EnterFrameEvent):void
		{
			if (healthyFacesArray.length < 1 && !victory)
			{
				victory = true;
				pauseGame();
				var menu:Menu = new Menu(main, getTimer(), "Victory", calculateScore(10), getMusicChannel());
				addChild(menu);
				stopLevelMusic();
				this.removeEventListener(Event.ENTER_FRAME, onNewFrame)
			}
		}
		
		private function choose(event:TouchEvent):void
		{
			if (event.getTouch(this, TouchPhase.BEGAN))
			{
				if (sickFacesArray.indexOf(event.currentTarget) > 0)
				{
					removeTicks(50);
					playWrongSound();
					
				}
				else
				{
					healthyFacesArray.pop();
					playCorrectSound();
					removeChild(event.currentTarget as Image);
				}
			}
		}
		
		private function gameStart(event:TouchEvent):void
		{
			if (paused) {
				continueGame();
				bg.removeEventListeners();
			}
		}
		

	
	}

}