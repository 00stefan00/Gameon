package screens.levels
{
	/**
	 * ...
	 * @author ...
	 */
	import starling.display.Image;
	import screens.levels.level_base
	
	public class level_07 extends level_base
	{
		private var bg:Image;

		public function level_07(main:GameScreen)
		{			
			super(main);
			initialize();
			addGauge();
			addMenuButton();
			setLevelName("level_07");
			afterInit();
	
		}
		/**
		 * Initializes the game by loading the background and the game
		 */
		private function initialize():void
		{
			bg = new Image(Assets.getTexture("Background"));
			addChild(bg);
		}
	}

}