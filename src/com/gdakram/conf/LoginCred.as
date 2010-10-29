package com.gdakram.conf
{
	
	public class LoginCred
	{
						
		private var tUsername:String;
		
		private var tUserId:Number;
		
		private var tAccessPin:Number;
		
		private var tAccessToken:String;
		
		private var tAccessTokenSecret:String;
		
		private var lfmUsername:String;

		public function set twitterUsername(twitterUsername:String):void {
			this.tUsername = twitterUsername;
		}
		
		public function get twitterUsername():String {			
			return this.tUsername;
		}
		
		public function set twitterUserId(userID:Number):void {
			this.tUserId = userID;
		}
		
		public function get twitterUserId():Number {			
			return this.tUserId;
		}
		
		public function set twitterAccessPin(twitterAccessPin:Number):void {
			this.tAccessPin = twitterAccessPin;
		}
		
		public function get twitterAccessPin():Number {
			return this.tAccessPin;
		}
		
		public function set twitterAccessToken(twitterAccessToken:String):void {
			this.tAccessToken = twitterAccessToken;
		}
		
		public function get twitterAccessToken():String {
			return this.tAccessToken;
		}		
		
		public function set twitterAccessTokenSecret(twitterAccessTokenSecret:String):void {
			this.tAccessTokenSecret = twitterAccessTokenSecret;
		}
		
		public function get twitterAccessTokenSecret():String {
			return this.tAccessTokenSecret;	
		}
		
		public function set lastfmUsername(lastfmUsername:String):void {
			this.lfmUsername = lastfmUsername;
		}
		
		public function get lastfmUsername():String {
			return this.lfmUsername;
		}

	}
}