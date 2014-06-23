package
{
	
	/**
	 * ...
	 * @author Stefan
	 */
	
	import flash.display.Bitmap;
	import flash.media.Sound;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	public class AudioSources
	{
		[Embed(source="../audio/bgm1.mp3")]
		public static const BGMusic:Class;
		
		[Embed(source="../audio/drum.mp3")]
		public static const LvlMusic:Class;
		
		[Embed(source="../audio/correct.mp3")]
		public static const Correct:Class;
		
		[Embed(source="../audio/wrong.mp3")]
		public static const Wrong:Class;
		
		[Embed(source="../audio/timer.mp3")]
		public static const Timer:Class;
		
		[Embed(source="../audio/button.mp3")]
		public static const Button:Class;
		
		private static var soundDict:Dictionary = new Dictionary();
		
		public static function getSound(name:String):Sound
		{
			if (soundDict[name] == undefined)
			{
				var sound:Sound = new AudioSources[name]();
				soundDict[name] = sound;
			}
			return soundDict[name];
		}
	
	}

}