package mvc.view.events {
	import flash.events.Event;

	/**
	 * @author Ryan Yacyshyn
	 */
	public class SearchEvent extends Event {
		
		public static const SEARCH_REQUEST:String = "searchRequest";
		
		public var _query:String;
		
		public function SearchEvent(type:String, query:String = null, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
			_query = query;
		}

		override public function clone():Event {
			return new SearchEvent (type, query, bubbles, cancelable);
		}

		public function get query():String {
			return _query;
		}
	}
}
