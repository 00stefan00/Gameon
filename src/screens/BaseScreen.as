package screens 
{
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	
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