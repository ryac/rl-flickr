package mvc {
	import mvc.controller.StartupCommand;

	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.SignalContext;

	import flash.display.DisplayObjectContainer;

	/**
	 * @author Ryan Yacyshyn
	 */
	public class MainContext extends SignalContext {
		
		public function MainContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true) {
			super(contextView, autoStartup);
		}
		
		override public function startup():void {
			
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartupCommand);
			
			super.startup();
		}
	}
}
