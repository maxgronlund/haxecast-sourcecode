import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

class Dial extends MouseHandler
{
	private var multiStateImage:MultiStateImage;
	
	public function new()
	{
		super();
		multiStateImage = new MultiStateImage(new DialBitmap(), 32 ,34);
		addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	}
	public function onAddedToStage(e:Event){
		
		addChild(multiStateImage);
	}
	
	override private function onMouseMove(e:MouseEvent):Void{
		endPos = (startPos + hitPoint - e.stageY);

		var newVal = endPos/(6*3);
		if (newVal < 0 ) newVal = 0;
		else if (newVal > 6) newVal = 6; 
		
		if(lastVal != newVal ){
			lastVal = newVal;
			var i:Int = Std.int(lastVal);
			multiStateImage.state(i);
		}	
	}
}