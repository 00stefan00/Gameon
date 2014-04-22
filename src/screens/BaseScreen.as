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
		private var logo:Image;
		
		/**
		 * Constructor of the BaseScreen
		 * @param	main
		 */
		public function BaseScreen(main:GameScreen) 
		{
			super();
			this.main = main;
		}
		
		/**
		 * Disposes current screen and removes the logo, if present
		 */
		public function disposeScreen():void {
			if (getChildIndex(logo) != -1) {
				removeChild(logo);
			}
		}
	}

}