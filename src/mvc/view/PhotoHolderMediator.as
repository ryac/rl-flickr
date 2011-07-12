package mvc.view {
	import mvc.model.events.FlickrEvent;
	import mvc.view.events.PhotoEvent;
	import mvc.view.ui.PhotoHolder;
	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author Ryan Yacyshyn
	 */
	public class PhotoHolderMediator extends Mediator {
		
		[Inject]
		public var view:PhotoHolder;
		
		override public function onRegister():void {
			addContextListener(PhotoEvent.LOAD_PHOTO, onPhotoChanged, PhotoEvent, false, 0, true);			addContextListener(FlickrEvent.CLEAR, onClear, FlickrEvent, false, 0, true);
		}

		private function onClear(e:FlickrEvent):void {
			view.clear ();
		}

		private function onPhotoChanged(e:PhotoEvent):void {
			view.loadPhoto (e.photo);
		}
	}
}
