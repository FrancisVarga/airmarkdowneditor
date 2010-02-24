package mvc
{
	import flash.desktop.ClipboardFormats;
	import flash.events.NativeDragEvent;
	import flash.filesystem.File;
	
	import mvc.views.markdown.MarkdownEditorEvent;
	
	import mx.controls.Alert;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class MainMarkdownEditorMediator extends Mediator
	{
		
		[ Inject ]
		public var view : MainMarkdownEditor;
		
		public function MainMarkdownEditorMediator()
		{
			super();
		}
		
		override public function onRegister():void{
			
			eventMap.mapListener(view, NativeDragEvent.NATIVE_DRAG_ENTER, onEnter);
			eventMap.mapListener(view, NativeDragEvent.NATIVE_DRAG_DROP, onDrop);
			
		}
		
		private function onEnter(event : NativeDragEvent):void{
			
			if (event.clipboard.hasFormat(ClipboardFormats.FILE_LIST_FORMAT))
			{
				var files:Array = event.clipboard.getData(ClipboardFormats.FILE_LIST_FORMAT) as Array;
				
				if (files.length > 1)
				{
					Alert.show("U can only one DB draggen!", "Error");
				}
				
			}
			
		}
		
		private function onDrop(event : NativeDragEvent):void{
			var arr:Array = event.clipboard.getData(ClipboardFormats.FILE_LIST_FORMAT) as Array;
			handleDropedFiles(File(arr[0]));
		}
		
		private function handleDropedFiles(dropedFiles : File):void{
			
			var event : MarkdownEditorEvent = new MarkdownEditorEvent(MarkdownEditorEvent.OPEN_MARKDOWN_FILE);
			event.mdFile = dropedFiles;
			dispatch(event);
			
		}
	}
}