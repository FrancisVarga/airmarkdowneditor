package mvc.views.markdown
{
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	import mvc.views.markdown.*;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class MarkdownEditorMediator extends Mediator
	{
		
		[Inject]
		public var view : MarkdownEditor;
		
		private var stringToSave : String;
		
		public function MarkdownEditorMediator()
		{
			super();
		}
		
		override public function onRegister() : void{
			
			eventMap.mapListener(view, MarkdownEditorEvent.SAVE_HTML, onSaveHTML);
			eventMap.mapListener(view, MarkdownEditorEvent.SAVE_MARKDOWN, onSaveMarkdown);
			eventMap.mapListener(view, MarkdownEditorEvent.OPEN_MARKDOWN, onOpenMDFile);
			eventMap.mapListener(eventDispatcher, MarkdownEditorEvent.OPEN_MARKDOWN_FILE, dropedFileHandler);
			
		}
		
		private function onOpenMDFile(event : MarkdownEditorEvent):void{
			
			var file : File = File.desktopDirectory;		
			file.addEventListener(Event.SELECT, onOpenFileSelect);
			file.browseForOpen("Open Markdown File");
			
		}
		
		private function onOpenFileSelect(event : Event):void{
				
			var currentFile : File = event.currentTarget as File;
			readMDFile(currentFile);
			
		}
		
		private function dropedFileHandler(event : MarkdownEditorEvent):void{
			readMDFile(event.mdFile);	
		}
		
		private function readMDFile(file : File):void{
			
			var fileStream : FileStream = new FileStream();
			fileStream.open(file, FileMode.READ);
			var content : String = fileStream.readUTFBytes(fileStream.bytesAvailable);
			view.markdownTxt = content;
				
		}
		
		private function onSaveHTML(event : MarkdownEditorEvent):void{
			
			var file : File = File.desktopDirectory;
			stringToSave = event.saveString;
			file.addEventListener(Event.SELECT, onFileSelect);
			file.browseForSave("Save HTML");
			
		}
		
		private function onSaveMarkdown(event : MarkdownEditorEvent):void{
		
			var file : File = File.desktopDirectory;
			stringToSave = event.saveString;
			file.addEventListener(Event.SELECT, onFileSelect);
			file.browseForSave("Save Markdown");
		
		}
		
		private function onFileSelect(event : Event):void{
			
			var myEvent : MarkdownEditorEvent = new MarkdownEditorEvent(MarkdownEditorEvent.WRITE_FILE);
			myEvent.fileToWrite = event.currentTarget as File;
			myEvent.saveString = stringToSave;
			dispatch(myEvent);
			
		}
		
		public function toString():String{ return "cc.varga.modules.markdown.mvc.views.markdown.MarkdownEditorMediator"; }
		
	}
}