import flash.display.Sprite;
import flash.events.Event;

class SliderView extends AView
{
  private var model:Model;
  private var controller:IController;
  private var slider:Slider;
  private var id:String;
  
  public function new(model:Model, controller:IController, id:String )
  {
    super();
    this.model 	= model;
    this.controller = controller;
    this.id = id;
    
    slider = new Slider(update);
    
    addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    model.addEventListener( id, setPos);
  }
  
  override public function onAddedToStage(e:Event){
    removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    addChild(slider);
  }

  override public function setPos(e:AppEvent):Void{
  // trace(e.getPos());
    slider.setPos(e.getPos());
  }  

// private functions  
  private function update(val:Float):Void{
    controller.update(id, val);
  }

}