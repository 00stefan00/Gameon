package screens.levels
{
	/**
	 * ...
	 * @author ...
	 */
	
	import starling.display.Image;
	import screens.levels.level_base
	
	public class level_02 extends level_base
	{
		private var bg:Image;
		
		public function level_02(main:GameScreen)
		{
			super(main);
			initialize();
			addMenuButton();
		}
		
		private function initialize():void
		{
			bg = new Image(Assets.getTexture("Background"));
			addChild(bg);
		}
	
	}

}