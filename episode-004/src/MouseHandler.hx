import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.events.Event;


class MouseHandler extends Sprite
{

	public function new()
	{
		super();
		trace(MouseEvent.MOUSE_DOWN);
		addChild(new HaxeCastsBitmap());
		addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		addEventListener(MouseEvent.ROLL_OVER, onMouseOver);
	}
	
	private function onMouseOver(e:MouseEvent):Void
	{
		trace('mouse over');
		removeEventListener(MouseEvent.ROLL_OVER, onMouseOver);
		addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		addEventListener(MouseEvent.ROLL_OUT, onMouseOut);	
	}
	
	private function onMouseOut(e:MouseEvent)
	{
		trace('mouse out');
		removeEventListener(MouseEvent.ROLL_OUT, onMouseOut);
		addEventListener(MouseEvent.ROLL_OVER, onMouseOver);
		addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
	}
	private function onMouseDown(e:MouseEvent)
	{	
		trace('mouse down');
		removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
	}
	
	private function onMouseUp(e:MouseEvent)
	{
		trace('mouse up');
		
		stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
	}
	
	private function onMouseMove(e:MouseEvent)
	{
		trace('mouse move');
	}
}