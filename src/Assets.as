package
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	public class Assets
	{			
		// ############################
		// ######### Level_base #######
		// ############################
		[Embed(source='../img/gauge.png')]
		public static const Gauge:Class;
		
		// ############################
		// ######### Level_00 #########
		// ############################
		[Embed(source='../img/level_00/face1.png')]
		public static const Face1:Class;
		
		[Embed(source='../img/level_00/face2.png')]
		public static const Face2:Class;
		
		[Embed(source='../img/level_00/face3.png')]
		public static const Face3:Class;
		
		[Embed(source='../img/level_00/face4.png')]
		public static const Face4:Class;
		
		[Embed(source='../img/level_00/thermo.png')]
		public static const Thermometer:Class;
		
		[Embed(source='../img/level_00/gradientBG.png')]
		public static const GradientBG:Class;
		
		[Embed(source='../img/level_00/markedDone.png')]
		public static const Done:Class;
			
		// ############################
		// ######### Level_01 #########
		// ############################

		[Embed(source='../img/level_01/bed1.png')]
		public static const Bed1:Class;
		
		[Embed(source='../img/level_01/bed2.png')]
		public static const Bed2:Class;
		
		[Embed(source='../img/level_01/bed3.png')]
		public static const Bed3:Class;
		
		[Embed(source='../img/level_01/bed4.png')]
		public static const Bed4:Class;
		
		[Embed(source='../img/level_01/bed5.png')]
		public static const Bed5:Class;
		
		// ############################
		// ######### Level_02 #########
		// ############################
		[Embed(source='../img/level_02/healthyface.png')]
		public static const HealthyFace:Class;
		
		[Embed(source='../img/level_02/sickface.png')]
		public static const SickFace:Class;
		
		// ############################
		// ########### menu ###########
		// ############################
		
		[Embed(source='../img/menu/small_hearts.png')]
		public static const TinyHeart:Class;
		
		[Embed(source='../img/InfoBg.png')]
		public static const InfoBg:Class;
				
		// ############################
		// ######### MAINSCREEN #########
		// ############################
		
		[Embed(source='../img/mainBackground.png')]
		public static const MainBackground:Class;
		
		[Embed(source='../img/mainscreen/arrow_left.png')]
		public static const ArrowLeft:Class;
		
		[Embed(source='../img/mainscreen/arrow_right.png')]
		public static const ArrowRight:Class;
		
		[Embed(source='../img/mainscreen/levelbox.png')]
		public static const LevelPlaceHolder:Class;
		
		[Embed(source='../img/mainscreen/boy_sick.png')]
		public static const SickBoy:Class;
		
		// All assets listed and put into variables
		
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
		
		// if image exists returns the image as a Texture.
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
