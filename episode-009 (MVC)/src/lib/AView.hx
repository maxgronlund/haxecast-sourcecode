// abstrace class defining interface for views

import flash.display.Sprite;
import flash.events.Event;


class AView extends Sprite
{
	private var model:Model;
  private var controller:IController;

	public function onAddedToStage(e:Event):Void{
		trace("onAddedToStage: must be overriden in a subclass");
	}
	
	public function setPos(e:UIEvent):Void{
		trace("setPos: must be overriden in a subclass");
	}

}


