package;

import flash.display.Sprite;
import flash.Lib;
//import flash.geom.Point;

import flash.display.LoaderInfo;

 



//import flash.events.MouseEvent;


class Main extends Sprite
{

	
	static function main()
	{
		new Main();
	}
	
	public function new()
	{	
	
		super();
		
		Lib.current.addChild(new HaxeCastsBitmap());

    }
		
}
                   