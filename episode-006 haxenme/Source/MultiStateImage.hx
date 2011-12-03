import flash.display.Sprite;
import flash.events.Event;
import flash.display.Shape;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObject;

import nme.Assets;
import nme.Lib;

class MultiStateImage extends Sprite
{ 
  private var bmp:Bitmap; 
  private var sizeX:Int;
  private var sizeY:Int;
  
  public function new( sizeX:Int, sizeY:Int):Void{ 
    super();
    bmp = new Bitmap(Assets.getBitmapData ("assets/nme.png"));
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
  } 
  
  public function onAddedToStage(e:Event){
    addChild(bmp);
    var mask:Shape  = new Shape();
    mask.graphics.beginFill ( 0x9900FF );
    mask.graphics.drawRect ( bmp.x, bmp.y, bmp.x+ sizeX, bmp.y+ sizeY);
    mask.graphics.endFill();
    addChild(mask);
    mask.visible = false;
    bmp.mask = mask;
  }
  
  public function state(stateX:Int, stateY:Int = 0){	
		bmp.x = -stateX* sizeX;
		bmp.y = -stateY* sizeY;
  }
}