package screens.levels
{
	/**
	 * ...
	 * @author Stefan
	 */
	import screens.levels.level_base;
	import screens.Menu;
	import starling.display.Image;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	
	public class level_04 extends level_base
	{
		private var bg:Image;
		private var hospital:Image;
		private var sickFaceArray:Array;
		private var healthyFaceArray:Array;
		private var score:Number = 0;
		
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
			bg = makeResizedImg(bg, 480, 320);
			addChild(bg);
			
			hospital = new Image(Assets.getTexture("HospitalT"));
			addChild(hospital);
			setToCoords(hospital, 300, 40
			);
			startLevelMusic();
			
			putfaces();
		}
		
		private function putfaces():void
		{
			removeFaces();
			var firstX:Number = 50;
			var firstY:Number = 50;
			sickFaceArray = new Array();
			healthyFaceArray = new Array();
			for (var x:Number = 0; (((x * 90) + firstX < 480) && x < 4); x++)
			{
				for (var y:Number = 0; (((y * 90) + firstX < 320) && y < 3); y++)
				{
					setToCoords(makeResizedImg(createRandomFace(), 80, 80), (firstX + (x * 90)), (firstY + (y * 90)));
				}
			}
		}
		
		private function removeFaces():void
		{
			for each (var healthyFace:Image in healthyFaceArray)
			{
				healthyFace.dispose();
				removeChild(healthyFace);
			}
			for each (var sickFace:Image in sickFaceArray)
			{
				sickFace.dispose();
				removeChild(sickFace);
			}
		}
		
		private function createRandomFace():Image
		{
			var randomValue:Number = Math.ceil(Math.random() * 7);
			var image:Image = new Image(Assets.getTexture("Face" + randomValue));
			if (randomValue < 5)
			{
				image.name = "Sick"
				sickFaceArray.push(image);
			}
			else
			{
				image.name = "Healthy"
				healthyFaceArray.push(image);
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
					face.dispose();
					removeChild(face);
					sickFaceArray.pop();
					playCorrectSound();
					score++;
				}
				else if (face.name == "Healthy")
				{
					removeTicks(50);
					playWrongSound();
				}
				
				if (score == 18)
				{
					pauseTimer();
					var menu:Menu = new Menu(main, getTimer(), "Victory", calculateScore(50), getMusicChannel());
					addChild(menu);
					stopLevelMusic();
				}
				else if (sickFaceArray.length < 1)
				{
					putfaces();
				}
				
			}
		
		}
	
	}

}