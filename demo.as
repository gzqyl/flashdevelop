package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;

	// This line sets the background color and frame rate
	[SWF(backgroundColor="#000000", frameRate="30", width="800", height="600")]

	public class Main extends Sprite 
	{
		private var statusField:TextField;

		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			// Setup Text Format: White color (0xFFFFFF)
			var format:TextFormat = new TextFormat();
			format.size = 30;
			format.font = "_sans";
			format.bold = true;
			format.color = 0xFFFFFF; 

			// Setup Text Field
			statusField = new TextField();
			statusField.defaultTextFormat = format;
			statusField.autoSize = TextFieldAutoSize.LEFT;
			statusField.text = "Waiting for input (1,2,3,4, SPACE, P, M, ESC, WASD)...";
			
			// Center the text slightly
			statusField.x = 50;
			statusField.y = 200;
			
			addChild(statusField);

			// Add Keyboard Listener
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);
		}

		private function onKeyPress(event:KeyboardEvent):void 
		{
			var keyName:String = "";
			
			switch(event.keyCode) 
			{
				case 49: keyName = "1"; break;
				case 50: keyName = "2"; break;
				case 51: keyName = "3"; break;
				case 52: keyName = "4"; break;
				case 32: keyName = "SPACE"; break;
				case 80: keyName = "P"; break;
				case 77: keyName = "M"; break;
				case 27: keyName = "ESCAPE"; break;
				case 87: keyName = "W"; break;
				case 65: keyName = "A"; break;
				case 83: keyName = "S"; break;
				case 68: keyName = "D"; break;
				default: keyName = "Key Code: " + event.keyCode;
			}
			
			statusField.text = "Detected Key: " + keyName;
		}
	}
}
