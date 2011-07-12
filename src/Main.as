package {
	import mvc.view.ui.SearchBox;

	import flash.system.Security;

	import mvc.MainContext;
	import mvc.view.ui.FlickrAuthors;
	import mvc.view.ui.PhotoHolder;

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;

	/**
	 * @author Ryan Yacyshyn
	 */
	public class Main extends Sprite {
		
		private var flickrAuthors:FlickrAuthors;
		private var photoHolder:PhotoHolder;
		private var searchBox:SearchBox;
		
		private var context:MainContext;
		
		public function Main() {
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			for (var i:uint = 1; i < 7; i++) {
				Security.loadPolicyFile ("http://farm" + i + ".static.flickr.com/crossdomain.xml");
			}
			
			context = new MainContext(this);
		}

		/**
		 * Called from ApplicationMediator's onRegister()..
		 */
		public function init ():void {
			
			searchBox = new SearchBox();
			searchBox.x = 10;
			searchBox.y = 10;
			addChild(searchBox);
			
			flickrAuthors = new FlickrAuthors ();
			flickrAuthors.x = 10;
			flickrAuthors.y = 36;
			flickrAuthors.width = 300;
			flickrAuthors.height = 350;
			addChild (flickrAuthors);
			
			photoHolder = new PhotoHolder ();
			photoHolder.x = 320;
			photoHolder.y = 36;
			addChild (photoHolder);
			
		}
		
	}
}
