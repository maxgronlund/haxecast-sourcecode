package;

import flash.Lib;

class Main
{

//	var consoleWindow:ConsoleWindow;
	
	static function main(){
		new Main();
	}
	
	public function new(){	
//		consoleWindow = new ConsoleWindow();
		Lib.current.addChild(new ConsoleWindow());
	}	
}
