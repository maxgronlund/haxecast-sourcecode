import flash.display.Sprite;
import flash.events.Event;

class RadioStudio extends Sprite
{
  private var radioStation:RadioStation;
  private var slider:Slider;
  private var studioId:String;
  
  public function new( radioStation:RadioStation, studioId:String){
    super();
    this.radioStation 	= radioStation;
    this.studioId 		= studioId;
    slider 				= new Slider(update);
    addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
  }
  
  public function onAddedToStage(e:Event){
    addChild(slider);
  }
  
  private function update(audio:Float ):Void{
    radioStation.broadcast( audio, studioId);
  }
}