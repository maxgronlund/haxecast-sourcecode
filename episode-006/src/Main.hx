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
		dial = new Dial();
		Lib.current.addChild(dial);
		
		dial.x = 100;
		dial.y = 100;
			
		
    }
}
                   