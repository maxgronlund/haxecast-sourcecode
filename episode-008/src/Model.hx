import flash.events.EventDispatcher;
import flash.events.Event;

class Model extends EventDispatcher
{
  public function new(){
    super();
  }
  
  public function update( id:String, value:Float):Void{
    dispatchEvent(new AppEvent(id, value));	
  }
}