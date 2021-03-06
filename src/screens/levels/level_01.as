package screens.levels
{
	/**
	 * ...
	 * @author Stefan
	 */
	import starling.display.Image;
	import screens.levels.level_base;
	import flash.utils.Dictionary;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import screens.Menu;
		
	import flash.media.Sound;
	import flash.media.SoundChannel;
	
	public class level_01 extends level_base
	{
		private var bg:Image;
		private var bed1:Image;
		private var bed2:Image;
		private var bed3:Image;
		private var bed4:Image;
		private var bed5:Image;
		private var bedDict:Dictionary;
		private var nrDict:Dictionary;
		private var bedCount:Number = 0;
		private var score:Number;
		

		
		public function level_01(main:GameScreen)
		{
			super(main);
			initialize();
			addGauge();
			addMenuButton();
			setLevelName("level_01");
			afterInit();
		}
		
		/**
		 * Initializes the game by loading the background and the game
		 */
		private function initialize():void
		{
			addEventListener(Event.ENTER_FRAME, checks);
			bedDict = new Dictionary();
			nrDict = new Dictionary();
			
			bg = new Image(Assets.getTexture("Background"));
			bg = makeResizedImg(bg, 480, 320);
			addChild(bg);
			
			startLevelMusic();
			placeBeds();
			
			score = 0;
		}
		
		private function placeBeds():void
		{
			bedCount = 0;
			for (var i:Number = 0; i < 4; i++)
			{
				var bedImage:Image = getRandomBed()
				bedImage.addEventListener(TouchEvent.TOUCH, touchedBed);
				setToCoords(makeResizedImg(bedImage, 100, 67), (16 + (i * 116)), 150);
				bedDict[i] = bedImage;
				
				var nrImage:Image = getRandomNr()
				setToCoords(makeResizedImg(nrImage, 58, 42), (16 + (i * 116)), 90);
				nrImage.addEventListener(TouchEvent.TOUCH, touchedNr);
				nrDict[i] = nrImage;
			}
		}
		
		private function touchedBed(event:TouchEvent):void
		{
			if (event.getTouch(this, TouchPhase.BEGAN))
			{
				for (var i:Number = 0; i < 4; i++)
				{
					if (bedDict[i] == event.currentTarget)
					{
						var nr:Image = nrDict[i];
						if (checkNr(nr.name))
						{
							bedDict[i].dispose();
							removeChild(bedDict[i]);
							removeChild(nrDict[i]);
							bedCount--;
							playCorrectSound();
							score++;
						}
						else
						{
							removeTicks(40);
							playWrongSound();
						}
						
					}
				}
			}
		}
		
		private function touchedNr(event:TouchEvent):void
		{
			if (event.getTouch(this, TouchPhase.BEGAN))
			{
				for (var i:Number = 0; i < 4; i++)
				{
					if (nrDict[i] == event.currentTarget)
					{
						var nr:Image = nrDict[i];
						if (checkNr(nr.name))
						{
							bedDict[i].dispose();
							removeChild(bedDict[i]);
							removeChild(nrDict[i]);
							bedCount--;
							playCorrectSound();
							score++;
						}
						else
						{
							removeTicks(40);
							playWrongSound();
						}
						
					}
				}
			}
		}
		
		private function checkNr(nr:String):Boolean
		{
			return (new Number(nr) > 12);
		}
		
		private function checks():void
		{
			checkBeds();
			checkScore();
		}
		
		private function checkScore():void
		{
			if (score > 14)
			{
				pauseTimer();
				removeEventListeners();
				dispose();
				var menu:Menu = new Menu(main, getTimer(), "Victory", calculateScore(25), getMusicChannel());
				addChild(menu);
				stopLevelMusic();
				
			}
		}
		
		private function checkBeds():void
		{
			if (bedCount == 0)
			{
				for (var i:Number = 0; i < 4; i++)
				{
					var bed:Image = bedDict[i];
					
					removeChild(bed);
					removeChild(nrDict[i]);
				}
				placeBeds();
			}
		}
		
		private function getRandomBed():Image
		{
			return new Image(Assets.getTexture("Bed" + Math.ceil(Math.random() * 5)));
		}
		
		private function getRandomNr():Image
		{
			var nrArray:Array = new Array(6, 9, 10, 12, 20, 21, 24, 27);
			var someNum:Number = Math.floor(Math.random() * 8);
			var nrImage:Image = new Image(Assets.getTexture("nr" + nrArray[someNum]));
			nrImage.name = "" + nrArray[someNum];
			if (nrArray[someNum] > 12)
			{
				bedCount++;
			}
			return nrImage
		}
		

	
	}

}