package
{
	/**
	 * ...
	 * @author Stefan
	 */
	import flash.display.Sprite;
	
	import starling.core.Starling;
	
	[SWF(width="480",height="3200",frameRate="60",backgroundColor="#ffffff")]
	
	public class Startup extends Sprite
	{
		private var myStarling:Starling;
		
		public function Startup()
		{
			// initialize Starling
			myStarling = new Starling(GameScreen, stage);
			myStarling.antiAliasing = 1;
			myStarling.start();
		}
		
	}

}