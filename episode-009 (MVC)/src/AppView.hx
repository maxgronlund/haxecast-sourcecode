import flash.display.Sprite;
import flash.events.Event;
import flash.Vector;

class AppView extends AView
{
	private var playButton:Button;
	private var channelViews:Vector<ChannelView>;
	private var masterVolume:ChannelView;
	
  public function new(model:Model, controller:IController )
  {
    super();
    this.model 	= model;
    this.controller = controller;
		playButton	 	= new Button(new PlayButtonBitmap(), onPlay, 34, 33);
		channelViews = new Vector<ChannelView>();
    addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
  }

  override public function onAddedToStage(e:Event){
    removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		var posX:Float = 200;
		addChild(playButton);
		playButton.x = 200+posX;
		playButton.y = 120;

		for( i in 0...AudioEngine.TRACKS){
			channelViews[i] = new ChannelView(model, controller, i ,'channel');
			addChild(channelViews[i]);
			channelViews[i].x = (i*48)+posX;
		}
		
		masterVolume = new ChannelView(model, controller, 0, 'master');
		addChild(masterVolume);
		masterVolume.x = (AudioEngine.TRACKS * 48) +60+posX;
  }

	private function onPlay(play:Bool):Void{
		controller.update('play', 0, play? 1.0:0.0);
	}
}