package;

import flash.events.MouseEvent;
import flash.events.Event;
import flash.ui.Mouse;
import flash.display.Sprite;

class MouseClick extends Sprite
{
		var counter:Int;

	public function new()
	{
		super();
		trace('grr');
		
	}
	
	private function onMouseDown(e:MouseEvent){	
		
		
		counter++;
		trace("hello","warning", 123, counter);
	}
	
	public function init():Void{
		addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		
	}
}