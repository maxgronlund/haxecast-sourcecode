import flash.events.EventDispatcher;
import flash.events.Event;



class RadioModel extends EventDispatcher
{
	public function new()
	{
		super();
	}
	
	public function update( id:String, value:Float):Void{
		
	//	dispatchEvent(new Event(id));
		dispatchEvent(new AppEvent(id, value));	
	//	trace(id);
	//	trace(value);
	}
}