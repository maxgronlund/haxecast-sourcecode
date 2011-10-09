package;

import flash.net.LocalConnection;
import flash.events.Event;
import flash.events.StatusEvent;

class ConsoleSender
{

	private var console_connection:LocalConnection;
	
	public function new(){
		
		console_connection = new LocalConnection();
		haxe.Log.trace = sendToConsole;
	}
	
	private function sendToConsole( v : Dynamic, ?inf : haxe.PosInfos ) {
	    console_connection.send("haxecasts_console", "printOut", v, inf);		
	}
		
}