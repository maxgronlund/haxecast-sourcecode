import flash.display.Sprite;
import flash.events.Event;

class ChannelView extends AView
{

  private var slider:Slider;
 private var dial:Dial;
  private var id:String;
	private var index:UInt;
  
  public function new(model:Model, controller:IController, index:UInt, id:String )
  {
    super();
    this.model 	= model;
    this.controller = controller;
		this.index = index;
    this.id = id;
    
		dial = new Dial(updatePan);
    slider = new Slider(updateVolume);

    addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    //model.addEventListener( id, setPos);
		//var s:String = Std.string(id);
  }
  
  override public function onAddedToStage(e:Event){
    removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		
    addChild(dial);
		addChild(slider);
		slider.x = 7;
		slider.y = 40;
		model.addEventListener('channel_loaded', onAudioChannelLoaded);

  }

	private function onAudioChannelLoaded(e:UIEvent):Void{
		dial.setPos(0.5);
		slider.setPos(0.71);
	}

  override public function setPos(e:UIEvent):Void{
    slider.setPos(e.getPos());
  }  

// private functions  
  private function updateVolume( val:Float):Void{
    controller.update(id + '_volume', index, val);
  }

	private function updatePan( val:Float):Void{
    controller.update(id+ '_pan', index, val);
  }

}