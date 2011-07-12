package mvc.view.events {
	import mvc.service.vo.FlickrPhoto;

	import flash.events.Event;

	/**
	 * @author Ryan Yacyshyn
	 */
	public class PhotoEvent extends Event {
		
		public static const LOAD_PHOTO:String = "photoChanged";
		public static const TITLE_CLICKED:String = "titleClicked";
		
		public var _photo:FlickrPhoto;
		
		public function PhotoEvent(type:String, photo:FlickrPhoto = null, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
			_photo = photo;
		}
		
		override public function clone():Event {
			return new PhotoEvent (type, photo, bubbles, cancelable);
		}

		public function get photo():FlickrPhoto {
			return _photo;
		}
		
	}
}
