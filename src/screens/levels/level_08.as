import util.Assets;
package screens.levels
{
	/**
	 * ...
	 * @author Stefan
	 */
	import starling.display.Image;
	import screens.levels.level_base;
	import screens.Menu;

	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import util.Assets;
	
	public class level_08 extends level_base
	{
		private var bg:Image;
		
		private var funArray:Array;
		private var boringArray:Array;
		private var score:Number = 0;
		
		public function level_08(main:GameScreen)
		{
			super(main);
			initialize();
			addGauge();
			addMenuButton();
			setLevelName("level_08");
			afterInit();
		
		}
		
		/**
		 * Initializes the game by loading the background and the game
		 */
		private function initialize():void
		{
			bg = new Image(Assets.getTexture("Background"));
<<<<<<< HEAD
			bg = makeResizedImg(bg, 480, 320);
			startLevelMusic();
=======
			
>>>>>>> 4fa70792600f5e5898654599ebfccc53ab57eaa4
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
				var img:Image = createRandomObject();
				setToCoords(img, (16 + (i * 116)), (bg.height/2)-img.height/2);
			}
			
			if (funArray.length < 1) {
				placeObjects();
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
					main.getSoundManager().playCorrectSound();
					removeChild(object);
					funArray.pop();
					score++;
				}
				else if (object.name == "Boring")
				{
					main.getSoundManager().playWrongSound();
					removeTicks(50);
				}
				
				if (funArray.length < 1)
				{
					placeObjects();
				}
				
				if (score > 14)
				{
					pauseTimer();
					removeEventListeners();
					dispose();
					var menu:Menu = new Menu(main, getTimer(), "Victory", calculateScore(25));
					addChild(menu);
				}
			}
		}
	
	}

}