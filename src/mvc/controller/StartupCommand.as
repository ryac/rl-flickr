package mvc.controller {
	import mvc.model.FlickrModel;
	import mvc.signals.DataReadySignal;

	import org.robotlegs.mvcs.Command;

	/**
	 * @author Ryan Yacyshyn
	 */
	public class StartupCommand extends Command {
		
		[Inject]
		public var model:FlickrModel;
		
		override public function execute():void {
			trace ("in execute..");
			injector.mapValue(DataReadySignal, model.dataReadySignal);
		}
	}
}
