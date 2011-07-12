package mvc.view.ui {
	import flash.net.URLRequest;

	import mvc.service.vo.FlickrPhoto;

	import flash.events.IOErrorEvent;
	import flash.events.Event;
	import com.bit101.components.Label;

	import flash.display.Loader;
	import flash.display.Sprite;

	/**
	 * @author Ryan Yacyshyn
	 */
	public class PhotoHolder extends Sprite {
		
		private var loader:Loader;
		private var title:Label;
		
		private var _photo:FlickrPhoto;
		
		public function PhotoHolder() {
			loader = new Loader ();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadComplete, false, 0, true);			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onIOError, false, 0, true);
			
			addChild (loader);
			
			title = new Label ();
			addChild (title);
		}

		private function onIOError(e:IOErrorEvent):void {
			trace ("IOError.. cant find file.");
		}

		private function onLoadComplete(e:Event):void {
			addChild (loader);
			title.y = loader.content.height + 4;
			title.text = _photo.title;
		}

		public function loadPhoto (photo:FlickrPhoto):void {
			_photo = photo;
			title.text = "";
			loader.load(new URLRequest(_photo.path));
		}

		public function clear():void {
			title.text = "";
			removeChild (loader);
		}
	}
}
