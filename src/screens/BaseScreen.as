package screens 
{
	/**
	 * ...
	 * @author Stefan
	 */
	import starling.display.Sprite;
	
	public class BaseScreen extends Sprite 
	{
		protected var main:GameScreen;
		
		/**
		 * Constructor of the BaseScreen
		 * @param	main
		 */
		public function BaseScreen(main:GameScreen) 
		{
			super();
			this.main = main;
		}
	}

}