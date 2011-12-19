import flash.events.EventDispatcher;
import flash.events.Event;

class Model extends EventDispatcher
{
  public function new(){
    super();
  }
  
  public function update( id:String, index:UInt, value:Float):Void{
		switch(id){
			case 'channel_loaded':{
				dispatchEvent(new UIEvent(id, index, value));	
			}
			case 'channel_volume':{
				dispatchEvent(new UIEvent(id, index, value));	
			}
			case 'channel_pan':{
				dispatchEvent(new UIEvent(id, index, value));	
			}
			case 'master_volume':{
				dispatchEvent(new UIEvent(id, index, value));	
			}
			case 'master_pan':{
				dispatchEvent(new UIEvent(id, index, value));	
			}
			case 'play':{
				dispatchEvent(new UIEvent(id, index, value));	
			}
			default:
		}
  }
}