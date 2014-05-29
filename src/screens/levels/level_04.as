package screens.levels
{
	/**
	 * ...
	 * @author ...
	 */
	import starling.display.Image;
	import screens.levels.level_base
	
	public class level_04 extends level_base
	{
		private var bg:Image;

		public function level_04(main:GameScreen)
		{			
			super(main);
			initialize();
			addGauge();
			addMenuButton();
			setLevelName("level_04");
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