package screens.levels
{
	/**
	 * ...
	 * @author ...
	 */
	import starling.display.Image;
	import screens.levels.level_base
	
	public class level_03 extends level_base
	{
		private var bg:Image;
		
		public function level_03(main:GameScreen)
		{			
			super(main);
			initialize();
			addMenuButton();
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