package mvc.service {
	import mvc.service.vo.FlickrPhoto;

	/**
	 * @author Ryan Yacyshyn
	 */
	public class FlickrSearchResultsParser implements ISearchResultParser {
		
		public function parseSerachResults(results:Object):Array {
			var photos:Array = [];
			
			var xml:XML = new XML(results);
			
			var photo:FlickrPhoto;
			for each (var item:XML in xml.photos.photo) {
				photo = new FlickrPhoto ();
				photo.title = item.@title;
				photo.path = "http://farm" + item.@farm + ".static.flickr.com/" + item.@server + "/" + item.@id + "_" + item.@secret + ".jpg";
				photos.push (photo);
			}
			
			return photos;
		}
		
	}
}
