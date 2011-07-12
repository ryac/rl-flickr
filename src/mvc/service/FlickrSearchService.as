package mvc.service {
	import mvc.model.FlickrModel;

	import org.robotlegs.mvcs.Actor;

	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	/**
	 * @author Ryan Yacyshyn
	 */
	public class FlickrSearchService extends Actor implements ISearchService {
		
		private var _parser:ISearchResultParser;
		
		private var urlLoader:URLLoader;
		
		[Inject]
		public var flickrModel:FlickrModel;
		
		public function FlickrSearchService() {
			
			urlLoader = new URLLoader ();
			
		}
		
		[Inject]
		public function set parser (value:ISearchResultParser):void {
			_parser = value;
		}
		
		public function getResults(forQuery:String = "combichrist"):void {
			trace ("in here..");
						var url:String = "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=9a5827372138ae5acde7505b7620cf18&tags=" + forQuery + "&format=rest";
			
			var urlRequest:URLRequest = new URLRequest (url);
			
			addLoaderListeners ();
			
			urlLoader.load(urlRequest);
		}
		
		private function onLoadComplete(e:Event):void {
			trace ("onLoadComplete..");
			flickrModel.photos = _parser.parseSerachResults(urlLoader.data);
			removeLoaderListeners ();
		}

		private function handleError(e:IOErrorEvent):void {
			removeLoaderListeners ();
		}
		
		private function addLoaderListeners():void {
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR, handleError, false, 0, true);
			urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, handleError, false, 0, true);			urlLoader.addEventListener(Event.COMPLETE, onLoadComplete, false, 0, true);
		}

		private function removeLoaderListeners():void {
			urlLoader.removeEventListener(IOErrorEvent.IO_ERROR, handleError);
			urlLoader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, handleError);
			urlLoader.removeEventListener(Event.COMPLETE, onLoadComplete);
		}
		
	}
}
