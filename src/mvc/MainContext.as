package mvc {
	import mvc.controller.StartupCommand;

	import org.robotlegs.base.ContextEvent;

	import mvc.controller.SearchQueryCommand;
	import mvc.model.FlickrModel;
	import mvc.service.FlickrSearchResultsParser;
	import mvc.service.FlickrSearchService;
	import mvc.service.ISearchResultParser;
	import mvc.service.ISearchService;
	import mvc.signals.DataReadySignal;
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
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartupCommand);
			
			injector.mapSingletonOf(ISearchService, FlickrSearchService);
			injector.mapSingletonOf(ISearchResultParser, FlickrSearchResultsParser);
			injector.mapSingleton(FlickrModel);
			
//			var model:FlickrModel = injector.getInstance(FlickrModel);
//			injector.mapValue(DataReadySignal, model.dataReadySignal);
			
			signalCommandMap.mapSignalClass(SearchQuerySignal, SearchQueryCommand);
			
			mediatorMap.mapView(FlickrAuthors, FlickrAuthorsMediator);
			mediatorMap.mapView(PhotoHolder, PhotoHolderMediator);
			mediatorMap.mapView(SearchBox, SearchBoxMediator);
			mediatorMap.mapView(Main, AppMediator);
			
			super.startup();
		}
	}
}
