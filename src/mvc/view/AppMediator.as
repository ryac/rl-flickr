package mvc.view {
	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author Ryan Yacyshyn
	 */
	public class AppMediator extends Mediator {
		
		[Inject]
		public var view:Main;
		
		override public function onRegister():void {
			view.init();
		}
	}
}
