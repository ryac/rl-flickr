package mvc.signals {
	import org.osflash.signals.Signal;

	/**
	 * @author Ryan Yacyshyn
	 */
	public class SearchQuerySignal extends Signal {
		
		public function SearchQuerySignal() {
			super(String);
		}
		
	}
}
