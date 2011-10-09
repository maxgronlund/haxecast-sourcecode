import flash.display.Sprite;
import flash.Lib;

class Main extends Sprite
{

  private var radioStation:RadioStation;
  private var radioStudioA:RadioStudio;
  private var radioStudioB:RadioStudio;
  
  private var radioA:Radio;
  private var radioB:Radio;
  
  static function main(){
    new Main();
  }
  
  public function new(){	
  super();
  radioStation = new RadioStation();
  radioStudioA = new RadioStudio(radioStation,'HaXeCasts' );
  radioStudioB = new RadioStudio(radioStation, 'HaXeNews');
  radioA 		= new Radio(radioStation);
  radioB 		= new Radio(radioStation);
  buildInterface();

  }
  
  private function buildInterface():Void{
    Lib.current.addChild(new BackdropBitmap());
  
    Lib.current.addChild(radioStudioA);
    radioStudioA.x = 12;
    radioStudioA.y = 78;
  
    Lib.current.addChild(radioStudioB);
    radioStudioB.x = 72;
    radioStudioB.y = 78;
  
    Lib.current.addChild(radioA);
    radioA.x = 160;
    radioA.y = 110;
  
    Lib.current.addChild(radioB);
    radioB.x = 300;
    radioB.y = 110;
  }
}
                   