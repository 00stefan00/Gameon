package screens.levels
{
	/**
	 * ...
	 * @author Stefan
	 * the door level
	 */
	import com.greensock.TweenMax;
	import flash.events.TimerEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.utils.Dictionary;
	import flash.utils.Timer;
	import screens.levels.level_base;
	import screens.Menu;
	import starling.display.Image;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
<<<<<<< HEAD
=======
	import starling.events.Event;
	import com.greensock.TweenMax;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import screens.Menu;
	import flash.utils.Timer;
	import util.Assets;
>>>>>>> 4fa70792600f5e5898654599ebfccc53ab57eaa4
	
	public class level_03 extends level_base
	{
		private var doorsArray:Array;
		private var margin:int = 100;
		private var doorDict:Dictionary;
		private var doctor:Image;
		private var doorsCreated:Boolean = false;
		private var waitingForInput:Boolean = false;
		private var score:Number = 0;
		private var victory:Boolean = false;
		private var img:Image;
		
		public function level_03(main:GameScreen)
		{
			super(main);
			initialize();
			
			setLevelName("level_03");
			afterInit();
			
			addGauge();
			addMenuButton();
		}
		
		/**
		 * Initializes the game by loading the background and the game
		 */
		private function initialize():void
		{
<<<<<<< HEAD
			addChild(makeResizedImg(new Image(Assets.getTexture("Background")), 480, 320));
			correct = AudioSources.getSound("Correct");
			wrong = AudioSources.getSound("Wrong");
			startLevelMusic();
=======
			addChild(new Image(Assets.getTexture("Background")));			
>>>>>>> 4fa70792600f5e5898654599ebfccc53ab57eaa4
			
			doorsArray = new Array();
			doorDict = new Dictionary();
			
			addEventListener(Event.ENTER_FRAME, onFrame);
		
		}
		
		private function onFrame():void
		{
			if (getTimer().running && !doorsCreated)
			{
				createDoors();
				placeDoctor();
				pauseTimer();
			}
			
			if (score == 3 && !victory)
			{
				victory = true;
				this.removeEventListeners()
				var menu:Menu = new Menu(main, getTimer(), "Victory", calculateScore(25));
				addChild(menu);
			}
		}
		
		private function placeDoctor():void
		{
			if (!victory)
			{
				for (var i:Number = 0; i < 3; i++)
				{
					if (doorDict[i].name == "correct")
					{
						doctor = new Image(Assets.getTexture("Doctor"));
						doctor.x = (doorDict[i].x)+((doorDict[i].width/2) - doctor.width/2)
						doctor.y = (doorDict[i].y)+((doorDict[i].height/2) - doctor.height/2)
						addChild(doctor)
					}
				}
				var counter:Timer = new Timer(5, 75);
				counter.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
				counter.start();
			}
		}
		
		private function placeResult(x:Number, y:Number, doc:Boolean = false):void
		{
			var name:String = new String("");
			if (doc)
			{
				name = new String("Doctor")
			}
			else
			{
				if (Math.floor(Math.random() * 2) == 1)
				{
					name = new String("Bird");
				}
				else
				{
					name = new String("Hippo");
				}
			}
			img = new Image(Assets.getTexture(name));
			img.x = x;
			img.y = y;
			addChild(img);
		}
		
		private function showDoors():void
		{
			for each (var door:Image in doorDict)
			{
				doctor.dispose();
				removeChild(doctor);
				addChild(door);
			}
			animateDoors();
		
		}
		
		private function onTimerComplete(e:TimerEvent):void
		{
			showDoors();
		}
				
		private function createDoors():void
		{
			for (var i:int = 0; i < 3; i++)
			{
				var door:Image = new Image(Assets.getTexture("Door"));
				door.x = (100 * i + margin)*(main.getScreenWidth()/480);
				door.y = (margin)*(main.getScreenHeight()/320);
				
				makeResizedImg(door, door.width*0.8, door.height*0.8);
				door.name = "wrong";
				
				doorsArray.push(door);
				doorDict[i] = door;
				
				door.addEventListener(TouchEvent.TOUCH, onDoorTouched)
			}
			setRandomCorrectDoor();
			doorsCreated = true;
		}
		
		private function setRandomCorrectDoor():void
		{
			doorDict[Math.floor(Math.random() * 3)].name = "correct";
		}
		
		private function onDoorTouched(e:TouchEvent):void
		{
			if (e.getTouch(this, TouchPhase.BEGAN) && waitingForInput)
			{
				var door:Image = e.currentTarget as Image;
				var rX:int = (door.x)+((door.width/2) - doctor.width/2)
				var rY:int = (door.y) + ((door.height / 2) - doctor.height / 2)
				
				if (door.name == "correct")
				{
					main.getSoundManager().playCorrectSound();
					score++;
					showResultsAndRestart();					
					placeResult(rX, rY, true);
				}
				else if (door.name == "wrong")
				{
					main.getSoundManager().playWrongSound();
					showResultsAndRestart();
					placeResult(rX, rY);
				}
				removeDoors();
			}
		}
		
		private function showResultsAndRestart():void
		{
			pauseTimer();
			var timer:Timer = new Timer(200, 5)
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, restart)
			timer.start();
		}
		
		private function removeDoors():void
		{
			for each (var door:Image in doorDict)
			{
				removeChild(door);
			}
		}
		
		private function restart(e:TimerEvent):void
		{
			removeChild(img);
			removeChild(doctor);
			doorsArray = new Array();
			createDoors();
			placeDoctor();
		}
		
		private function animateDoors():void
		{
			waitingForInput = false;
			pauseTimer();
			var timer:Timer = new Timer(600, 8)
			timer.addEventListener(TimerEvent.TIMER, onTick)
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, destroy)
			timer.start();
		
		}
		
		private function onTick(e:TimerEvent):void
		{
			pickRandomDoorsAndAnimate();
		}
		
		private function destroy(e:TimerEvent):void
		{
			continueTimer();
			e.currentTarget.removeEventListener(TimerEvent.TIMER_COMPLETE, destroy);
			e.currentTarget.removeEventListener(TimerEvent.TIMER, onTick);
			waitingForInput = true;
		}
		
		private function pickRandomDoorsAndAnimate():void
		{
			var randomIndex:int = Math.floor(Math.random() * doorsArray.length);
			var doorA:Image = doorsArray.splice(randomIndex, 1)[0];
			
			randomIndex = Math.floor(Math.random() * doorsArray.length);
			var doorB:Image = doorsArray.splice(randomIndex, 1)[0];
			
			doorsArray.push(doorA, doorB);
			moveDoor(doorA, doorB);
		}
		
		private function moveDoor(doorA:Image, doorB:Image):void
		{
			var doorAToDoorBX:Number = doorB.x - doorA.x;
			var doorBToDoorAX:Number = doorA.x - doorB.x;
			
			TweenMax.to(doorA, 0.5, {bezierThrough: [{x: doorA.x + doorAToDoorBX / 2, y: doorA.y + 100}, {x: doorB.x, y: doorB.y}], delay: 0.1});
			TweenMax.to(doorB, 0.5, {bezierThrough: [{x: doorB.x + doorBToDoorAX / 2, y: doorB.y - 100}, {x: doorA.x, y: doorA.y}], delay: 0.1});
		}
	
	}

}