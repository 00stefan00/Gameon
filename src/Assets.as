package
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	public class Assets
	{
		[Embed(source='../img/home.png')]
		public static const Home:Class;
		
		[Embed(source='../img/back.jpg')]
		public static const Back:Class;
		
		[Embed(source='../img/BgYellow.png')]
		public static const BgYellow:Class;
		
		[Embed(source='../img/menu-icon_grey.png')]
		public static const MenuIconGrey:Class;
		
		[Embed(source='../img/character.png')]
		public static const Character:Class;
		
		[Embed(source='../img/Background.jpg')]
		public static const Background:Class;
		
		[Embed(source='../img/MainMenu.png')]
		public static const MainMenu:Class;
		
		[Embed(source='../img/StartButton.png')]
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
