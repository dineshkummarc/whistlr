package com.gdakram.conf
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	public class ConfigurationManager
	{
		public static function getConfiguration():XML {
			var configFile:File = File.applicationStorageDirectory.resolvePath("config.xml");
			// incase file doesn't exist copy to storage directory
			if(!configFile.exists) {
				configFile = File.applicationDirectory.resolvePath("config.xml");
				configFile.copyTo(File.applicationStorageDirectory.resolvePath("config.xml"));
			}
			// create a file stream object to read config file
			var fStrm:FileStream = new FileStream();
			fStrm.open(configFile, FileMode.READ);
			var configData:XML = new XML(fStrm.readUTFBytes(fStrm.bytesAvailable));
			fStrm.close();
			return configData;
		}
		
		/**
		 * Gets the last.fm api key from the config.xml file
		 */ 
		public static function getLastfmAPIKey():String {
			return getConfiguration().apikeys.key.(@service == "lfm");
		}
	
		/**
		 * Gets the tra.kz key from the config.xml file 
		 */ 
		public static function getTrakzAPIKey():String {
			return getConfiguration().apikeys.key.(@service == "trakz");
		}
		
		/**
		 * Gets the application update url from the config.xml file
		 */ 
		public static function getAppUpdateUrl():String {
			return getConfiguration().update_url;
		}
		
	}
}