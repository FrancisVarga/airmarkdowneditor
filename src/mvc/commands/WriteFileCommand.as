package mvc.commands
{
	
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	import mvc.views.markdown.MarkdownEditorEvent;
	
	import org.robotlegs.mvcs.Command;
	
	public class WriteFileCommand extends Command
	{
		
		[Inject]
		public var event : MarkdownEditorEvent;
		
		public function WriteFileCommand()
		{
			super();
		}
		
		override public function execute() : void{
			
			trace("Write file");
			
			var fileStream : FileStream = new FileStream();
			fileStream.open(event.fileToWrite, FileMode.WRITE);
			fileStream.writeUTFBytes(event.saveString);
			fileStream.close();
			
		}
		
	}
}