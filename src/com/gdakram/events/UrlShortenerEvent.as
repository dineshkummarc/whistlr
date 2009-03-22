package com.gdakram.events
{
	import flash.events.Event;

	public class UrlShortenerEvent extends Event
	{
		public static const URL_SHORTEN:String = "urlShorten";

		public static const URL_SHORTENED:String = "urlShortened";
		
		public static const URL_SHORTENING_ERROR:String = "urlShorteningError"; 

		public var url:String;
		
		public var message:String;

		public function UrlShortenerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false, url:String = "", message:String = "") 
		{
			super(type, bubbles, cancelable);
			this.url = url;
			this.message = message;
		}

		override public function clone():Event {
			return new UrlShortenerEvent(this.type, this.bubbles, this.cancelable, this.url, this.message); 
		}				
	}
}