package com.gdakram.events
{
	import flash.events.Event;

	public class ChartEvent extends Event
	{
		public static const LOAD_RECENT_TRACKS:String = "loadRecentTracks";
		
		public static const LOAD_WEEKLY_TOP_TRACKS:String = "loadWeeklyTopAlbumbs";
		
		public static const LOAD_WEEKLY_TOP_ARTISTS:String = "loadWeeklyTopArtists";
		
		public function ChartEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}

		override public function clone():Event {
			return new ChartEvent(this.type, this.bubbles, this.cancelable); 
		}
	}
}