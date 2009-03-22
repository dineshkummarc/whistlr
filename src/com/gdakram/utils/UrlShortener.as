package com.gdakram.utils
{
	import com.gdakram.events.*;
	
	import flash.display.Sprite;
	import flash.events.*;
	import flash.net.*;
	
	import mx.resources.ResourceManager;

	public class UrlShortener extends Sprite {

		private var request:URLRequest;
		
		private var loader:URLLoader;
				
		public function UrlShortener(urlShortener:String, urlToShorten:String) {
			this.loader = new URLLoader();
			configureListeners(loader);
			this.request = new URLRequest(urlShortener + urlToShorten);
		}

		public function shorten():void {
			this.loader.load(this.request);
		}

		private function configureListeners(dispatcher:IEventDispatcher):void {
			dispatcher.addEventListener(Event.COMPLETE, completeHandler);
			dispatcher.addEventListener(Event.OPEN, openHandler);
			dispatcher.addEventListener(ProgressEvent.PROGRESS, progressHandler);
			dispatcher.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			dispatcher.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
			dispatcher.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
		}

		public function completeHandler(event:Event):void {
			var loader:URLLoader = URLLoader(event.target);
			if ((loader.data as String).match(/http:\/\//) != null) {
				this.dispatchEvent(new UrlShortenerEvent(UrlShortenerEvent.URL_SHORTENED, true, false, loader.data));
				this.dispatchEvent(new StatusMessageEvent(StatusMessageEvent.UPDATE_STATUS, true, false, ResourceManager.getInstance().getString("resources","LINK_SHORTENED_MSG")));
			} else {
				this.dispatchEvent(new UrlShortenerEvent(UrlShortenerEvent.URL_SHORTENING_ERROR, true, false, null, ResourceManager.getInstance().getString("resources","LINK_SHORTENED_ERROR_MSG"))); 
				this.dispatchEvent(new StatusMessageEvent(StatusMessageEvent.UPDATE_STATUS, true, false, ResourceManager.getInstance().getString("resources","LINK_SHORTENED_ERROR_MSG")));
			}
		}

		private function openHandler(event:Event):void {
			trace("openHandler: " + event);
		}

		private function progressHandler(event:ProgressEvent):void {
			trace("progressHandler loaded:" + event.bytesLoaded + " total: " + event.bytesTotal);
		}

		private function securityErrorHandler(event:SecurityErrorEvent):void {
			this.dispatchEvent(new UrlShortenerEvent(UrlShortenerEvent.URL_SHORTENING_ERROR, true, false,"",ResourceManager.getInstance().getString("resources","LINK_SHORTENED_ERROR_MSG")));			
			this.dispatchEvent(new StatusMessageEvent(StatusMessageEvent.UPDATE_STATUS, true, false, ResourceManager.getInstance().getString("resources","LINK_SHORTENED_ERROR_MSG")));
		}

		private function httpStatusHandler(event:HTTPStatusEvent):void {
			trace("httpStatusHandler: " + event);
		}

		private function ioErrorHandler(event:IOErrorEvent):void {
			this.dispatchEvent(new UrlShortenerEvent(UrlShortenerEvent.URL_SHORTENING_ERROR, true, false,"",ResourceManager.getInstance().getString("resources","LINK_SHORTENED_ERROR_MSG")));
			this.dispatchEvent(new StatusMessageEvent(StatusMessageEvent.UPDATE_STATUS, true, false, ResourceManager.getInstance().getString("resources","LINK_SHORTENED_ERROR_MSG")));
		}
	}
}