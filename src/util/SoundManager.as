package util
{
	/**
	 * ...
	 * @author ...
	 */
	
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import util.Config;
	import util.AudioSources;
	
	public class SoundManager
	{
		private var muted:Boolean;
		
		private var audioChannel:SoundChannel;
		private var lvlChannel:SoundChannel;
		private var tickingChannel:SoundChannel;
		private var btnChannel:SoundChannel;
		private var bgChannel:SoundChannel;
		
		public function SoundManager()
		{
			muted = Config.DEFAULT_SOUND_SETTING;
		}
		
		public function playCorrectSound():void
		{
			if (!getMuted())
			{
				{
					var sound:Sound = AudioSources.getSound("Correct");
					audioChannel = sound.play(0, 1);
				}
			}
		}
		
		public function playWrongSound():void
		{
			if (!getMuted())
			{
				{
					var sound:Sound = AudioSources.getSound("Wrong");
					audioChannel = sound.play(0, 1);
				}
			}
		}
		
		public function startLevelMusic():void
		{
			if (lvlChannel == null && !getMuted())
			{
				{
					var lvlmusic:Sound = AudioSources.getSound("LvlMusic");
					lvlChannel = lvlmusic.play(0, 1000);
				}
			}
		}
		
		public function playButtonSound():void
		{
			if (!getMuted())
			{
				{
					{
						var btnSound:Sound = AudioSources.getSound("Button");
						btnChannel = btnSound.play(1);
					}
				}
			}
		}
		
		public function playTickingSound():void
		{
			if (tickingChannel == null && !getMuted())
			{
				var tickingSound:Sound = AudioSources.getSound("Timer");
				tickingChannel = tickingSound.play(1, 10);
			}
		}
		
		public function playBackgroundMusic():void
		{
			if (bgChannel == null && !getMuted())
			{
				var bgmusic:Sound = AudioSources.getSound("BGMusic");
				bgChannel = bgmusic.play(0, 100);
			}
		}
		
		public function stopLevelMusic():void
		{
			if (lvlChannel != null)
			{
				lvlChannel.stop();
				lvlChannel = null;
			}
		}
		
		public function stopBackgroundMusic():void
		{
			if (bgChannel != null)
			{
				bgChannel.stop();
				bgChannel = null;
			}
		}
		
		public function stopTickingSound():void {
			if (tickingChannel != null) {
				tickingChannel.stop();
				tickingChannel = null;
			}
		}
		
		public function stopAllMusic():void
		{
			stopLevelMusic();
			stopBackgroundMusic();
			stopTickingSound();
		}
		
		public function getMuted():Boolean
		{
			return muted;
		}
		
		public function mute():void
		{
			muted = true;
			stopAllMusic();
		}
		
		public function unmute():void
		{
			muted = false;
		}
		
		public function switchMute():void
		{
			if (getMuted())
			{
				unmute();
			}
			else
			{
				mute();
			}
		}
	}

}