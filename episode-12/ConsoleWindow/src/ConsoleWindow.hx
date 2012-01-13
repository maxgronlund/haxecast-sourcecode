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
  private var lineCount:Int;
  
  public function new(){	
  super();
  newMsg = '';
  oldMsg = '';
  // create and connect LocalConnection object
  console_connection = new LocalConnection();
  console_connection.client = this;
  console_connection.connect("swf_loader");

  // create and init a TextFormat object
  textFormat = new TextFormat();
  textFormat.font = "Monaco"; 
  textFormat.size = 12;
  textFormat.color=0xaaaaaa;

  // create and init a TextField
  console = new TextField();
  console.multiline = true;
  console.width = 1024;
  console.height = 740;
  // add the text field to the stage
  flash.Lib.current.addChild (console);
  }
  
  private function printOut(v : Dynamic, ?inf : haxe.PosInfos):Void {
    lineCount++;
    newMsg = '\n'+ lineCount + ': ' + inf.fileName + ' ' + inf.methodName + '()' +' line:' + inf.lineNumber + ' ' + v.toString();
    if (inf.customParams != null)
      newMsg += ', ' + inf.customParams;
    newMsg += oldMsg;
    oldMsg = newMsg;
    console.text = oldMsg;
    console.setTextFormat(textFormat);
  }

  public function setSize(sizeX:Float, sizeY:Float):Void{
    console.width = sizeX;
    console.height = sizeY;
  }
}

