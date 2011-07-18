package mvc.model {
	import mvc.model.events.FlickrEvent;
	import mvc.signals.DataReadySignal;
	import mvc.view.events.PhotoEvent;

	import org.robotlegs.mvcs.Actor;

	/**
	 * @author Ryan Yacyshyn
	 */
	public class FlickrModel extends Actor {
		
		private var _photos:Array;
		private var _index:int;
		
		public var dataReadySignal:DataReadySignal;
		
		public function FlickrModel() {
			super();
			dataReadySignal = new DataReadySignal ();
		}
		
		public function set photos(photos:Array):void {
			_photos = photos;
			trace ("dispatch! photos are in model..");
//			dispatch (new FlickrEvent (FlickrEvent.PHOTOS_LOADED, _photos));
			dataReadySignal.dispatch(_photos);
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
