import flash.display.Sprite;
import flash.events.Event;
import flash.display.Shape;
import flash.display.Bitmap;

class MultiStateImage extends Sprite
{
  private var bmp:Bitmap; 
  private var mask_width:Int;
  private var mask_height:Int;
  
  public function new(bmp:Bitmap, mask_width:Int, mask_height:Int)
  {
    super();
    this.bmp = bmp;
    this.mask_width = mask_width;
    this.mask_height = mask_height;
    addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);		
  }
  
  public function onAddedToStage(e:Event)
  {
    addChild(bmp);
    var mask:Shape  = new Shape();
    mask.graphics.beginFill ( 0x9900FF );
    mask.graphics.drawRect ( 0, 0,mask_width,mask_height);
    mask.graphics.endFill();
    addChild(mask);
    mask.visible = false;
    // apply mask
    bmp.mask = mask;
  }
  
  public function state(stateX:Int, stateY:Int = 0){	
    bmp.x = -stateX* mask_width;
    bmp.y = -stateY* mask_height;
  }
}