package mvc.view.ui {
	import org.osflash.signals.Signal;
	import org.osflash.signals.natives.NativeSignal;
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
		
		private var searchBtnClicked:NativeSignal;
		
		public var searchClicked:Signal;
		
		public function SearchBox() {
			
			input = new InputText ();
			input.height = 20;
			input.width = 200;
			addChild(input);
			
			btnSearch = new PushButton ();
			btnSearch.label = "Search Flickr";
			btnSearch.x = 210;
			btnSearch.width = 90;
			addChild (btnSearch);
			
			searchBtnClicked = new NativeSignal (btnSearch, MouseEvent.CLICK, MouseEvent);
			searchBtnClicked.add(onClicked);
			
			searchClicked = new Signal (String);
			
		}

		private function onClicked(e:MouseEvent):void {
			if (input.text != "") searchClicked.dispatch(input.text);
		}
		
	}
}
