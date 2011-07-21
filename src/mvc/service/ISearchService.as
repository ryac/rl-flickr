package mvc.service {

	/**
	 * @author Ryan Yacyshyn
	 */
	public interface ISearchService {
		
		function getResults (forQuery:String):void;
		function set parser (value:ISearchResultParser):void;
		
	}
}
