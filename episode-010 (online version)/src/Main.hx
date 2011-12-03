import flash.display.Sprite;
import flash.Lib;

class Main extends Sprite
{
	private var audioEngine:AudioEngine;
	private var playing:Bool;
	private var playButton:Button;
		
	static function main(){
		new Main();
	}
	
	public function new(){
		super();
		playing = false;
		audioEngine = new AudioEngine();
		
		playButton	 = new Button(new PlayButtonBitmap(), onPlay, 34, 33);
		Lib.current.addChild(playButton);
		playButton.x = 300;
		playButton.y = 30;
	}
	
	public function onPlay():Void{
		// only call play once
		if(!playing){
			audioEngine.play();
			playing = true;
			
		}
	}
}
