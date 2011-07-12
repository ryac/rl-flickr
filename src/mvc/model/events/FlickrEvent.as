package mvc.model.events {
	import flash.events.Event;

	/**
	 * @author Ryan Yacyshyn
	 */
	public class FlickrEvent extends Event {
		
		public static const PHOTOS_LOADED:String = "photosLoaded";
		public static const LOAD_PHOTO:String = "loadPhoto";
		public static const CLEAR:String = "clear";

		private var _photos:Array;
		
		public function FlickrEvent(type:String, photos:Array = null, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
			_photos = photos;
		}

		override public function clone():Event {
			return new FlickrEvent (type, photos, bubbles, cancelable);
		}
		
		public function get photos():Array {
			return _photos;
		}
	}
}
