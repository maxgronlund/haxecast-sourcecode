package;


import nme.display.Bitmap;
import nme.display.Sprite;
import nme.display.StageAlign;
import nme.display.StageScaleMode;
import nme.events.Event;
import nme.Assets;
import nme.Lib;


/**
 * @author Joshua Granick
 */
class DisplayingABitmap extends Sprite {
	
	
	//private var logo:Bitmap;
	
	private var dial:Dial;
	
	
	public function new () {
		
		super ();
		
		addEventListener (Event.ADDED_TO_STAGE, this_onAddedToStage);
		
	}
	
	
	private function construct () {
		
		stage.align = StageAlign.TOP_LEFT;
		stage.scaleMode = StageScaleMode.NO_SCALE;
		
//		logo = new Bitmap (Assets.getBitmapData ("assets/nme.png"));
		dial = new Dial(update);
		resize();
//		addChild (logo);
		addChild (dial);
		stage.addEventListener (Event.RESIZE, stage_onResize);
		
	}
	
	
	private function resize () {
		
//		dial.x = (stage.stageWidth - dial.width) / 2;
//		dial.y = (stage.stageHeight - dial.height) / 2;
		dial.x = stage.stageWidth - 50;
		dial.y = 10;
		
	}
	
	public function update(v:Float):Void{
    //trace(v);
  }
	
	
	
	
	
	// Event Handlers
	
	
	
	
	private function stage_onResize (event:Event):Void {
		
		resize ();
		
	}
	
	
	private function this_onAddedToStage (event:Event):Void {
		
		construct ();
		
	}
	
	
	
	
	// Entry point
	
	
	
	
	public static function main () {
		
		Lib.current.addChild (new DisplayingABitmap ());
		
	}
	
	
}
