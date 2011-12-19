import flash.Lib;
import flash.events.Event;

class Main{
  private var consoleWindow:ConsoleWindow;
  
  static function main(){
    new Main();
  }
  
  public function new(){
    consoleWindow = new ConsoleWindow();
    Lib.current.addChild(consoleWindow);
    updateSize(Lib.current.stage.stageWidth,Lib.current.stage.stageHeight);
    Lib.current.stage.addEventListener(Event.RESIZE, resizeHandler);
  }
  
  function resizeHandler(e:Event):Void{
    updateSize(Lib.current.stage.stageWidth,Lib.current.stage.stageHeight);
  }
  
  private function updateSize(sizeX:Float,sizeY:Float):Void{
    consoleWindow.setSize(sizeX,sizeY);
  }
}

