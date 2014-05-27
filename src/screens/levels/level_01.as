package screens.levels
{
	/**
	 * ...
	 * @author ...
	 */
	import starling.display.Image;
	import screens.levels.level_base
	
	public class level_01 extends level_base
	{
		private var bg:Image;
		private var bed1:Image;
		private var bed2:Image;
		private var bed3:Image;
		private var bed4:Image;
		private var bed5:Image;
		
		public function level_01(main:GameScreen)
		{
			super(main);
			initialize();
			addGauge();
			addMenuButton();
			setLevelName("level_01");
		}
		
		/**
		 * Initializes the game by loading the background and the game
		 */
		private function initialize():void
		{
			bg = new Image(Assets.getTexture("Background"));
			addChild(bg);
			
			placeBeds();
		}
		
		private function placeBeds():void
		{
			setToCoords(getRandomBed(), 32, 150);
			setToCoords(getRandomBed(), 144, 150);
			setToCoords(getRandomBed(), 256, 150);
			setToCoords(getRandomBed(), 368, 150);
		}
		
		private function getRandomBed():Image
		{
			return new Image(Assets.getTexture("Bed" + Math.ceil(Math.random() * 5)));
		
		}
	
	}

}