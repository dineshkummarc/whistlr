package com.gdakram.conf
{
	public class LoginCred
	{
		private var tUser:String;
		
		private var tPass:String;
		
		private var lfmUser:String;
		
		public function LoginCred(twitterUsername:String,twitterPassword:String,lastfmUsername:String) {
			this.tUser = twitterUsername;
			this.tPass = twitterPassword;
			this.lfmUser = lastfmUsername;
		}
		
		public function set twitterUsername(twitterUsername:String):void {
			this.tUser = twitterUsername;
		}
		
		public function get twitterUsername():String {
			return this.tUser;
		}
		
		public function set twitterPassword(twitterPassword:String):void {
			this.tPass = twitterPassword;
		}
		
		public function get twitterPassword():String {
			return this.tPass;
		}
		
		public function set lastfmUsername(lastfmUsername:String):void {
			this.lfmUser = lastfmUsername;
		}
		
		public function get lastfmUsername():String {
			return this.lfmUser;
		}

	}
}