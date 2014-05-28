package screens.levels
{
	// Import classes this script uses
	import flash.utils.Timer;
	import screens.levels.level_base;
	import starling.display.Image;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	/**
	 * The document class defining the behaviour of the program.
	 */
	public class level_06 extends level_base
	{
		private var bg:Image;
		private var faces:Array;
		private var collisionTimer:Timer;
		
		/**
		 * This is the constructor. Executed once when the program starts
		 *
		 */
		public function level_06(main:GameScreen)
		{
			super(main);
			initialize(5, 5);
			addGauge();
			addMenuButton();
			startGauge();
			setLevelName("level_02");
		}
		
		/**
		 * Initializes the game by loading the background and the game
		 */
		private function initialize(sickFaces:Number, healthyFaces:Number):void
		{
			faces = new Array();
			//create the background
			bg = new Image(Assets.getTexture("Background"));
			addChild(bg);
			//lets create some sick faces
			for (var i:int = 0; i < sickFaces; i++)
			{
				var sickFace:SickFace = new SickFace(Assets.getTexture("SickFace"));
				sickFace.setCorrectness(false);
				addChild(sickFace);
				faces.push(sickFace);
				sickFace.addEventListener(TouchEvent.TOUCH, choose)
				
				//Math.random() generates a number between 0 and 1
				// when multiplied with f.ex. 480 it results in a numrber between 0 and 840
				sickFace.x = Math.random() * 480;
				sickFace.y = Math.random() * 320;
			}
			
			//Here we create some healthy faces
			for (var j:int = 0; j < healthyFaces; j++)
			{
				var healthyFace:HealthyFace = new HealthyFace(Assets.getTexture("HealthyFace"));
				healthyFace.setCorrectness(true);
				addChild(healthyFace);
				healthyFace.addEventListener(TouchEvent.TOUCH, choose)
				
				healthyFace.x = Math.random() * 480;
				healthyFace.y = Math.random() * 320;
			}
		
		}
		
		private function choose(event:TouchEvent):void
		{
			if (event.getTouch(this, TouchPhase.BEGAN))
			{
				
				if (faces.indexOf(event.currentTarget) > -0.1)
				{
					removeTicks(25);
					
				}
				else
				{
					removeChild(event.currentTarget as Image);
				}
			}
		}
	
	}
}