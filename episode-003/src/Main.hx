package;

import flash.display.Sprite;
import flash.Lib;
import flash.net.URLLoader;
import flash.net.URLRequest;
import flash.events.Event;

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
		loadParams();

    }

	private function loadParams():Void
	{
		trace('loadParams');
		// read parameters
		var params:Dynamic<String> = flash.Lib.current.loaderInfo.parameters;
		
//		// pass parameters to models
//		if(params.authenticity_token != null){
//			applicationModel.setAuthenticity(params.authenticity_token);
//		}
//		if(params._session != null){
//			applicationModel.setSession(params._session);
//		}
		if(params.xml_url != null){
			
			var url:String 			= params.xml_url;
			var loader:URLLoader 	= new URLLoader();
			var url_request 		= new URLRequest(url);
			
			loader.addEventListener( Event.COMPLETE , onXmlLoaded);
			loader.load(url_request);
			
			trace(url);
			
			
			
		}
	}
	
	public function onXmlLoaded(e:Event):Void{
		trace('bam');
		trace(e.target.data);



	}
		
}
                   