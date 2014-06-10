package screens.levels
{
	/**
	 * ...
	 * @author ...
	 */
	import starling.display.Image;
	import screens.levels.level_base
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class level_04 extends level_base
	{
		private var bg:Image;
		
		public function level_04(main:GameScreen)
		{
			super(main);
			initialize();
			addGauge();
			addMenuButton();
			setLevelName("level_04");
			afterInit();
		}
		
		/**
		 * Initializes the game by loading the background and the game
		 */
		private function initialize():void
		{
			bg = new Image(Assets.getTexture("Background"));
			addChild(bg);
			
			putfaces();
		}
		
		private function putfaces():void
		{
			var firstX:Number = 50;
			var firstY:Number = 50;
			
			for (var x:Number = 0; (((x * 90) + firstX < 480) && x < 4); x++)
			{
				for (var y:Number = 0; (((y * 90) + firstX < 320) && y < 3); y++)
				{
					setToCoords(makeResizedImg(createRandomFace(), 80, 80), (firstX + (x * 90)), (firstY + (y * 90)));
				}
			}
		}
		
		private function createRandomFace():Image
		{
			var randomValue:Number = Math.ceil(Math.random() * 7);
			var image:Image = new Image(Assets.getTexture("Face" + randomValue));
			if (randomValue < 5)
			{
				image.name = "Sick"
			}
			else
			{
				image.name = "Healthy"
			}
			image.addEventListener(TouchEvent.TOUCH, onFaceTouch);
			return image;
		}
		
		private function onFaceTouch(e:TouchEvent):void
		{
			if (e.getTouch(this, TouchPhase.BEGAN))
			{
				var face:Image = e.currentTarget as Image;
				if (face.name == "Sick")
				{
					removeChild(face);
				}
				if (face.name == "Healthy")
				{
					removeTicks(50);
				}
			}
		}
	}

}