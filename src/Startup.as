package
{
	/**
	 * ...
	 * @author Stefan
	 */
	import flash.display.Sprite;
	import flash.events.AsyncErrorEvent;
	import flash.events.NetStatusEvent;
	import flash.events.SecurityErrorEvent;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import starling.core.Starling;
	import util.Config;
	
	[SWF(width="1920",height="1080",frameRate="60",backgroundColor="#ffffff")]
	
	public class Startup extends Sprite
	{
		private var myStarling:Starling;
		private var nc:NetConnection;
		private var ns:NetStream;
		private var playVideo:Boolean = Config.PLAY_VIDEO;
		
		private const path:String = "intro_animation.flv";
		private const connection:NetConnection = new NetConnection();
		private var stream:NetStream;
		private const video:Video = new Video(480, 320);
		
		public function Startup()
		{
			with (connection)
			{
				addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);
				addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
				connect(null);
			}
		
		}
		
		private function onMovieEnd():void
		{
			myStarling = new Starling(GameScreen, stage);
			myStarling.antiAliasing = 1;
			myStarling.start();
		}
		
		private function netStatusHandler(event:NetStatusEvent):void
		{
			switch (event.info.code)
			{
				case "NetConnection.Connect.Success": 
					connectStream();
					break;
				case "NetStream.Play.StreamNotFound": 
					trace("Unable to locate video: " + path);
					break;
				case "NetStream.Play.Stop": 
					removeChild(video);
					onMovieEnd();
					break;
			}
		
		}
		
		private function connectStream():void
		{
			if(playVideo){
				stream = new NetStream(connection);
				stream.client = {onMetaData: function(obj:Object):void
					{
					}}
				stream.receiveAudio(true);
			
			
				with (stream)
				{
					addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);
					addEventListener(AsyncErrorEvent.ASYNC_ERROR, asyncErrorHandler);
				}
				
				video.attachNetStream(stream);
				stream.play(path);
				
				addChild(video);
			} else {
				onMovieEnd();
			}
		}
		
		private function securityErrorHandler(event:SecurityErrorEvent):void
		{
			trace("securityErrorHandler: " + event);
		}
		
		private function asyncErrorHandler(event:AsyncErrorEvent):void
		{
			trace("AsyncErrorEvent: " + event);
		}
	
	}

}