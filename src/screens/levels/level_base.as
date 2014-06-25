package screens.levels
{
	/**
	 * ...
	 * @author ...
	 */
	import adobe.utils.CustomActions;
	import Gauge;
	import screens.BaseScreen;
	import screens.Menu;
	
	import flash.utils.Timer;
	import flash.events.TimerEvent;

	import starling.display.DisplayObjectContainer;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.textures.Texture;
	import starling.events.TouchPhase;
	
	public class level_base extends BaseScreen
	{
		private var menuButton:Image;
		private var currentGame:Number;
		public var gauge:Gauge
		private var myTimer:Timer
		private var gaugeRatio:Number = 0.0025;
		private var levelName:String;
		public var noTimerLose:Boolean = false;
		
		public function level_base(main:GameScreen)
		{
			super(main);
			initialize();
		}
		
		private function initialize():void
		{
			myTimer = new Timer(50, 6000);
			myTimer.addEventListener(TimerEvent.TIMER, timerListener);
			main.getSoundManager().startLevelMusic();
		}
		
		public function afterInit():void
		{
			var menu:Menu = new Menu(main, getTimer(), "Start", -1);
			addChild(menu);
		}
		
		private function gameLost():void
		{
			if (!noTimerLose)
			{
				var menu:Menu = new Menu(main, getTimer(), "Lose", -1);
				addChild(menu);
			}
		}
		
		public function setLevelName(name:String):void
		{
			levelName = name;
		}
		
		public function getTimer():Timer
		{
			return myTimer;
		}
		
		public function getCurrentGame():Number
		{
			return currentGame;
		}
		
		public function pauseTimer():void
		{
			if (myTimer.running)
			{
				myTimer.stop();
			}
		}
		
		public function continueTimer():void
		{
			if (!myTimer.running)
			{
				myTimer.start();
			}
		}
		
		public function addTicks(ticks:Number):void
		{
			gauge.ratio += (gaugeRatio * ticks);
		}
		
		public function removeTicks(ticks:Number):void
		{
			gauge.ratio -= (gaugeRatio * ticks);
		}
		
		private function timerListener(event:TimerEvent):void
		{
			if (gauge != null)
			{
				gauge.ratio -= gaugeRatio;
			}
			if (gauge.ratio < 0.001)
			{
				pauseTimer();
				gameLost();
			}
		}
		
		public function addGauge():void
		{
			gauge = new Gauge(Assets.getTexture("Gauge"));
			gauge.ratio = 1;
			addChild(gauge);
		}
		
		public function startGauge():void
		{
			if (myTimer != null)
			{
				myTimer.start();
			}
		}
		
		public function getGaugeRatio():Number
		{
			return gauge.ratio;
		}
		
		/**
		 * Adds a button that will open a menu when clicked
		 */
		public function addMenuButton():void
		{
			menuButton = new Image(Assets.getTexture("MenuIcon"));
			menuButton.x = 05;
			menuButton.y = 05;
			menuButton.addEventListener(TouchEvent.TOUCH, openMenu)
			addChild(menuButton);
		}
		
		/**
		 * opens the Menu
		 */
		public function openMenu(e:TouchEvent):void
		{
			if (e.getTouch(this, TouchPhase.BEGAN))
			{
				main.getSoundManager().playButtonSound();
				if (gauge != null)
				{
					if (gauge.ratio > gaugeRatio)
					{
						pauseTimer();
					}
				}
				var menu:Menu = new Menu(main, myTimer, "playing", -1);
				addChild(menu);
			}
		
		}
		
		public function victoryScreen():void
		{
			var menu:Menu = new Menu(main, myTimer, "victory");
			addChild(menu);
		}
		
		/**
		 * Places image on coordinates X and Y
		 */
		public function setToCoords(img:Image, x:Number, y:Number):void
		{
			img.x = x;
			img.y = y;
			
			addChild(img);
		}
		
		public function makeResizedImg(img:Image, width:Number, height:Number):Image
		{
			img.width = width;
			img.height = height;
			
			return img;
		}
		
		public function calculateScore(minimumGaugeNeeded:Number):Number
		{
			var gaugeScore:Number = (getGaugeRatio() * 100);
			var gaugeDecrease:Number = 20;
			for (var i:Number = 0; (i < 5 && gaugeScore + minimumGaugeNeeded > 20); i++)
			{
				gaugeScore -= gaugeDecrease;
			}
			return i;
		}
	}
}