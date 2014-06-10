package screens.levels 
{
	/**
	 * ...
	 * @author Kati
	 */
	
	import starling.events.Event;
	import starling.display.Image;
	import starling.textures.Texture;
	 
	public class Door extends Image
	{
		
		private var isCorrect:Boolean;
		
		public function Door(tex:Texture) 
		{
			super(tex);
			
		}
		
		public function getCorrectness():Boolean
		{
			return isCorrect;
		}
		
		public function setCorrectness(value:Boolean):void
		{
			isCorrect = value;
		}
		
	}

}