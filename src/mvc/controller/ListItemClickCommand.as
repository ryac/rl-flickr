package mvc.controller {
	import mvc.model.FlickrModel;

	import org.robotlegs.mvcs.Command;

	/**
	 * @author Ryan Yacyshyn
	 */
	public class ListItemClickCommand extends Command {
		
		[Inject]
		public var id:int;
		
		[Inject]
		public var model:FlickrModel;
		
		override public function execute():void {
			model.updateSelectedPhoto (id);
		}
	}
}
