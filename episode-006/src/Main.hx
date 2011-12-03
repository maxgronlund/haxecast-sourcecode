package;

import flash.display.Sprite;
import flash.Lib;


class Main extends Sprite
{
  private var dial:Dial;
  
  static function main()
  {
    new Main();
  }
  
  public function new()
  {	
    super();
    dial = new Dial(update);
    Lib.current.addChild(dial);
    
    dial.x = 250;
    dial.y = 30;

	dial.setPos(0.5);
  }
  public function update(v:Float):Void{
    trace(v);
  }
}
                   