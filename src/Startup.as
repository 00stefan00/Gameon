package
{
	/**
	 * ...
	 * @author Stefan
	 */
	import flash.display.Sprite;
	import starling.events.Event;
	import starling.core.Starling;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.events.ProgressEvent;
	import flash.filesystem.File;

	
	
	[SWF(width="480",height="320",frameRate="60",backgroundColor="#ffffff")]
	
	public class Startup extends Sprite
	{
		private var myStarling:Starling;
		
		public var mLoader:Loader;
		
		public function Startup()
		{
			// initialize Starling
			myStarling = new Starling(GameScreen, stage);
			// startLoad();
			myStarling.antiAliasing = 1;
			myStarling.start();
		}
		
		private function startLoad():void
		{
			mLoader = new Loader();
			
			var xmlFile:File = new File(File.applicationDirectory.nativePath).resolvePath("../video/intro_animation.flv");
			trace(xmlFile.data, xmlFile.type);
			trace(">" + xmlFile.url);
			var mRequest:URLRequest = new URLRequest(xmlFile.url);
			mLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onCompleteHandler);
			mLoader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgressHandler);
			mLoader.load(mRequest);
			Starling.current.nativeOverlay.addChild(mLoader);
		}
 
		private function onCompleteHandler(event:Event):void
		{ 
			Starling.current.nativeOverlay.addChild(mLoader);
			myStarling.start();
 		}
		
		private function onProgressHandler(event:ProgressEvent):void
 		{
		}
	}

}