package screens.levels
{
	/**
	 * ...
	 * @author Stefan
	 */
	import flash.geom.Point;
	import flash.utils.Dictionary;
	import screens.levels.level_base;
	import screens.Menu;
	import starling.display.Image;
	import starling.events.EnterFrameEvent;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import util.Config;
	
	
	public class level_07 extends level_base
	{
		private var bg:Image;
		private var benson:Image;
		private var itemDict:Dictionary;
		private var spawnsDict:Dictionary;
		private var score:Number = 0;
		private var spawnReset:Number = 0;
		
		
		public function level_07(main:GameScreen)
		{
			super(main);
			initialize();
			addGauge();
			addMenuButton();
			setLevelName("level_07");
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
			
			startLevelMusic();
			
			//benson = makeResizedImg(new Image(Assets.getTexture("Benson")), 80, 132);
			benson = new Image(Assets.getTexture("Benson"));
			setToCoords(makeResizedImg(benson, 88, 145), ((480 / 2) - (benson.width / 2)), 235);
			addChild(benson);
			benson.addEventListener(TouchEvent.TOUCH, onBensonTouch);

			this.addEventListener(EnterFrameEvent.ENTER_FRAME, onFrame)
			
			initDict();
			spawnsDict = new Dictionary();
			super.noTimerLose = true;
		
		}
		
		private function initDict():void
		{
			itemDict = new Dictionary();
			itemDict[0] = "PillBlue"
			itemDict[1] = "PillRed"
			itemDict[2] = "PillGreen"
			
			itemDict[3] = "RandomObj1"
			itemDict[4] = "RandomObj2"
			itemDict[5] = "RandomObj3"
		}
		
		private function onFrame(e:EnterFrameEvent):void
		{
			if (getTimer().running)
			{
				if (spawnReset == 0)
				{
					{
						if (getDictLenght() < Config.MAX_ITEMS)
						{
							spawnItem();
							spawnReset = Config.ITEM_SPAWN_TIMER;
						}
					}
				}
				for each (var img:Image in spawnsDict)
				{
					img.y++;
					img.y++;
					if (img.y > main.getScreenWidth())
					{
						removeChild(img)
						removeFromDict(img);
						spawnItem();
					}
				}
				spawnReset--;
				checkForCollisions();
			}
			if (getGaugeRatio() < 0.01) {
				var menu:Menu = new Menu(main, getTimer(), "Victory", score/Config.MEDS_NEEDED_PER_HEART, getMusicChannel());
				addChild(menu);				
				stopLevelMusic();
				this.removeEventListener(EnterFrameEvent.ENTER_FRAME, onFrame);
			}
		}
		
		private function onBensonTouch(e:TouchEvent):void
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
			target.x += point.x;
		}
		
		private function spawnItem():void
		{
			var img:Image = getRandomItem();
			var x:Number = (Math.random() * 460) + 10;
			
			setToCoords(img, x, 1);
		}
		
		private function getRandomItem():Image
		{
			{
				var randomValue:Number = Math.floor(Math.random() * 6);
				var image:Image = new Image(Assets.getTexture("" + itemDict[randomValue]));
				if (randomValue < 3)
				{
					image.name = "Med"
				}
				else
				{
					image.name = "RandomItem"
				}
				addToDict(image);
				return image;
			}
		
		}
		
		private function addToDict(image:Image):void
		{
			var done:Boolean = false;
			for (var i:Number = 0; i < 50 && !done; i++)
			{
				if (spawnsDict[i] == null)
				{
					spawnsDict[i] = image;
					done = true;
				}
			}
		}
		
		private function removeFromDict(image:Image):void
		{
			var done:Boolean = false;
			for (var i:Number = 0; i < 50 && !done; i++)
			{
				if (spawnsDict[i] == image)
				{
					delete spawnsDict[i];
					done = true;
				}
			}
		}
		
		private function checkForCollisions():void
		{
			for each (var img:Image in spawnsDict)
			{
				if (img != null)
				{
					if (detectCollision(benson, img))
					{
						handleCollision(img);
					}
				}
			}
		}
		
		private function getDictLenght():Number
		{
			var count:Number = 0;
			for each (var img:Image in spawnsDict)
			{
				count++
			}
			return count;
		}
		
		private function detectCollision(object1:Image, object2:Image):Boolean
		{
			return object1.getBounds(object1.parent).intersects(object2.getBounds(object2.parent))
		}
		
		private function handleCollision(img:Image):void
		{
			if (img.name == "Med")
			{
				removeFromDict(img);
				removeChild(img);
				
				spawnItem();
				addTicks(Config.BONUS_TICKS_ON_MED);
				score++;
				playCorrectSound();
			}
			else if (img.name == "RandomItem")
			{
				removeFromDict(img);
				removeChild(img);
				
				spawnItem();
				removeTicks(50);
				playWrongSound();
			}
		}
	}
}