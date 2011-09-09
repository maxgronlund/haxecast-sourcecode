package;

import flash.display.MovieClip;
import flash.Lib;

class Main
{
	static function main()
	{
		new Main();
	}
	
	public function new()
	{
		#if (flash9 || flash10)
	        haxe.Log.trace = function(v,?pos) { untyped __global__["trace"](pos.className+"#"+pos.methodName+"("+pos.lineNumber+"):",v); }
	        #elseif flash
	        haxe.Log.trace = function(v,?pos) { flash.Lib.trace(pos.className+"#"+pos.methodName+"("+pos.lineNumber+"): "+v); }
	    #end
	    trace( "YEAH!" );
	}
}







