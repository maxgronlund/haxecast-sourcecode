package;

import flash.display.Sprite;
import flash.Lib;


class Main extends Sprite
{
  private var dial1:Dial;
  private var dial2:Dial;
  
  static function main()
  {
    new Main();
  }
  
  public function new()
  {	
    super();
    var consoleSender:ConsoleSender = new ConsoleSender();

    dial1 = new Dial(onDial1);
    Lib.current.addChild(dial1);
    dial1.x = 30;
    dial1.y = 30;
	  dial1.setPos(0.5);
	
		dial2 = new Dial(onDial2);
    Lib.current.addChild(dial2);
    dial2.x = 100;
    dial2.y = 30;
	  dial2.setPos(0.5);
	
  }
  public function onDial1(v:Float):Void{
    trace('dial1 1: ', v, 'Float');
  }

	public function onDial2(v:Float):Void{
    trace('dial1 2: ', v, 'Float');
  }
}
                   