package mvc.controller {
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
		
		override public function execute():void {
			trace ("in execute, query:", query);
		}
	}
}
