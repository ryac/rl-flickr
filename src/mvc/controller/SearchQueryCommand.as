package mvc.controller {
	import mvc.service.ISearchService;
	import mvc.model.FlickrModel;

	import org.robotlegs.mvcs.SignalCommand;

	/**
	 * @author Ryan Yacyshyn
	 */
	public class SearchQueryCommand extends SignalCommand {
		
		[Inject]
		public var query:String;
		
		[Inject]
		public var model:FlickrModel;
		
		[Inject]
		public var service:ISearchService;
		
		override public function execute():void {
			model.clearData ();
			service.getResults(query);
		}
	}
}
