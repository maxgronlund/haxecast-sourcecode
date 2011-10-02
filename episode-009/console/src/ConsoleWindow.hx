import flash.net.LocalConnection;
import flash.display.Sprite;
import flash.events.Event;
import flash.text.TextField;
import flash.text.TextFormat;


class ConsoleWindow extends Sprite
{
	private var console_connection:LocalConnection;
	private var console:TextField;
	private var textFormat:TextFormat;
	private var oldMsg:String;
	private var newMsg:String;
	
	private var cnt:Int;
	
	public function new(){	
		super();
		

		newMsg = '';
		oldMsg = '';						
					
		console_connection = new LocalConnection();
		console_connection.client = this;
		console_connection.connect("haxecasts_console");
		
		textFormat = new TextFormat();
		textFormat.font = "Monaco"; // set the font
		textFormat.size = 12;                // set the font size
		textFormat.color=0xaaaaaa;           // set the color
		console = new TextField();

		
		console.multiline = true;
		console.width = 1024;
		console.height = 740;
		
		
		flash.Lib.current.addChild (console);

	}

	private function printOut(v : Dynamic, ?inf : haxe.PosInfos):Void {
		cnt++;
		newMsg = '\n'+ cnt + ': ' + inf.fileName + ' ' + inf.methodName + '()' +' line:' + inf.lineNumber + ' ' + v.toString();
		if (inf.customParams != null)						
			 newMsg += ', ' + inf.customParams;
		
		newMsg += oldMsg;//.substr(0,1200);
		oldMsg = newMsg;
		
		console.text = oldMsg;	
		console.setTextFormat(textFormat);		

	}

}

