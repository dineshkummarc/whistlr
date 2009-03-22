package com.gdakram.conf
{
	import com.gdakram.conf.ConfigurationManager;
	
	public class Lastfm
	{
		private static const AUDIOSCROBBLER_BASE_URL:String = "http://ws.audioscrobbler.com/2.0/";
						
		private var lastfmUsername:String;
		
		private var lastfmAPIKey:String;
		
		public function Lastfm(lastfmUsername:String) {
			this.lastfmUsername = lastfmUsername;
			this.lastfmAPIKey = ConfigurationManager.getLastfmAPIKey() 
		}
		
		public static function checkAPIKey():Boolean {
			return false;
		}
		
		public function get userRecentTracksUrl():String {	
			return AUDIOSCROBBLER_BASE_URL + "?method=user.getRecentTracks&user=" + this.lastfmUsername + "&api_key=" + this.lastfmAPIKey;
		}
		
		public function get userWeeklyTopAlbumsUrl():String {
			return AUDIOSCROBBLER_BASE_URL + "?method=user.getWeeklyAlbumChart&user=" + this.lastfmUsername + "&api_key=" + this.lastfmAPIKey;
		}
		
		public function get userWeeklyTopAristsUrl():String {			
			return AUDIOSCROBBLER_BASE_URL + "?method=user.getWeeklyArtistChart&user=" + this.lastfmUsername + "&api_key=" + this.lastfmAPIKey;
		}
		
		public function get userWeeklyTopTracksUrl():String {
			return AUDIOSCROBBLER_BASE_URL + "?method=user.getWeeklyTrackChart&user=" + this.lastfmUsername + "&api_key=" + this.lastfmAPIKey;			
		}
	}
}