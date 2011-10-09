import flash.events.Event;
import flash.display.Sprite;

class Meter extends Sprite
{
  private var multiStateImage:MultiStateImage;
  
  public function new(update:Dynamic = null){
	super();
    multiStateImage = new MultiStateImage(new MeterBitmap(), 7 ,17);
    addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
  }

  public function onAddedToStage(e:Event){
    addChild(multiStateImage);

  }
  
  public function setPos(pos:Float):Void{ 

    if (pos < 0 ) pos = 0;
    else if(pos > 1) pos = 1;
    
    multiStateImage.state(Std.int(pos*8) ); 
  }
}