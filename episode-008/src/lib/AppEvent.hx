package;

import flash.events.Event;

class AppEvent extends Event
{
	private var pos:Float;
	public function new( label:String, pos:Float, bubbles:Bool = false, cancelable:Bool = false ) {
		super( label ,bubbles, cancelable);
		this.pos = pos;
	}
	
	public function getPos():Float{
		return pos;
	}
}