package screens
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.geom.Point;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.display.Bitmap;
	import flash.display.LoaderInfo;
	
	/**
	 * ...
	 * @author Stefan
	 */
	public class Heart extends MovieClip
	{		
		private static var spriteSheet:BitmapData; // first, why storing a Bitmap if you don't need it be moving?
		private static var spriteArray:Vector.<BitmapData>; // This will store split spritesheet
		
		private var bitmap:Bitmap; // this will be displaying proper frame
		private var currentFrameNr:int; // what frame are you displaying
		
		public static function initialize():void
		{
			// loading static assets should better be made in a static function
			if (!spriteSheet)
			{
				var loader:Loader = new Loader();
				loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadComplete);
				loader.load(new URLRequest("Heart_Masked.png"));
			}
		}
		
		public function Heart()
		{
			bitmap = new Bitmap(); // null bitmap is displayed
			addChild(bitmap);
			currentFrameNr = 0;
			addEventListener(Event.ENTER_FRAME, onFrameLoop);
		}
		
		private function onFrameLoop(e:Event):void
		{
			switchFrame();
		}
		
		private function switchFrame():void
		{
			if (!spriteArray)
				return; // oops, not initialized
			currentFrameNr++;
			if (currentFrameNr >= spriteArray.length)
				currentFrameNr = 0;
			bitmap.bitmapData = spriteArray[currentFrame]; // voila. Now this particular Ball
			// will display the proper BitmapData out of sliced sprite sheet.
		}
		
		private static function onLoadComplete(e:Event):void
		{
			var loaderInfo:LoaderInfo = e.target as LoaderInfo;
			spriteSheet = (loaderInfo.content as Bitmap).bitmapData; // store the bitmapdata
			// now cut the loaded sprite sheet apart
			var i:int = Math.floor(spriteSheet.width / 50); // how many frames are in there
			var r:Rectangle = new Rectangle(0, 0, 50, 50);
			var p:Point = new Point(); // why making N identical points? Just make one
			spriteArray = new Vector.<BitmapData>();
			for (var j:int = 0; j < i; j++)
			{
				var bd:BitmapData = new BitmapData(50, 50);
				r.x = 50 * j; // update rectangle to cut next frame
				bd.copyPixels(spriteSheet, r, p); // cut the frame in a new BitmapData
				spriteArray.push(bd); // store the frame
			}
			// once this is complete, your sprite sheet is ready
		}
	}

}