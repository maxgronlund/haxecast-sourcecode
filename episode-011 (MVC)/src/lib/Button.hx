import flash.events.Event;
import flash.events.MouseEvent;
import flash.display.Bitmap;

class Button extends MouseHandler
{
  private var multiStateImage:MultiStateImage;
  private var isOn:Bool;
  private var update:Dynamic;

  public function new( bmp:Bitmap, update:Dynamic = null, sizeX:Int = 100, sizeY:Int = 100){
    super();
    this.update = update;
    multiStateImage = new MultiStateImage(bmp, sizeX ,sizeY);
    isOn = false;
	addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
  }

  public function onAddedToStage(e:Event){
    addChild(multiStateImage);
  }
  
  override private function onMouseDown(e:MouseEvent){	
    super.onMouseDown(e); 
	isOn = !isOn;
	multiStateImage.state( isOn? 1:0 );
	if(update) update(isOn);
  }

  public function setPos(isOn:Bool):Void{ 
	this.isOn = isOn;
	multiStateImage.state(isOn? 1:0 );
  }	
}
