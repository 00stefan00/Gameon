package screens.levels
{
	// Import classes this script uses
	import screens.levels.level_base;
	import starling.display.Image;
	import starling.events.TouchEvent;
	
	/**
	 * The document class defining the behaviour of the program.
	 */
	public class level_02 extends level_base
	{
		private var faces:Array;
		
		/**
		 * This is the constructor. Executed once when the program starts
		 *
		 */
		public function level_02(main:GameScreen)
		{
			super(main);
			addGauge();
			addMenuButton();
			faces = new Array();
			//lets create some sick faces
			for (var i:int = 0; i < 5; i++)
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
			for (var j:int = 0; j < 5; j++)
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
			
			if (faces.indexOf(event.currentTarget) > -0.1)
			{
				removeChild(event.currentTarget as Image);
				
			}
			else
			{
				trace("healthy")
			}
		}
	
	}
}