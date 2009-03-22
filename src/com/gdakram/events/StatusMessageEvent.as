package com.gdakram.events
{
	import flash.events.Event;

	public class StatusMessageEvent extends Event
	{
		public static const UPDATE_STATUS:String = "updateStatus"; 

		public var message:String;

		public function StatusMessageEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false, message:String = "")
		{
			super(type, bubbles, cancelable);
			this.message = message;
		}

		override public function clone():Event {
			return new StatusMessageEvent(this.type, this.bubbles, this.cancelable, this.message); 
		}				
	}
}