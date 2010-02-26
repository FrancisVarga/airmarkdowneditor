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
		public static const OPEN_MARKDOWN_FILE : String = "open_md_file";
		public static const OPEN_MARKDOWN_FILE_URL : String = "OPEN_MARKDOWN_FILE_URL";
		public static const SAVE_CURRENT_MD_FILE : String = "SAVE_CURRENT_MD_FILE";
		
		public var mdFile : File;
		public var saveString : String;
		public var fileToWrite : File;
		public var mdFileURL : String;

		public function MarkdownEditorEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}