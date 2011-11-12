// abstrace class defining interface for views

import flash.display.Sprite;
import flash.events.Event;


class AView extends Sprite
{

	public function onAddedToStage(e:Event):Void{
		trace("onAddedToStage: must be overriden in a subclass");
	}
	
	public function setPos(e:AppEvent):Void{
		trace("setPos: must be overriden in a subclass");
	}

}


