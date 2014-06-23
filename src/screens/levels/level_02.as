package screens.levels
{
	/**
	 * ...
	 * @author ...
	 */
	import starling.display.Image;
	import screens.levels.level_base;
	import screens.Menu;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class level_02 extends level_base
	{
		private var bg:Image;
		private var lvlmusic:Sound;
		private var correct:Sound;
		private var wrong:Sound;
		private var lvlChannel:SoundChannel; 
		private var funArray:Array;
		private var boringArray:Array;
		private var score:Number = 0;
		
			
		
		public function level_02(main:GameScreen)
		{
			super(main);
			initialize();
			addGauge();
			addMenuButton();
			setLevelName("level_02");
			afterInit();
			
		}
		
		/**
		 * Initializes the game by loading the background and the game
		 */
		private function initialize():void
		{
			bg = new Image(Assets.getTexture("Background"));
			correct = AudioSources.getSound("Correct");
			wrong = AudioSources.getSound("Wrong");
			startLevelMusic();
			addChild(bg);
			
			placeObjects();
			
			
		}
		
		private function placeObjects():void
		{
			removeObjects();
			funArray = new Array();
			boringArray = new Array();
			
			for (var i:Number = 0; i < 4; i++)
			{
				setToCoords(createRandomObject(), (16 + (i * 116)), 150 );
				
				//setToCoords(makeResizedImg(createRandomObject(), 80, 80), (16 + (i * 116)), 150 );
			}
			
		}
		
		private function removeObjects():void 
		{
			for each (var funObj:Image in funArray)
			{
				funObj.dispose();
				removeChild(funObj);
			}
			for each (var boringObj:Image in boringArray)
			{
				boringObj.dispose();
				removeChild(boringObj);
			}
			
		}
		
		private function createRandomObject():Image 
		{
			var randomValue:Number = Math.ceil(Math.random() * 9);
			var image:Image = new Image(Assets.getTexture("Obj" + randomValue));
			if (randomValue <= 4)
			{
				image.name = "Fun"
				funArray.push(image);
			}
			else
			{
				image.name = "Boring"
				boringArray.push(image);
				
				if (randomValue == 5)
				{
				makeResizedImg(image, 61, 120)
					}
				
			}
			image.addEventListener(TouchEvent.TOUCH, onObjTouch);
			return image;
		}
		
		private function onObjTouch(e:TouchEvent):void 
		{
			if (e.getTouch(this, TouchPhase.BEGAN))
			{
				var object:Image = e.currentTarget as Image;
				
				if (object.name == "Fun")
				{
					object.dispose();
					correct.play(0,1);
					removeChild(object);
					funArray.pop();
					score++;
				}
				
				if (object.name == "Boring")
				{
					wrong.play(0,1);
					removeTicks(50);
				}
				
				if (funArray.length < 1) {
						placeObjects();
				}
				
				// makeResizedImg(image, imgage.width*0,7), imgage.height*0,5)
				
				
				if (score > 14)
				{
				pauseTimer();
				removeEventListeners();
				dispose();
				var menu:Menu = new Menu(main, getTimer(), "Victory", calculateScore(25));
				addChild(menu);
				lvlChannel.stop();
				}
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