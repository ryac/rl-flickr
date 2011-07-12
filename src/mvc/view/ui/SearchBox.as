package mvc.view.ui {
	import mvc.view.events.SearchEvent;

	import flash.events.MouseEvent;
	import com.bit101.components.PushButton;
	import com.bit101.components.InputText;
	import flash.display.Sprite;

	/**
	 * @author Ryan Yacyshyn
	 */
	public class SearchBox extends Sprite {
		
		private var input:InputText;
		public var btnSearch:PushButton;
		
		public function SearchBox() {
			
			input = new InputText ();
			input.height = 20;
			input.width = 200;
			addChild(input);
			
			btnSearch = new PushButton ();
			btnSearch.label = "Search Flickr";
			btnSearch.x = 210;
			btnSearch.width = 90;
			btnSearch.addEventListener(MouseEvent.CLICK, onSearchClick, false, 0, true);
			addChild (btnSearch);
		}

		private function onSearchClick(e:MouseEvent):void {
			if (input.text != "") dispatchEvent(new SearchEvent (SearchEvent.SEARCH_REQUEST, input.text));
		}
	}
}
