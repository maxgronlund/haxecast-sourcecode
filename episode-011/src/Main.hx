package;

import flash.display.Sprite;
import flash.Lib;


class Main extends Sprite
{


//  private var dial:Dial;
  private var radioModel:RadioModel;
  private var radioController:RadioController;
  private var dial1:RadioView;
  private var dial2:RadioView;

  
  static function main()
  {
    new Main();
  }
  
  public function new()
  {	
    super();
    radioModel = new RadioModel();
    radioController = new RadioController(radioModel);
    dial1 = new RadioView(radioModel,radioController, 'dial1');
    dial2 = new RadioView(radioModel,radioController, 'dial2');


    Lib.current.addChild(dial1);
	dial1.x = 100;
	
    Lib.current.addChild(dial2);
    dial2.x = 200;


  }


}
                   