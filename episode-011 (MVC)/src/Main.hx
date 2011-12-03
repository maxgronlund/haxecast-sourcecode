import flash.display.Sprite;
import flash.Lib;

class Main extends Sprite
{
	private var audioEngine:AudioEngine;
	
	private var model:Model;
	private var view:AView;
	private var controller:IController;
	
	static function main(){
		new Main();
	}
	
	public function new(){
		super();
		// models
		model = new Model();
		// controllers
		controller = new AppController(model);
		// views
		view = new AppView(model,controller);
		audioEngine = new AudioEngine( model,controller );
		
		Lib.current.addChild(view);
		
		view.x = 32;
		view.y = 4;
	}
}
