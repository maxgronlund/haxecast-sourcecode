package;

import flash.display.Sprite;
import flash.Lib;


class Main extends Sprite
{
	private var multiStateImage1:MultiStateImage;
	private var multiStateImage2:MultiStateImage;
	
	static function main()
	{
		new Main();
	}
	
	public function new()
	{	
		super();
		
		multiStateImage1 = new MultiStateImage(new DialBitmap(), 32 ,34);
		Lib.current.addChild(multiStateImage1);
		multiStateImage1.x = 100;
		multiStateImage1.y = 100;
		
		multiStateImage2 = new MultiStateImage(new DialBitmap(), 32 ,34);
		Lib.current.addChild(multiStateImage2);
		multiStateImage2.x = 200;
		multiStateImage2.y = 100;
		
		multiStateImage2.State(2);
		
		
    }
}
                   