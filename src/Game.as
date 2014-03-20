package
{
	/**
	 * ...
	 * @author Stefan
	 */
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.display.DisplayObject;
	import starling.textures.Texture;
	import starling.display.Image; 
	
	
	
	public class Game extends Sprite
	{
		private var shroom:Bitmap = new Assets.Mushroom();
		var image:Image = Image.fromBitmap (shroom)
		
		public function Game()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
					
			
		}
		
		private function onAddedToStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, go);
			addChild(shroom);
		}
	
	}

}