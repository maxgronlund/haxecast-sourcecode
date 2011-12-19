import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

class Dial extends MouseHandler
{
  private var multiStateImage:MultiStateImage;
  private var hitPoint:Float;
  private var startPos:Float;
  private var endPos:Float;
  private var lastVal:Float;
  private var update:Dynamic;

  private var mouseRange:Float;
  private var imageFrames:Float;
  private var ratio:Float;

  
  public function new(update:Dynamic = null)
  {
    super();
    this.update = update;
    multiStateImage = new MultiStateImage(new DialBitmap(), 49 ,46);
    addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

    mouseRange = 78;
    imageFrames = 26;
    ratio = imageFrames/mouseRange;

    endPos = 0;
    startPos = 0;
	
  }
  public function onAddedToStage(e:Event){
    removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    addChild(multiStateImage);
  }
  
  override private function onMouseDown(e:MouseEvent)
  {	
    super.onMouseDown(e); 
    hitPoint = e.stageY;
    startPos = endPos;
  }

  override private function onMouseUp(e:MouseEvent)
  {	
    super.onMouseUp(e); 
    if(endPos <0) endPos = 0;
    else if(endPos > mouseRange) endPos = mouseRange;
  }

  override private function onMouseMove(e:MouseEvent):Void{
    endPos = (startPos + hitPoint - e.stageY);

    var newVal:Float = endPos * ratio;
    if (newVal < 0 ) newVal = 0;
    else if (newVal > imageFrames) newVal = imageFrames; 

    if(lastVal != newVal ){
      lastVal = newVal;
      multiStateImage.state(0, Std.int(lastVal) );

      if(update) update(lastVal/imageFrames); 

    }
  }

  public function setPos(pos:Float):Void{ 

    if (pos < 0 ) pos = 0;
    else if(pos > 1) pos = 1;

    lastVal = pos * imageFrames;

    endPos = lastVal/ratio;
    multiStateImage.state(0, Std.int(lastVal) ); 
  }

}