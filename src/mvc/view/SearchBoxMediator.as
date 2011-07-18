package mvc.view {
	import mvc.signals.SearchQuerySignal;
	import mvc.view.ui.SearchBox;

	import org.robotlegs.mvcs.SignalMediator;

	/**
	 * @author Ryan Yacyshyn
	 */
	public class SearchBoxMediator extends SignalMediator {
		
		[Inject]
		public var view:SearchBox;
		
		[Inject]
		public var searchSignal:SearchQuerySignal;
		
		override public function onRegister():void {
//			view.searchClicked.add (searchRequested);
			addToSignal(view.searchClicked, searchRequested);
		}

		private function searchRequested(query:String):void {
			searchSignal.dispatch(query);
		}
	}
}
