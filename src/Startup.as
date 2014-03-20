package
{
	/**
	 * ...
	 * @author Stefan
	 */
	import flash.display.Sprite;
	
	import starling.core.Starling;
	
	[SWF(width="320",height="480",frameRate="60",backgroundColor="#ffffff")]
	
	public class Startup extends Sprite
	{
		private var myStarling:Starling;
		
		public function Startup()
		{
			trace("starling framework initialized?");
			myStarling = new Starling(Game, stage);
			myStarling.antiAliasing = 1;
			myStarling.start();
		}
		
	}

}