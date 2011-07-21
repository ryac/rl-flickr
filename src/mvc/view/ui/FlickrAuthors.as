package mvc.view.ui {
	import mvc.service.vo.FlickrPhoto;
	import com.bit101.components.List;

	import flash.display.DisplayObjectContainer;

	/**
	 * @author Ryan Yacyshyn
	 */
	public class FlickrAuthors extends List {
		
		public function FlickrAuthors(parent:DisplayObjectContainer = null, xpos:Number = 0, ypos:Number = 0, items:Array = null) {
			super(parent, xpos, ypos, items);
			alternateRows = true;
		}

		public function populateList(photos:Array):void {
			removeAll();
			var iLen:uint = photos.length;
			var fvo:FlickrPhoto;
			for (var i:uint = 0; i < iLen; i++) {
				fvo = photos[i] as FlickrPhoto;
				addItem({label: fvo.title});
			}
		}

		public function clear():void {
			removeAll();
			addItem ({label:""}); // List doesnt seem to clear without this..
		}
	}
}
