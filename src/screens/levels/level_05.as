package screens.levels
{
	/**
	 * ...
	 * @author Stefan
	 */
	import flash.geom.Point;
	import screens.levels.level_base;
	import screens.Menu;
	import starling.display.Image;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	
	public class level_05 extends level_base
	{
		private var bg:Image;
		private var box_blue:Image;
		private var box_red:Image;
		private var box_green:Image;
		private var score:Number;
		

		
		public function level_05(main:GameScreen)
		{
			super(main);
			initialize();
			addGauge();
			addMenuButton();
			setLevelName("level_05");
			afterInit();
		}
		
		/**
		 * Initializes the game by loading the background and the game
		 */
		private function initialize():void
		{
			score = 0;
			bg = new Image(Assets.getTexture("Background"));
			bg = makeResizedImg(bg, 480, 320);
			addChild(bg);
			
			startLevelMusic();
			
			box_blue = new Image(Assets.getTexture("BoxBlue"));
			box_red = new Image(Assets.getTexture("BoxRed"));
			box_green = new Image(Assets.getTexture("BoxGreen"));
			
			setToCoords(makeResizedImg((box_blue), 75, 65), 50, 255);
			setToCoords(makeResizedImg((box_red), 75, 65), 200, 255);
			setToCoords(makeResizedImg((box_green), 75, 65), 350, 255);
			
			spawnMeds();
		
		}
		
		private function spawnMeds():void
		{
			for (var c:Number = 0; c < 3; c++)
			{
				for (var i:Number = 0; i < 5; i++)
				{
					var color:String = "";
					if (c == 0)
					{
						color = "Blue"
					}
					else if (c == 1)
					{
						color = "Red"
					}
					else if (c == 2)
					{
						color = "Green"
					}
					var pill:Image = new Image(Assets.getTexture("Pill" + color));
					makeResizedImg(pill, pill.width*0.8, pill.height*0.8);
					pill.name = color;
					
					placePill(pill);
					pill.addEventListener(TouchEvent.TOUCH, movePill);
				}
			}
		}
		
		private function movePill(e:TouchEvent):void
		{
			var touch:Touch = e.getTouch(this);
			var target:Image = e.target as Image;
			if (touch != null)
			{
				if (touch.phase == TouchPhase.MOVED)
				{
					moveImageByTouch(touch, target);
				}
				checkCollisions(target)
			}
		}
		
		private function checkCollisions(pill:Image):void
		{
			if (detectCollision(pill, box_blue))
			{
				if (pill.name == "Blue")
				{
					pill.dispose();
					removeChild(pill);
					playCorrectSound();
					score++;
				}
				else
				{
					removeTicks(1);
					playWrongSound();
				}
			}
			else if (detectCollision(pill, box_red))
			{
				if (pill.name == "Red")
				{
					pill.dispose();
					removeChild(pill);
					playCorrectSound();
					score++;
				}
				else
				{
					removeTicks(1);
					playWrongSound();
				}
			}
			else if (detectCollision(pill, box_green))
			{
				if (pill.name == "Green")
				{
					pill.dispose();
					removeChild(pill);
					playCorrectSound();
					score++;
				}
				else
				{
					removeTicks(1);
					playWrongSound();
				}
			}
			else
			{
				
			}
			if (score == 15)
			{
				pauseTimer();
				var menu:Menu = new Menu(main, getTimer(), "Victory", calculateScore(30), getMusicChannel());
				addChild(menu);
				stopLevelMusic();
			}
		
		}
		
		private function detectCollision(object1:Image, object2:Image):Boolean
		{
			return object1.getBounds(object1.parent).intersects(object2.getBounds(object2.parent))
		}
		
		private function moveImageByTouch(touch:Touch, target:Image):void
		{
			var point:Point = touch.getMovement(this);
			target.x += point.x;
			target.y += point.y;
		}
		
		private function placePill(pill:Image):void
		{
			var x:Number = (Math.random() * 440) + 20;
			var y:Number = (Math.random() * 160) + 60;
			var rotation:Number = (Math.random() * 180);
			
			setToCoords(pill, x, y);
			pill.rotation = rotation;
		}
		

	}

}