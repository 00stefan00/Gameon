package
{
	/**
	 * ...
	 * @author Stefan
	 */
	import flash.display.Sprite;
	
	import starling.core.Starling;
	import flash.events.SampleDataEvent;
	import flash.media.Sound;
	
	[SWF(width="320",height="480",frameRate="60",backgroundColor="#ffffff")]
	
	public class Startup extends Sprite
	{
		
		private var myStarling:Starling;
		private var beep:Sound = new Sound();
		private const sampleFrequency:uint = 44100;
		private var samplesCreated:uint = 0;
		private var lengthInSeconds:Number = 0.5;
		
		public function Startup()
		{
			beepInit();
			trace("starling framework initialized?");
			myStarling = new Starling(Game, stage);
			myStarling.start();
			beep.play();
		}
		
		private function beepInit():void
		{
			var beepHandler:Function = function(event:SampleDataEvent):void
			{
				for (var i:uint = 0; i < 2048; i++)
				{
					if (samplesCreated >= sampleFrequency * lengthInSeconds)
					{
						return;
					}
					var wavePos:Number = 20 * Math.PI * i / 2048;
					event.data.writeFloat(Math.sin(wavePos));
					event.data.writeFloat(Math.sin(wavePos));
					samplesCreated++;
				}
			};
			
			beep.addEventListener(SampleDataEvent.SAMPLE_DATA, beepHandler);
		}
	}

}