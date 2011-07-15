package mvc {
	import mvc.controller.SearchQueryCommand;
	import mvc.model.FlickrModel;
	import mvc.service.FlickrSearchResultsParser;
	import mvc.service.FlickrSearchService;
	import mvc.service.ISearchResultParser;
	import mvc.service.ISearchService;
	import mvc.signals.SearchQuerySignal;
	import mvc.view.AppMediator;
	import mvc.view.FlickrAuthorsMediator;
	import mvc.view.PhotoHolderMediator;
	import mvc.view.SearchBoxMediator;
	import mvc.view.ui.FlickrAuthors;
	import mvc.view.ui.PhotoHolder;
	import mvc.view.ui.SearchBox;

	import org.robotlegs.mvcs.SignalContext;

	import flash.display.DisplayObjectContainer;

	/**
	 * @author Ryan Yacyshyn
	 */
	public class MainContext extends SignalContext {
		
		public function MainContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true) {
			super(contextView, autoStartup);
		}
		
		override public function startup():void {
			
			injector.mapSingletonOf(ISearchService, FlickrSearchService);			injector.mapSingletonOf(ISearchResultParser, FlickrSearchResultsParser);
			
			signalCommandMap.mapSignalClass(SearchQuerySignal, SearchQueryCommand);
			
			injector.mapSingleton(FlickrModel);
			
			mediatorMap.mapView(FlickrAuthors, FlickrAuthorsMediator);
			mediatorMap.mapView(PhotoHolder, PhotoHolderMediator);			mediatorMap.mapView(SearchBox, SearchBoxMediator);
			mediatorMap.mapView(Main, AppMediator);
			
			super.startup();
		}
	}
}
