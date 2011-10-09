import flash.display.Sprite;
import flash.events.Event;

class Radio extends Sprite
{
  private var radioStation:RadioStation;
  private var meter:Meter;
  private var channelButtonA:Button;
  private var channelButtonB:Button;
  
  public function new(radioStation:RadioStation ){
    super();
    this.radioStation	= radioStation;
    meter 				= new Meter();
    channelButtonA	 	= new Button(new HaxeCastsBitmap(), onButtonA);
    channelButtonB 		= new Button(new HaxeMusicBitmap(), onButtonB);
    addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
  }
  
  public function onAddedToStage(e:Event){
    addChild(meter);
    meter.x = 32;
    addChild(channelButtonA);
    channelButtonA.y = 30;
    addChild(channelButtonB);
    channelButtonB.y = 57;
  }
  
  private function receiveFM(e:RadioSignal):Void{
    meter.setPos(e.getAudio());
  }
  
  private function onButtonA(isOn:Bool):Void{
    reset();
    channelButtonB.setPos(false);
    if(isOn) radioStation.addEventListener( 'HaXeCasts', receiveFM);
  }
  
  private function onButtonB(isOn:Bool):Void{
    reset();
    channelButtonA.setPos(false);
    if(isOn) radioStation.addEventListener( 'HaXeNews', receiveFM);
  }
  
  private function reset():Void{
    radioStation.removeEventListener( 'HaXeCasts', receiveFM);
    radioStation.removeEventListener( 'HaXeNews', receiveFM);
    meter.setPos(0);
  }
}