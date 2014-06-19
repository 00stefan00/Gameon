package screens.levels
{
	/**
	 * ...
	 * @author ...
	 */
	import starling.display.Image;
	import screens.levels.level_base
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import screens.Menu;
	
	public class level_08 extends level_base
	{
		private var bg:Image;

		
		public function level_08(main:GameScreen)
		{
			super(main);
			initialize();
			addGauge();
			addMenuButton();
			setLevelName("level_08");
			afterInit();
		}
		
		/**
		 * Initializes the game by loading the background and the game
		 */
		private function initialize():void
		{
			bg = new Image(Assets.getTexture("Background"));
			startLevelMusic();
			addChild(bg);
		}
		

	}

}