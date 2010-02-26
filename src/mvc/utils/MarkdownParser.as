package mvc.utils
{
	import cmodule.markdown.CLibInit;

	public class MarkdownParser
	{
		
		private static var parser : Object = new CLibInit().init();
		
		public static function parseMarkdown(parseData : String):String{
			return parser.markdown(parseData, 0);
		}
		
	}
}