package mvc.views.markdown
{
	import flash.events.Event;
	import flash.filesystem.File;
	
	public class MarkdownEditorEvent extends Event
	{
		
		public static const SAVE_MARKDOWN : String = "save_markdown";
		public static const SAVE_HTML : String = "save_html";
		public static const OPEN_MARKDOWN : String = "open_markdown";
		public static const WRITE_FILE : String = "write_file";
		
		public var saveString : String;
		public var fileToWrite : File;
		
		public function MarkdownEditorEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}