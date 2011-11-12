import flash.display.Sprite;
import flash.events.Event;

class DialView extends AView
{
  private var model:Model;
  private var controller:IController;
  private var dial:Dial;
  private var id:String;
  
  public function new(model:Model, controller:IController, id:String )
  {
    super();
    this.model = model;
    this.controller = controller;
    this.id = id;
    
    dial = new Dial(update);
    
    addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    model.addEventListener( id, setPos);
  }
  
  override public function onAddedToStage(e:Event){
    removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    addChild(dial);
  }
  
  override public function setPos(e:AppEvent):Void{
  //	trace(e.getPos());
    dial.setPos(e.getPos());
  }

// private functions
  private function update(val:Float):Void{
    controller.update(id, val);
  }
}