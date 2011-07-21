package mvc.controller {
	import mvc.model.FlickrModel;
	import mvc.service.FlickrSearchResultsParser;
	import mvc.service.FlickrSearchService;
	import mvc.service.ISearchResultParser;
	import mvc.service.ISearchService;
	import mvc.signals.ListItemClickSignal;
	import mvc.signals.SearchQuerySignal;
	import mvc.view.AppMediator;
	import mvc.view.FlickrAuthorsMediator;
	import mvc.view.PhotoHolderMediator;
	import mvc.view.SearchBoxMediator;
	import mvc.view.ui.FlickrAuthors;
	import mvc.view.ui.PhotoHolder;
	import mvc.view.ui.SearchBox;

	import org.robotlegs.mvcs.SignalCommand;

	/**
	 * @author Ryan Yacyshyn
	 */
	public class StartupCommand extends SignalCommand {

		override public function execute():void {
			trace ("in execute..");
			
			injector.mapSingleton(FlickrModel);
			injector.mapSingletonOf(ISearchService, FlickrSearchService);
			injector.mapSingletonOf(ISearchResultParser, FlickrSearchResultsParser);
			
			signalCommandMap.mapSignalClass(SearchQuerySignal, SearchQueryCommand);
			signalCommandMap.mapSignalClass(ListItemClickSignal, ListItemClickCommand);
			
			mediatorMap.mapView(FlickrAuthors, FlickrAuthorsMediator);
			mediatorMap.mapView(PhotoHolder, PhotoHolderMediator);
			mediatorMap.mapView(SearchBox, SearchBoxMediator);
			mediatorMap.mapView(Main, AppMediator); // this one must be last..!
			
		}
	}
}
