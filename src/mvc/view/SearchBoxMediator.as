package mvc.view {
	import mvc.service.ISearchService;
	import mvc.model.FlickrModel;
	import mvc.view.events.SearchEvent;
	import mvc.view.ui.SearchBox;

	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author Ryan Yacyshyn
	 */
	public class SearchBoxMediator extends Mediator {
		
		[Inject]
		public var view:SearchBox;
		
		[Inject]
		public var flickrModel:FlickrModel;
		
		[Inject]
		public var service:ISearchService;
		
		override public function onRegister():void {
			addViewListener(SearchEvent.SEARCH_REQUEST, onSearchRequest, SearchEvent, false, 0, true);
		}

		private function onSearchRequest(e:SearchEvent):void {
			flickrModel.clearData ();
			service.getResults(e.query);
		}
	}
}
