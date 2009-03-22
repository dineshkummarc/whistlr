package com.gdakram.events
{
	import flash.events.Event;

	public class TweetEvent extends Event
	{
		public static const POPULATE_TWEET_BOX:String = "populateTweetBox"; 

		public var tweet:String;

		public function TweetEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false, tweet:String = "")
		{
			super(type, bubbles, cancelable);
			this.tweet = tweet;
		}

		override public function clone():Event {
			return new TweetEvent(this.type, this.bubbles, this.cancelable, this.tweet); 
		}				
	}
}