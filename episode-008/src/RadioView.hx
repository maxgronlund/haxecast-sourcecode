import flash.display.Sprite;
import flash.events.Event;

class RadioView extends Sprite
{
	private var radioModel:RadioModel;
	private var radioController:RadioController;
	private var dial:Dial;
	private var id:String;
	
	public function new(radioModel:RadioModel, radioController:RadioController, id:String )
	{
		super();
		this.radioModel = radioModel;
		this.radioController = radioController;
		this.id = id;
		
		dial = new Dial(update);
		
		addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		radioModel.addEventListener( id, setDial);
	}
	
	public function onAddedToStage(e:Event){
	    addChild(dial);
	}
	
	private function update(val:Float):Void{
		radioController.update(id, val);
	}
	
	private function setDial(e:AppEvent):Void{
	//	trace(e.getPos());
		dial.setPos(e.getPos());
	}
}