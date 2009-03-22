package com.gdakram.utils
{
	public class IsGdUrlShortener extends UrlShortener
	{
		public static const SHORTENING_URL:String = "http://is.gd/api.php?longurl=";
		
		public function IsGdUrlShortener(urlToShorten:String)
		{
			super(SHORTENING_URL,urlToShorten);
		}
		
	}
}