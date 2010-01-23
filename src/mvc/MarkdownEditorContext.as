package mvc
{	
	import flash.display.DisplayObjectContainer;

	import mvc.commands.WriteFileCommand;
	import mvc.views.markdown.MarkdownEditorEvent;
	import mvc.views.markdown.MarkdownEditorMediator;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;
	
	public class MarkdownEditorContext extends Context
	{
		public function MarkdownEditorContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void{
			
			trace("Startup");
			
			commandMap.mapEvent(MarkdownEditorEvent.WRITE_FILE, WriteFileCommand, MarkdownEditorEvent);
			
			mediatorMap.mapView(MainMarkdownEditor, MarkdownEditorMediator);
			
			super.startup();
			
		}
		
	}
}