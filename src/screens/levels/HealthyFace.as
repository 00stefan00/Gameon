package screens.levels
{
	/**
	 * ...
	 * @author Kati
	 */
	
	 // Import all the classes this script uses
	import flash.display.Screen;
	import starling.display.Image;
	import starling.events.Event;
	import starling.textures.Texture;
	
	public class HealthyFace extends Image
	{
		// the vertical and horizontal speed of the face.
		private var vx:int = 0;
		private var vy:int = 0;
		private var isCorrect:Boolean;
		private var paused:Boolean = false;
		private var screenWidth:int = Screen.mainScreen.visibleBounds.width;
		private var screenHeight:int = Screen.mainScreen.visibleBounds.height;
		
		// place the constructor here. It is usually the topmost function but below variables
		
		public function HealthyFace(tex:Texture)
		{
			super(tex);
			addEventListener(Event.ENTER_FRAME, update);
			setVxVy();
		
		}
		
		public function setVxVy():void
		{
			vx = Math.random() * 7 - 4;
			vy = Math.random() * 7 - 4;
			
			if (vx == 0 || vy == 0)
				setVxVy();
		}
		
		/**
		 * this function update will be where the ball is moved each time a new frame is drawn.
		 */
		public function update(event:Event):void
		{
			if (!paused)
			{
				this.x = this.x + vx;
				this.y = this.y + vy;
				if (this.x > screenWidth + 30)
					relocateX();
				if (this.y > screenHeight + 30)
					relocateY();
				if (this.x < 0 - 30)
					relocateX();
				if (this.y < 0 - 30)
					relocateY();
			}
		}
		
		public function pause():void
		{
			paused = true
		}
		
		public function unpause():void
		{
			paused = false;
		}
		
		public function relocateX():void
		{
			this.x = Math.random() * screenWidth;
			setVxVy();
		}
		
		public function relocateY():void
		{
			this.y = Math.random() * screenHeight;
			setVxVy();
		}
		
		public function getCorrectness():Boolean
		{
			return isCorrect;
		}
		
		public function setCorrectness(value:Boolean):void
		{
			isCorrect = value;
		}
	}
}