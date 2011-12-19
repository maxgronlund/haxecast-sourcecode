package;

import flash.events.Event;

class UIEvent extends Event
{
	
	public var pos(default, set_pos): Float;
	function set_pos(f) return pos = f
	
	public var index(default, set_index): UInt;
	function set_index(i) return index = i
	
	public var url(default, set_url): String;
	function set_url(s) return url = s
	
	
	public function new( label:String, index:UInt = 0, pos:Float = 0 ,bubbles:Bool = false, cancelable:Bool = false ) {
		super( label ,bubbles, cancelable);
		this.index = index;
		this.pos = pos;
	}
	
	public function getPos():Float{
		return pos;
	}
}