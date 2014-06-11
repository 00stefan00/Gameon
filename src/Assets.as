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
		
		[Embed(source='../img/level_01/6.png')]
		public static const nr6:Class;
		
		[Embed(source='../img/level_01/9.png')]
		public static const nr9:Class;
		
		[Embed(source='../img/level_01/10.png')]
		public static const nr10:Class;
		
		[Embed(source='../img/level_01/12.png')]
		public static const nr12:Class;
		
		[Embed(source='../img/level_01/20.png')]
		public static const nr20:Class;
		
		[Embed(source='../img/level_01/21.png')]
		public static const nr21:Class;
		
		[Embed(source='../img/level_01/24.png')]
		public static const nr24:Class;
		
		[Embed(source='../img/level_01/27.png')]
		public static const nr27:Class;
		
		// ############################
		// ######### Level_03 #########
		// ############################
		[Embed(source='../img/level_03/door.png')]
		public static const Door:Class;
		
		// ############################
		// ######### Level_04 #########
		// ############################
		
		// Re-Usable sick faces from 1st lvl
		// public static const Face1:Class;
		// public static const Face2:Class;
		// public static const Face3:Class;
		// public static const Face4:Class;
		
		[Embed(source='../img/level_04/hface1.png')]
		public static const Face5:Class;
		
		[Embed(source='../img/level_04/hface2.png')]
		public static const Face6:Class;
		
		[Embed(source='../img/level_04/hface3.png')]
		public static const Face7:Class;
		
		// ############################
		// ######### Level_05 #########
		// ############################
		
		[Embed(source='../img/level_05/box_blue.png')]
		public static const BoxBlue:Class;
		
		[Embed(source='../img/level_05/box_red.png')]
		public static const BoxRed:Class;
		
		[Embed(source='../img/level_05/box_green.png')]
		public static const BoxGreen:Class;
		
		[Embed(source='../img/level_05/pill_blue.png')]
		public static const PillBlue:Class;
		
		[Embed(source='../img/level_05/pill_red.png')]
		public static const PillRed:Class;
		
		[Embed(source='../img/level_05/pill_green.png')]
		public static const PillGreen:Class;
		
		// ############################
		// ######### Level_06 #########
		// ############################
		[Embed(source='../img/level_06/healthyface.png')]
		public static const HealthyFace:Class;
		
		[Embed(source='../img/level_06/sickface.png')]
		public static const SickFace:Class;
		
		// ############################
		// ######### Level_07 #########
		// ############################
		
		// Re-Usable meds from 5th lvl
		//public static const PillBlue:Class;		
		//public static const PillRed:Class;
		//public static const PillGreen:Class;
		
		[Embed(source='../img/level_07/randomObj1.png')]
		public static const RandomObj1:Class;
		
		[Embed(source='../img/level_07/randomObj2.png')]
		public static const RandomObj2:Class;
		
		[Embed(source='../img/level_07/randomObj3.png')]
		public static const RandomObj3:Class;
		
		[Embed(source='../img/level_07/benson_catching.png')]
		public static const Benson:Class;
		
		// ############################
		// ########### menu ###########
		// ############################
		
		[Embed(source='../img/menu/scaledHeart_victoryScreen.png')]
		public static const TinyHeart:Class;
		
		[Embed(source='../img/menu/InfoBg.png')]
		public static const InfoBg:Class;
		
		[Embed(source='../img/menu/home-icon.png')]
		public static const HomeIcon:Class;
		
		[Embed(source='../img/menu/close-icon.png')]
		public static const CloseIcon:Class;
		
		[Embed(source='../img/menu/next-icon.png')]
		public static const NextIcon:Class;
		
		[Embed(source='../img/menu/mute-icon.png')]
		public static const MuteIcon:Class;
		
		[Embed(source='../img/menu/redo-icon.png')]
		public static const RedoIcon:Class;
		
		[Embed(source='../img/menu/confirm.png')]
		public static const Confirm:Class;
		
		// ##################################
		// ########### menu/texts ###########
		// ##################################
		
		[Embed(source='../img/menu/texts/level00_end.png')]
		public static const Text00e:Class;
		
		[Embed(source='../img/menu/texts/level00_start.png')]
		public static const Text00s:Class;
		
		[Embed(source='../img/menu/texts/level01_end.png')]
		public static const Text01e:Class;
		
		[Embed(source='../img/menu/texts/level01_start.png')]
		public static const Text01s:Class;
		
		[Embed(source='../img/menu/texts/work_in_progress.png')]
		public static const Text02e:Class;
		
		[Embed(source='../img/menu/texts/work_in_progress.png')]
		public static const Text02s:Class;
		
		[Embed(source='../img/menu/texts/work_in_progress.png')]
		public static const Text03e:Class;
		
		[Embed(source='../img/menu/texts/work_in_progress.png')]
		public static const Text03s:Class;
		
		[Embed(source='../img/menu/texts/work_in_progress.png')]
		public static const Text04e:Class;
		
		[Embed(source='../img/menu/texts/work_in_progress.png')]
		public static const Text04s:Class;
		
		[Embed(source='../img/menu/texts/work_in_progress.png')]
		public static const Text05e:Class;
		
		[Embed(source='../img/menu/texts/work_in_progress.png')]
		public static const Text05s:Class;
		
		[Embed(source='../img/menu/texts/level06_end.png')]
		public static const Text06e:Class;
		
		[Embed(source='../img/menu/texts/level06_start.png')]
		public static const Text06s:Class;
		
		[Embed(source='../img/menu/texts/work_in_progress.png')]
		public static const Text07e:Class;
		
		[Embed(source='../img/menu/texts/work_in_progress.png')]
		public static const Text07s:Class;
		
		[Embed(source='../img/menu/texts/work_in_progress.png')]
		public static const Text08e:Class;
		
		[Embed(source='../img/menu/texts/work_in_progress.png')]
		public static const Text08s:Class;
		
		[Embed(source='../img/menu/texts/game_over.png')]
		public static const GameOver:Class;
		
		// ##############################
		// ######### MAINSCREEN #########
		// ##############################
		
		[Embed(source='../img/mainscreen/arrow_left.png')]
		public static const ArrowLeft:Class;
		
		[Embed(source='../img/mainscreen/arrow_right.png')]
		public static const ArrowRight:Class;
		
		[Embed(source='../img/mainscreen/boy_sick.png')]
		public static const SickBoy:Class;
		
		// Levels
		
		[Embed(source='../img/mainscreen/levels/levelbox.png')]
		public static const LevelPlaceHolder:Class;
		
		[Embed(source='../img/mainscreen/levels/level00.png')]
		public static const Level00:Class;
		
		[Embed(source='../img/mainscreen/levels/level01.png')]
		public static const Level01:Class;
		
		[Embed(source='../img/mainscreen/levels/levelbox.png')]
		public static const Level02:Class;
		
		[Embed(source='../img/mainscreen/levels/levelbox.png')]
		public static const Level03:Class;
		
		[Embed(source='../img/mainscreen/levels/levelbox.png')]
		public static const Level04:Class;
		
		[Embed(source='../img/mainscreen/levels/levelbox.png')]
		public static const Level05:Class;
		
		[Embed(source='../img/mainscreen/levels/level06.png')]
		public static const Level06:Class;
		
		[Embed(source='../img/mainscreen/levels/levelbox.png')]
		public static const Level07:Class;
		
		[Embed(source='../img/mainscreen/levels/levelbox.png')]
		public static const Level08:Class;
		// All assets listed and put into variables
		
		[Embed(source='../img/menu-icon.png')]
		public static const MenuIcon:Class;
		
		[Embed(source='../img/Background.png')]
		public static const Background:Class;
		
		[Embed(source='../img/play-button.png')]
		public static const StartBtn:Class;
		
		[Embed(source='../img/gamelogo.png')]
		public static const Logo:Class;
		
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
