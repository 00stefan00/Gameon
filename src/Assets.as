package
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	public class Assets
	{
		[Embed(source='../img/arrow_left.png')]
		public static const ArrowLeft:Class;
		
		[Embed(source='../img/arrow_right.png')]
		public static const ArrowRight:Class;
		
		[Embed(source='../img/BgYellow.png')]
		public static const BgYellow:Class;
		
		[Embed(source='../img/home-icon.png')]
		public static const HomeIcon:Class;
		
		[Embed(source='../img/close-icon.png')]
		public static const CloseIcon:Class;		
		
		[Embed(source='../img/next-icon.png')]
		public static const NextIcon:Class;
		
		[Embed(source='../img/mute-icon.png')]
		public static const MuteIcon:Class;		
		
		[Embed(source='../img/redo-icon.png')]
		public static const RedoIcon:Class;		
		
		[Embed(source='../img/menu-icon.png')]
		public static const MenuIcon:Class;
		
		[Embed(source='../img/character.png')]
		public static const Character:Class;
		
		[Embed(source='../img/Background.png')]
		public static const Background:Class;
		
		[Embed(source='../img/play-button.png')]
		public static const StartBtn:Class;
		
		[Embed(source='../img/game01.png')]
		public static const Game01:Class;
		
		[Embed(source='../img/game02.png')]
		public static const Game02:Class;
		
		[Embed(source='../img/game03.png')]
		public static const Game03:Class;
		
		[Embed(source='../img/game04.png')]
		public static const Game04:Class;
		
		private static var gameTextures:Dictionary = new Dictionary();
		
		public static function getTexture(name:String):Texture
		{
			if (gameTextures[name] == undefined)
			{
				var bitmap:Bitmap = new Assets[name]();
				gameTextures[name] = Texture.fromBitmap(bitmap);
			}
			return gameTextures[name];
		}
	}
}
