package mvc.view {
	import mvc.signals.SearchQuerySignal;
	import mvc.view.ui.SearchBox;

	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author Ryan Yacyshyn
	 */
	public class SearchBoxMediator extends Mediator {
		
		[Inject]
		public var view:SearchBox;
		
		[Inject]
		public var searchSignal:SearchQuerySignal;
		
		override public function onRegister():void {
			view.searchClicked.add (searchRequested);
		}

		private function searchRequested(query:String):void {
			searchSignal.dispatch(query);
		}
	}
}
