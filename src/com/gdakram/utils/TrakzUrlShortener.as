package com.gdakram.utils
{
	import com.adobe.serialization.json.JSON;
	import com.gdakram.conf.ConfigurationManager;
	import com.gdakram.events.*;
	
	import flash.events.*;
	import flash.net.*;
	
	import mx.resources.ResourceManager;	

	public class TrakzUrlShortener extends UrlShortener
	{
		/**
		 * constructor
		 */
		public function TrakzUrlShortener(urlToShorten:String)
		{
			var shorteningUrl:String = "http://tra.kz/api/shorten?api="+ConfigurationManager.getTrakzAPIKey()+"&l=";
			super(shorteningUrl, urlToShorten);
		}

		/**
		 * Need to override the standard completeHandler function since
		 * tra.kz is cool enough to send out a json response!
		 */
		override public function completeHandler(event:Event):void {
			var loader:URLLoader = URLLoader(event.target);
			var result:Object = JSON.decode(loader.data);

			if (result.y == 1 && result.s != false) {
				var shortUrl:String = "http://tra.kz/" + result.s;
				this.dispatchEvent(new UrlShortenerEvent(UrlShortenerEvent.URL_SHORTENED, true, false, shortUrl));
				this.dispatchEvent(new StatusMessageEvent(StatusMessageEvent.UPDATE_STATUS, true, false, ResourceManager.getInstance().getString("resources","LINK_SHORTENED_MSG")));				
			}
			else {
				this.dispatchEvent(new UrlShortenerEvent(UrlShortenerEvent.URL_SHORTENING_ERROR, true, false, null, ResourceManager.getInstance().getString("resources","LINK_SHORTENED_ERROR_MSG"))); 
				this.dispatchEvent(new StatusMessageEvent(StatusMessageEvent.UPDATE_STATUS, true, false, ResourceManager.getInstance().getString("resources","LINK_SHORTENED_ERROR_MSG")));
			}
		}
		
	}
}