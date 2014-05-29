package screens.levels
{
	/**
	 * ...
	 * @author ...
	 */
	import flash.utils.Timer;
	import flash.geom.Point;
	import screens.Menu;
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
		private var collisionTimer:Timer;
		private var charDict:Dictionary = new Dictionary();
		private var locked:Boolean = false;
		private var char1Count:Number = 0;
		private var char2Count:Number = 0;
		private var char3Count:Number = 0;
		private var char4Count:Number = 0;
		
		public function level_00(main:GameScreen)
		{
			super(main);
			initialize();
			addGauge();
			addMenuButton();
			setLevelName("level_00");
			afterInit();
		}
		
		/**
		 * Initializes the game by loading the background and the game
		 */
		private function initialize():void
		{
			bg = new Image(Assets.getTexture("Background"));
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
			
			setToCoords(makeResizedImg(thermometer, 30, 85), 20, 210);
			
			this.addEventListener(Event.ENTER_FRAME, handleCollision)
			collisionTimer = new Timer(1000, 5);
			
			for (var i:Number = 0; i < 4; i++)
			{
				charDict[i] = false;
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
			var seconds:Number = 1;
			if (firstTouched)
			{
				if (detectCollision(thermometer, char1))
				{
					char1Count += 1;
					if (char1Count > (30 * seconds)) {
						setToCoords(makeResizedImg(new Image(Assets.getTexture("Done")), 25, 25), 32, 75);
						charDict[1] = true;
					}					
				}
				else if (detectCollision(thermometer, char2))
				{
					char2Count += 1;
					if (char2Count > (30 * seconds)) {
						setToCoords(makeResizedImg(new Image(Assets.getTexture("Done")), 25, 25), 144, 75);
						charDict[2] = true;
					}					
				}
				else if (detectCollision(thermometer, char3))
				{
					char3Count += 1;
					if (char3Count > (30 * seconds)) {
						setToCoords(makeResizedImg(new Image(Assets.getTexture("Done")), 25, 25), 256, 75);
						charDict[3] = true;
					}					
				}
				else if (detectCollision(thermometer, char4))
				{
					char4Count += 1;
					if (char4Count > (30 * seconds)) {
						setToCoords(makeResizedImg(new Image(Assets.getTexture("Done")), 25, 25), 368, 75);
						charDict[4] = true;
					}					
				}
				else
				{
					char1Count = 0;
					char2Count = 0;
					char3Count = 0;
					char4Count = 0;
				}
				
				if (charDict[1] && charDict[2] && charDict[3] && charDict[4]) {
					pauseTimer();
					var menu:Menu = new Menu(main, getTimer(), "Victory", calculateScore(40));
					addChild(menu);
					this.removeEventListener(Event.ENTER_FRAME, handleCollision)
				}
			}
		}
				
		private function detectCollision(object1:Image, object2:Image):Boolean
		{
			return object1.getBounds(object1.parent).intersects(object2.getBounds(object2.parent))
		}
	
	}

}