package mvc.service {
	import mvc.model.FlickrModel;

	import org.osflash.signals.natives.NativeSignal;
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
		
		private var onLoadCompleted:NativeSignal;
		private var onError:NativeSignal;
		private var onSecurityError:NativeSignal;
		
		[Inject]
		public var flickrModel:FlickrModel;

		public function FlickrSearchService() {
			
			urlLoader = new URLLoader ();
			
			onLoadCompleted = new NativeSignal(urlLoader, Event.COMPLETE, Event);
			onError = new NativeSignal(urlLoader, IOErrorEvent.IO_ERROR, IOErrorEvent);
			onSecurityError = new NativeSignal(urlLoader, SecurityErrorEvent.SECURITY_ERROR, SecurityErrorEvent);
			
			addSignals ();
		}
		
		[Inject]
		public function set parser (value:ISearchResultParser):void {
			_parser = value;
		}
		
		public function getResults(forQuery:String):void {
						var url:String = "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=9a5827372138ae5acde7505b7620cf18&tags=" + forQuery + "&format=rest";
			var urlRequest:URLRequest = new URLRequest (url);
			
			urlLoader.load(urlRequest);
		}
		
		private function onLoadComplete(e:Event):void {
			trace ("onLoadComplete..");
			flickrModel.photos = _parser.parseSerachResults(urlLoader.data);
		}

		private function handleError(e:Event):void {
			trace ("something went wrong..");
		}
		
		private function addSignals ():void {
			onLoadCompleted.add (onLoadComplete);
			onError.add (handleError);
			onSecurityError.add (handleError);
		}
		
	}
}
