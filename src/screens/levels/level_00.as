package screens.levels
{
	/**
	 * ...
	 * @author ...
	 */
	import flash.geom.Point;
	import starling.display.Image;
	import starling.events.Touch;
	
	import screens.levels.level_base
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class level_00 extends level_base
	{
		private var bg:Image;
		private var char1:Image;
		private var char2:Image;
		private var char3:Image;
		private var char4:Image;
		private var thermometer:Image;
		private var firstTouched:Boolean = false;
		
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
			thermometer.rotation = 0.2;
			thermometer.addEventListener(TouchEvent.TOUCH, moveThermometer);
			
			setToCoords(makeResizedImg(char1, 80, 80), 32, 110);
			setToCoords(makeResizedImg(char2, 80, 80), 144, 110);
			setToCoords(makeResizedImg(char3, 80, 80), 256, 110);
			setToCoords(makeResizedImg(char4, 80, 80), 368, 110);
			
			setToCoords(makeResizedImg(thermometer, 45, 130), 50, 140);
		}
		
		private function moveThermometer(e:TouchEvent):void
		{			
			if (!firstTouched) {
				startGauge();
			}
			var touch:Touch = e.getTouch(this);
			var target:Image = e.target as Image;
			if (touch != null) {
				if (touch.phase == TouchPhase.MOVED) {
					moveImageByTouch(touch, target);
				}
			}
			checkHitBoxes();
		}
		
		public function moveImageByTouch(touch:Touch, target:Image):void {
			var point:Point = touch.getMovement(this);
			target.x += point.x;
			target.y += point.y;
		}
		
		public function checkHitBoxes(): void {
			if (thermometer.x) {
				
			}
		}
	
		
	}

}