import flash.Lib;
import flash.events.Event;
import flash.display.BitmapData;
import flash.display.Bitmap;
import flash.events.Event;

class Main
{
  private var rightSidebar:Bitmap;
  private var rightSidebarData:BitmapData;
  
  static function main(){
    new Main();
  }

  public function new(){
    trace('Hello HaXe!');
    rightSidebarData 	= new BitmapData(100,30,false,0x000000 );
    rightSidebar		= new Bitmap(rightSidebarData);
    Lib.current.addChild(rightSidebar);
    updateSize(Lib.current.stage.stageWidth,Lib.current.stage.stageHeight);
    Lib.current.stage.addEventListener(Event.RESIZE, resizeHandler);
  }
  
  function resizeHandler(e:Event):Void{
    updateSize(Lib.current.stage.stageWidth,Lib.current.stage.stageHeight);
  }

  private function updateSize(sizeX:Float,sizeY:Float):Void
  {
    rightSidebar.x = Lib.current.stage.stageWidth - rightSidebar.width;
    rightSidebar.height = Lib.current.stage.stageHeight;
  }
}

