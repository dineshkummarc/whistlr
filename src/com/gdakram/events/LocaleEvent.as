package com.gdakram.events
{
	import flash.events.Event;

	public class LocaleEvent extends Event
	{
		public static const LOCALE_CHANGED:String = "localeChanged";
				
		public function LocaleEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}

		override public function clone():Event {
			return new LocaleEvent(this.type, this.bubbles, this.cancelable); 
		}
	}
}