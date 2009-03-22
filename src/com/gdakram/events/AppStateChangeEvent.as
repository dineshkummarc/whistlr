package com.gdakram.events
{
	import flash.events.Event;

	public class AppStateChangeEvent extends Event
	{
		public static const LOGGED_IN:String = "loggedIn";
		
		public static const LOGIN_FORM:String = "loginForm";
		
		public static const API_KEYS_MISSING_ERROR:String = "api_keys_missing_error"; 

		public function AppStateChangeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}

		override public function clone():Event {
			return new AppStateChangeEvent(this.type, this.bubbles, this.cancelable); 
		}
	}
}