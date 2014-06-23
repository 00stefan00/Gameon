package screens.levels
{
	/**
	 * ...
	 * @author ...
	 */
	import flash.display.BitmapData;
	import flash.utils.Dictionary;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import screens.levels.level_base
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import screens.Menu;
	import flash.geom.Point;
	import starling.display.Sprite;
	import starling.events.TouchPhase;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.Event;
	import starling.display.Sprite;
	import flash.display.Bitmap;
	import flash.display.LoaderInfo;
	
	public class level_02 extends level_base
	{
		private var face:Image;
		private var dict:Dictionary = new Dictionary();
		private var index:Number = 0;
		private var hospital:Image;
		private var football:Image;
		private var movieboard:Image;
		
		public function level_02(main:GameScreen)
		{
			super(main);
			initialize();
			addGauge();
			addMenuButton();
			setLevelName("level_02");
			afterInit();
			pauseTimer();
		}
		
		/**
		 * Initializes the game by loading the background and the game
		 */
		private function initialize():void
		{
			setToCoords(new Image(Assets.getTexture("Background")), 0, 0);
			addLines();
			
			face = new Image(Assets.getTexture("Benson_Face"));
			
			face.addEventListener(TouchEvent.TOUCH, onFaceTouch);
			setToCoords(makeResizedImg(face, 40, 40), 70, 35);
			
			hospital = makeResizedImg(new Image(Assets.getTexture("Hospital")), 145, 83);
			football = makeResizedImg(new Image(Assets.getTexture("Football")), 80, 80);
			movieboard = makeResizedImg(new Image(Assets.getTexture("Movieboard")), 75, 77);
			
			setToCoords(hospital, 1, 230);
			setToCoords(football, 375, 230);
			setToCoords(movieboard, 375, 10);
			
			startLevelMusic();
		}
		
		private function addLines():void
		{
			// borders
			setLineToCoords(makeResizedImg(new Image(Assets.getTexture("LineH")), 480, 1), 0, 0);
			setLineToCoords(makeResizedImg(new Image(Assets.getTexture("LineH")), 480, 1), 0, 320);
			setLineToCoords(makeResizedImg(new Image(Assets.getTexture("LineV")), 1, 320), 0, 0);
			setLineToCoords(makeResizedImg(new Image(Assets.getTexture("LineV")), 1, 320), 480, 0);
			
			// NW
			setLineToCoords(makeResizedImg(new Image(Assets.getTexture("LineH")), 280, 2), 0, 100);
			setLineToCoords(makeResizedImg(new Image(Assets.getTexture("LineV")), 2, 50), 150, 0);
			
			// N
			setLineToCoords(makeResizedImg(new Image(Assets.getTexture("LineH")), 80, 2), 200, 50);
			setLineToCoords(makeResizedImg(new Image(Assets.getTexture("LineV")), 2, 50), 280, 50);
			
			// NE
			setLineToCoords(makeResizedImg(new Image(Assets.getTexture("LineH")), 150, 2), 330, 100);
			setLineToCoords(makeResizedImg(new Image(Assets.getTexture("LineV")), 2, 50), 330, 0);
			
			// E
			setLineToCoords(makeResizedImg(new Image(Assets.getTexture("LineH")), 380, 2), 50, 159);
			
			// SE
			setLineToCoords(makeResizedImg(new Image(Assets.getTexture("LineH")), 200, 2), 280, 220);
			setLineToCoords(makeResizedImg(new Image(Assets.getTexture("LineV")), 2, 50), 330, 270);
			
			// S
			setLineToCoords(makeResizedImg(new Image(Assets.getTexture("LineV")), 2, 110), 230, 159);
			setLineToCoords(makeResizedImg(new Image(Assets.getTexture("LineH")), 100, 2), 230, 269);
			
			// SW			
			setLineToCoords(makeResizedImg(new Image(Assets.getTexture("LineH")), 150, 2), 0, 220);
			setLineToCoords(makeResizedImg(new Image(Assets.getTexture("LineV")), 2, 50), 150, 270);
		}
		
		public function setLineToCoords(img:Image, x:Number, y:Number):void
		{
			dict[index] = img;
			index++;
			setToCoords(img, x, y);
		}
		
		private function onFaceTouch(e:TouchEvent):void
		{
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
			if (point.x > 10)
			{
				point.x = 10;
			}
			if (point.y > 10)
			{
				point.y = 10;
			}
			target.x += point.x;
			target.y += point.y;
			if (collided())
			{
				target.x -= point.x;
				target.y -= point.y;
			}
		}
		
		private function collided():Boolean
		{
			for (var index:String in dict)
			{				
				if (detectCollision(dict[new Number(index)], face))
				{
					return true;
				}				
			}
			if (detectCollision(face, football) || detectCollision(face, movieboard))
			{
				removeTicks(1);
			}
			else if (detectCollision(face, hospital))
				// makeResizedImg(image, imgage.width*0,7), imgage.height*0,5)
				
			{
				pauseTimer();
				removeEventListeners();
				dispose();
				var menu:Menu = new Menu(main, getTimer(), "Victory", calculateScore(25), getMusicChannel());
				addChild(menu);
				stopLevelMusic();
			}
			return false;
		}
		
		private function detectCollision(object1:Image, object2:Image):Boolean
		{
			return object1.getBounds(object1.parent).intersects(object2.getBounds(object2.parent))
		}
	
	}

}