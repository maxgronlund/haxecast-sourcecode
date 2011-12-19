import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

class Slider extends MouseHandler
{
  private var sliderBackBitmap:SliderBackBitmap;
  private var sliderHandleBitmap:SliderHandleBitmap;
  private var hitPoint:Float;
  private var startPos:Float;
  private var endPos:Float;
  private var lastVal:Float;
  private var update:Dynamic;

  private var mouseRange:Float;
  private var ratio:Float;

  
  public function new(update:Dynamic = null){
    super();
    this.update = update;
    sliderBackBitmap = new SliderBackBitmap();
    sliderHandleBitmap = new SliderHandleBitmap();
    addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

    mouseRange = 117;
    endPos = 0;
    startPos = 0;
	
  }
  public function onAddedToStage(e:Event){
    addChild(sliderBackBitmap);
    addChild(sliderHandleBitmap);
		sliderBackBitmap.x = 12;
		sliderBackBitmap.y = 9;

  }
  
  override private function onMouseDown(e:MouseEvent){	
    super.onMouseDown(e); 
    hitPoint = e.stageY;
    startPos = endPos;
  }

  override private function onMouseUp(e:MouseEvent){	
    super.onMouseUp(e); 
    if(endPos <0) endPos = 0;
    else if(endPos > mouseRange) endPos = mouseRange;
  }

  override private function onMouseMove(e:MouseEvent):Void{
    endPos = (startPos +   e.stageY -hitPoint);

   var newVal:Float = endPos ;
   if (newVal < 0 ) newVal = 0;
   else if (newVal > mouseRange) newVal = mouseRange; 

    if(lastVal != newVal ){
      lastVal = newVal;
      sliderHandleBitmap.y = lastVal;

      var value:Float = 1 - lastVal/mouseRange;
      if(update) update(value); 
    }
  }

  public function setPos(pos:Float):Void{ 
    if (pos < 0 ) pos = 0;
    else if(pos > 1) pos = 1;

    pos = 1-pos;
    endPos = pos * mouseRange;
    
    lastVal = pos * mouseRange;
    sliderHandleBitmap.y = lastVal;
  }

}