import flash.events.Event;

class RadioSignal extends Event
{
  private var audio:Float;
  public function new( label:String, audio:Float, bubbles:Bool = false, cancelable:Bool = false ) {
    super( label ,bubbles, cancelable);
    this.audio = audio;
  }
  
  public function getAudio():Float{
    return audio;
  }
}