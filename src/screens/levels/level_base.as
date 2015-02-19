package screens.levels
{
	/**
	 * ...
	 * @author Stefan
	 */
	import flash.events.TimerEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.utils.Timer;
	import Gauge;
	import screens.BaseScreen;
	import screens.Menu;
	import starling.display.Image;
	import starling.events.TouchEvent;
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
		private var sound:Sound;
		private var audioChannel:SoundChannel;
		private var lvlmusic:Sound;
		private var lvlChannel:SoundChannel;
		private var ticking:Sound;
		private var timerChannel:SoundChannel;
		
		public function level_base(main:GameScreen)
		{
			super(main);
			initialize();
		}
		
		private function initialize():void
		{
			myTimer = new Timer(50, 6000);
			myTimer.addEventListener(TimerEvent.TIMER, timerListener);
			ticking = AudioSources.getSound("Timer");
		}
		
		public function afterInit():void
		{
			var menu:Menu = new Menu(main, getTimer(), "Start", -1, lvlChannel);
			addChild(menu);
		}
		
		private function gameLost():void
		{
			if (!noTimerLose)
			{
				var menu:Menu = new Menu(main, getTimer(), "Lose", -1, lvlChannel);
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
			if (timerChannel != null)
			{
				timerChannel.stop();
				timerChannel = null;
			}
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
			if (timerChannel == null)
			{
				timerChannel = ticking.play(1, 10);
			}
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
			gauge.width *= (main.getScreenWidth() / 480);
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
				main.playButtonSound();
				if (gauge != null)
				{
					if (gauge.ratio > gaugeRatio)
					{
						pauseTimer();
					}
				}
				var menu:Menu = new Menu(main, myTimer, "playing", -1, getMusicChannel());
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
			img.x = x*(main.getScreenWidth()/480);
			img.y = y * (main.getScreenHeight() / 320);
			
			addChild(img);
		}
		
		public function makeResizedImg(img:Image, width:Number, height:Number):Image
		{
			img.width = width*(main.getScreenWidth()/480);
			img.height = height * (main.getScreenHeight()/320);
			
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
		
		public function playCorrectSound():void
		{
			if (!main.getMuted())
			{
				sound = AudioSources.getSound("Correct");
				audioChannel = sound.play(0, 1);
			}
		}
		
		public function playWrongSound():void
		{
			if (!main.getMuted())
			{
				sound = AudioSources.getSound("Wrong");
				audioChannel = sound.play(0, 1);
			}
		}
		
		public function startLevelMusic():void
		{
			if (!main.getMuted())
			{
				lvlmusic = AudioSources.getSound("LvlMusic");
				lvlChannel = lvlmusic.play(0, 1000);
			}
		}
		
		public function stopLevelMusic():void
		{
			if (!main.getMuted())
			{
				lvlChannel.stop();
			}
		}
		
		public function getMusicChannel():SoundChannel
		{
			return lvlChannel;
		}
	}
}