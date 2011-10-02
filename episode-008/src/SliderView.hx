import flash.display.Sprite;
import flash.events.Event;

class SliderView extends Sprite
{
	private var radioModel:RadioModel;
	private var radioController:RadioController;
	private var slider:Slider;
	private var id:String;
	
	public function new(radioModel:RadioModel, radioController:RadioController, id:String )
	{
		super();
		this.radioModel 	= radioModel;
		this.radioController = radioController;
		this.id = id;
		
		slider = new Slider(update);
		
		addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		radioModel.addEventListener( id, onUpdate);
	}
	
	public function onAddedToStage(e:Event){
	    addChild(slider);
	}
	
	private function update(val:Float):Void{
		radioController.update(id, val);
	}
	
	private function onUpdate(e:AppEvent):Void{
	//	trace(e.getPos());
		slider.setPos(e.getPos());
	}
}