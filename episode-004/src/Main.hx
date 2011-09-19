package;

import flash.display.Sprite;
import flash.Lib;


class Main extends Sprite
{
	private var mouseHandler:MouseHandler;
	static function main()
	{
		new Main();
	}
	
	public function new()
	{	
		super();
		mouseHandler = new MouseHandler();
		mouseHandler.x = 25;
		mouseHandler.y = 50;
	 	Lib.current.addChild(mouseHandler);
    }
}
                   