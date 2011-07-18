package mvc.view {
	import mvc.model.FlickrModel;
	import mvc.model.events.FlickrEvent;
	import mvc.signals.DataReadySignal;
	import mvc.view.ui.FlickrAuthors;

	import org.robotlegs.mvcs.SignalMediator;

	import flash.events.Event;

	/**
	 * @author Ryan Yacyshyn
	 */
	public class FlickrAuthorsMediator extends SignalMediator {
		
		[Inject]
		public var view:FlickrAuthors;
		
		[Inject]
		public var flickrModel:FlickrModel;
		
		[Inject]
		public var dataReadySignal:DataReadySignal;
		
		override public function onRegister():void {
			
			addViewListener(Event.SELECT, onSelected, Event, false, 0, true);
			
			addToSignal(dataReadySignal, onDataReady);
			
//			addContextListener(FlickrEvent.PHOTOS_LOADED, onPhotosLoaded, FlickrEvent, false, 0, true);
			addContextListener(FlickrEvent.CLEAR, onClear, FlickrEvent, false, 0, true);
		}

		private function onDataReady(photos:Array):void {
			view.populateList (photos);
		}

		private function onClear(e:FlickrEvent):void {
			view.clear();
		}

		private function onSelected(e:Event):void {
			flickrModel.updateSelectedPhoto (view.selectedIndex);
		}

		private function onPhotosLoaded(e:FlickrEvent):void {
			view.populateList (e.photos);
		}
	}
}
