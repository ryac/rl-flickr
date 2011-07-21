package mvc.model {
	import mvc.model.events.FlickrEvent;
	import mvc.view.events.PhotoEvent;

	import org.robotlegs.mvcs.Actor;

	/**
	 * @author Ryan Yacyshyn
	 */
	public class FlickrModel extends Actor {
		
		private var _photos:Array;
		private var _index:int;
		
		public function FlickrModel() {
			super();
		}
		
		public function set photos(photos:Array):void {
			_photos = photos;
			dispatch (new FlickrEvent (FlickrEvent.PHOTOS_LOADED, _photos));
		}

		public function updateSelectedPhoto(index:int):void {
			trace ("updateSelectedPhoto in Model..");
			_index = index;
			dispatch (new PhotoEvent (PhotoEvent.LOAD_PHOTO, _photos[_index]));
		}

		public function clearData():void {
			_photos = [];
			dispatch (new FlickrEvent (FlickrEvent.CLEAR));
		}
	}
}
