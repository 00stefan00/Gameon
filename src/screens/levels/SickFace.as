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
		
		// place the constructor here. It is usually the topmost function but below variables
		
		public function SickFace (tex:Texture) {
			super(tex);
			addEventListener(Event.ENTER_FRAME, update);
			vx = Math.random() * 7 - 4;
			vy = Math.random() * 7 - 4;			
		}
		
		/**
		 * this function update will be where the ball is moved each time a new frame is drawn.
		 */
		public function update( event : Event ) :void
		{
			this.x = this.x + vx;
			this.y = this.y + vy;
			if (this.x > 480 + 30)
				this.x = Math.random() * 480;
			if (this.y > 320 + 30)
				this.y = Math.random() * 320;
			if (this.x < 0 - 30)
				this.x = Math.random() * 480;
			if (this.y < 0 - 30)
				this.y = Math.random() * 320;
		}
		
		public function getCorrectness():Boolean
		{
			return isCorrect;
		}
		
		public function setCorrectness( value:Boolean ):void
		{
			isCorrect = value;
		}
	}
} 