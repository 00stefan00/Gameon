package screens.levels
{
	/**
	 * ...
	 * @author ...
	 * the door level
	 */
	import flash.desktop.InteractiveIcon;
	import flash.utils.Timer;
	import starling.display.Image;
	import screens.levels.level_base;
	import starling.events.EnterFrameEvent;
	import starling.events.TouchEvent;
	import starling.events.Touch;
	import starling.events.TouchPhase;
	import starling.events.Event;
	import com.greensock.TweenMax;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	
	
	
	public class level_03 extends level_base
	{
		private var bg:Image;
		private var bird:Image;
		private var hippo:Image;
		private var doctor:Image;
		private var collisionTimer:Timer;
		private var victory:Boolean;
		private var paused:Boolean = false;
		private var session:Number;
		import screens.Menu;
		private var lvlmusic:Sound;
		private var lvlChannel:SoundChannel; 
		private var doorsArray:Array;
		private var animCount:int = 5;
		private var counter:Number = 0;
		private var counterPaused:Boolean = false;
		
		
		
		public function level_03(main:GameScreen)
		{
			super(main);
			initialize();
			addGauge();
			addMenuButton();
			setLevelName("level_03");
			afterInit();
		
		}
		
		
		/**
		 * Initializes the game by loading the background and the game
		 */
		private function initialize():void
		{
			
			bg = new Image(Assets.getTexture("Background"));
			startLevelMusic();
			addChild(bg);
			session = 0;
			doorsArray = new Array();
			addEventListener(Event.ENTER_FRAME, pauseTimer);
			//createBird();
			//createHippo();
			createDoctor();
			
			addEventListener(Event.ENTER_FRAME, countSeconds);
			
		}
		
		private function countSeconds() :void {
			trace ("counter working");
			var seconds:Number = 3;
			counter += 1;
			
				if (counter > (30 * seconds) && !paused ) 
				{
				createDoors();
				continueTimer();
				
				}
			}
			
			
		public function counterPause():void
		{
			paused = true
		}
		
		
		
		private function startLevelMusic():void {
			lvlmusic = AudioSources.getSound("LvlMusic");
			lvlChannel = lvlmusic.play(0, 1000);
		}
		
		
		
		private function createBird():void
		{
			
			var margin:int = 100;
			bird = new Image(Assets.getTexture("Bird"));
			bird.x = 100 * 0 + margin;
			bird.y = margin;
			addChild(bird);
			trace ("bird")
			
		}
		
		private function createHippo():void
		{
			var margin:int = 100;
			hippo = new Image(Assets.getTexture("Hippo"));
			hippo.x = 100 * 1 + margin;
			hippo.y = margin;
			addChild(hippo);
			trace ("hippo")
			
		}
		
		private function createDoctor():void
		{
			
			var margin:int = 100;
			doctor = new Image(Assets.getTexture("Doctor"));
			doctor.x = 100 * 2 + margin;
			doctor.y = margin;
			addChild(doctor);
			trace ("doctor")
			
		}
		
		
		private function createDoors():void
		{
			//removeChild(bird);
			//removeChild(hippo);
			removeChild(doctor);
			counterPause();
			if (session < 3)
			{
				
				var margin:int = 100;
				for (var i:int = 0; i < 3; i++)
				{
					// create door and store in variable
					trace(session)
					var door:Door = new Door(Assets.getTexture("Door"));
					door.x = 100 * i + margin;
					door.y = margin;
					door.setCorrectness(false);
					addChild(door);
					doorsArray.push(door);
					door.addEventListener(TouchEvent.TOUCH, choose)
					
				}
				door.setCorrectness(true);
				switchDoors();				
			}
			else
			{
				trace("Level ready");
				checks();
			}
		}
		
		//Tells if the door is true or false
		private function choose(event:TouchEvent):void
		{
			if (event.getTouch(this, TouchPhase.BEGAN))
			{
				//trace( (event.currentTarget as Door).getCorrectness() );
				var correctTarget:Boolean;
				correctTarget = (event.currentTarget as Door).getCorrectness();
				trace(correctTarget);
				
				if (correctTarget == false)
				{
					trace("wrong")
					removeTicks(50);
				}
				else
				{
					trace("correct door!!")
					session = session + 1;
					for (var i:int = 0; i < 3*(session); i++)
					{
						var door:Image = doorsArray[i];
						removeChild(door)
						removeChild(doorsArray[i]);
						trace("delete");
					}
					if (correctTarget == true) 
					{
						
						var newx = (event.currentTarget as Door).x;
						createDoctor();
						doctor.x = newx;
						paused = false;
						counter = 0;
						addEventListener(Event.ENTER_FRAME, countSeconds);
										
					} 
					
				}
			}
		
		}
		
		//ANIMATION
		
		private function switchDoors():void
		{
			
			animCount = 10;
			//trace("switchDoors works")
			nextAnim();
		
		}
		
		/**
		 * start animation if the total times is not yet reached
		 */
		private function nextAnim():void
		{
			//trace("animcount works")
			if (animCount-- > 0)
			{
				pickRandomDoorsAndAnimate()
			} 		
		}
		
		private function pickRandomDoorsAndAnimate():void
		{
			//trace("random doors works");
			var randomIndex:int = Math.floor(Math.random() * doorsArray.length);
			var doorA:Door = doorsArray.splice(randomIndex, 1)[0];
			
			
			
			randomIndex = Math.floor(Math.random() * doorsArray.length);
			var doorB:Door = doorsArray.splice(randomIndex, 1)[0];
			
			
			
			
			
			doorsArray.push(doorA, doorB);
			//trace("READY TO MOVE")
			moveDoor(doorA, doorB);
			
		
		}
		
		private function moveDoor(doorA:Door, doorB:Door):void
		{
			//trace("move doors responds")
		
			var doorAToDoorBX:Number = doorB.x - doorA.x;
			var doorBToDoorAX:Number = doorA.x - doorB.x;
			
		
			TweenMax.to(doorA, 0.5, { bezierThrough:[{ x: doorA.x + doorAToDoorBX / 2, y: doorA.y + 100 }, { x: doorB.x, y: doorB.y }], delay: 0.1, onComplete: nextAnim });
			TweenMax.to(doorB, 0.5, { bezierThrough:[{ x: doorB.x + doorBToDoorAX / 2, y: doorB.y - 100 }, { x: doorA.x, y: doorA.y }], delay: 0.1 });
			
			}
		
		//END OF THE GAME
		
		private function checks():void
		{
			checkScore();
		}
		
		private function checkScore():void
		{
			//if (score > 14)
			//{
			pauseTimer();
			removeEventListeners();
			dispose();
			var menu:Menu = new Menu(main, getTimer(), "Victory", calculateScore(25));
			addChild(menu);
			lvlChannel.stop();
		
			//}
		}
		
		
	
	}

}