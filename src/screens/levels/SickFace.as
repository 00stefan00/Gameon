package screens.levels
{
	// Import all the classes this script uses
	import starling.events.Event;
	import starling.display.Image;
	import starling.textures.Texture;
	
	public class SickFace extends Image
	{
		// the vertical and horizontal speed of the face.
		private var vx:int = 0;
		private var vy:int = 0;
		private var isCorrect:Boolean;
		private var paused:Boolean = false;
		
		// place the constructor here. It is usually the topmost function but below variables
		
		public function SickFace(tex:Texture)
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
				if (this.x > 480 + 30)
					relocateX();
				if (this.y > 320 + 30)
					relocateY();
				if (this.x < 0 - 30)
					relocateX();
				if (this.y < 0 - 30)
					relocateY();
			}
		}
		
		public function pause():void
		{
			paused = true;
		}
		
		public function unpause():void
		{
			paused = false;
		}
		
		public function relocateX():void
		{
			this.x = Math.random() * 480;
			setVxVy();
		}
		
		public function relocateY():void
		{
			this.y = Math.random() * 320;
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