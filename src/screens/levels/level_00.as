package screens.levels
{
	/**
	 * ...
	 * @author ...
	 */
	import flash.utils.Timer;
	import flash.geom.Point;
	import starling.display.Image;
	import starling.events.Touch;
	import flash.utils.Dictionary;
	
	import screens.levels.level_base
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.events.Event;
	
	public class level_00 extends level_base
	{
		private var bg:Image;
		private var char1:Image;
		private var char2:Image;
		private var char3:Image;
		private var char4:Image;
		private var thermometer:Image;
		private var firstTouched:Boolean = false;
		private var myTimer:Timer;
		private var charDict:Dictionary = new Dictionary();
		
		public function level_00(main:GameScreen)
		{
			super(main);
			initialize();
			addGauge();
			addMenuButton();
		}
		
		/**
		 * Initializes the game by loading the background and the game
		 */
		private function initialize():void
		{
			bg = new Image(Assets.getTexture("GradientBG"));
			addChild(bg);
			
			char1 = new Image(Assets.getTexture("Face1"));
			char2 = new Image(Assets.getTexture("Face2"));
			char3 = new Image(Assets.getTexture("Face3"));
			char4 = new Image(Assets.getTexture("Face4"));
			
			thermometer = new Image(Assets.getTexture("Thermometer"));
			thermometer.rotation = 0;
			thermometer.addEventListener(TouchEvent.TOUCH, moveThermometer);
			
			setToCoords(makeResizedImg(char1, 80, 80), 32, 110);
			setToCoords(makeResizedImg(char2, 80, 80), 144, 110);
			setToCoords(makeResizedImg(char3, 80, 80), 256, 110);
			setToCoords(makeResizedImg(char4, 80, 80), 368, 110);
			
			setToCoords(makeResizedImg(thermometer, 30, 85), 30, 180);
			
			this.addEventListener(Event.ENTER_FRAME, handleCollision)
			myTimer = new Timer(1000, 5);
			
			for (var i:Number = 0; i < 4; i++)
			{
				charDict[i] = true;
			}
		}
		
		private function moveThermometer(e:TouchEvent):void
		{
			if (!firstTouched)
			{
				startGauge();
				firstTouched = true;
			}
			var touch:Touch = e.getTouch(this);
			var target:Image = e.target as Image;
			if (touch != null)
			{
				if (touch.phase == TouchPhase.MOVED)
				{
					moveImageByTouch(touch, target);
				}
			}
		}
		
		private function moveImageByTouch(touch:Touch, target:Image):void
		{
			var point:Point = touch.getMovement(this);
			target.x += point.x;
			target.y += point.y;
		}
		
		private function handleCollision(e:Event):void
		{			
			if (firstTouched && !myTimer.running)
			{				
				if (detectCollision(thermometer, char1))
				{						
					myTimer.start();
					while (detectCollision(thermometer, char1) && charDict[1])
					{
						if (myTimer.currentCount == myTimer.repeatCount)
						{
							setToCoords(makeResizedImg(new Image(Assets.getTexture("Done")), 25, 25), 32, 75)
							charDict[1] = false;
							myTimer.reset();
							break;
						}
					}
					
				}
				else if (detectCollision(thermometer, char2))
				{
					myTimer.start();
					while (detectCollision(thermometer, char2) && charDict[2])
					{
						if (myTimer.currentCount == myTimer.repeatCount)
						{
							setToCoords(makeResizedImg(new Image(Assets.getTexture("Done")), 25, 25), 144, 75)
							charDict[2] = false;
							myTimer.reset();
							break;
						}
					}
					myTimer.reset();
				}
				else if (detectCollision(thermometer, char3))
				{
					myTimer.start();
					while (detectCollision(thermometer, char3) && charDict[3])
					{
						if (myTimer.currentCount == myTimer.repeatCount)
						{
							setToCoords(makeResizedImg(new Image(Assets.getTexture("Done")), 25, 25), 256, 75)
							charDict[3] = false;
							myTimer.reset();
							break;
						}
					}
					myTimer.reset();
				}
				else if (detectCollision(thermometer, char4))
				{
					myTimer.start();
					while (detectCollision(thermometer, char4) && charDict[4])
					{
						if (myTimer.currentCount == myTimer.repeatCount)
						{
							setToCoords(makeResizedImg(new Image(Assets.getTexture("Done")), 25, 25), 368, 75)
							charDict[4] = false;
							myTimer.reset();
							break;
						}
					}
					myTimer.reset();
				}
				else
				{
					continueTimer();
				}
			}
		}
		
		private function detectCollision(object1:Image, object2:Image):Boolean
		{
			return object1.getBounds(object1.parent).intersects(object2.getBounds(object2.parent))
		}
	
	}

}