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
	import screens.Menu;
	
	import flash.media.Sound;
	import flash.media.SoundChannel;
	
	public class level_04 extends level_base
	{
		private var bg:Image;
		private var hospital:Image;
		private var sickFaceArray:Array;
		private var healthyFaceArray:Array;
		private var score:Number = 0;
		
		private var lvlmusic:Sound;
		private var correct:Sound;
		private var wrong:Sound;
		private var lvlChannel:SoundChannel; 
		
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
			
			hospital = new Image(Assets.getTexture("HospitalT"));
			addChild(hospital);
			setToCoords(hospital, 300, 40
			);
			correct = AudioSources.getSound("Correct");
			wrong = AudioSources.getSound("Wrong");
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
		
		private function removeFaces():void {
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
			var randomValue:Number = Math.ceil(Math.random() * 6);
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
					correct.play(0,1);
					score++;
				}
				if (face.name == "Healthy")
				{
					removeTicks(50);
					wrong.play(0,1);
				}
				if (score == 18) {
					pauseTimer();
					var menu:Menu = new Menu(main, getTimer(), "Victory", calculateScore(50));
					addChild(menu);
					lvlChannel.stop();
				}
			}
			
			if (sickFaceArray.length < 1) {
				putfaces();
			}
		
		}
		
		/**
		 * SOUNDS
		 */
		private function startLevelMusic():void 
		{
			lvlmusic = AudioSources.getSound("LvlMusic");
			lvlChannel = lvlmusic.play(0, 1000);
		}
	}

}