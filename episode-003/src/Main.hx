package;

import flash.Lib;
import flash.display.Sprite;
import flash.display.Loader;

import flash.net.URLLoader;
import flash.net.URLRequest;
import flash.events.Event;


class Main extends Sprite
{
	
	static function main(){
		new Main();
	}
	
	public function new(){	
		super();
		loadParams();
    }

	private function loadParams():Void{
		
		// read parameters from html file
		var params:Dynamic<String> = flash.Lib.current.loaderInfo.parameters;
		
		if(params.xml_url != null){

			var loader:URLLoader 	= new URLLoader();
			var url_request 		= new URLRequest(params.xml_url);
			
			loader.addEventListener( Event.COMPLETE , onXmlLoaded);
			loader.load(url_request);
		}
	}
	
	private function onXmlLoaded(e:Event):Void{
		
		// convert string to xml
		var xml:Xml = Xml.parse(e.target.data);
		read_xml(xml);
	}
	
	private function read_xml(xml:Xml):Void{
		
		// parse xml
		for( images in xml.elementsNamed("images") ) {
			for( image_url in images.elementsNamed("image_url") ) {
				load_image(image_url.firstChild().nodeValue);
			}	
		}
	}
	
	private function load_image(url:String):Void{
		
		var haxe_casts_image:Loader = new Loader();
        var request:URLRequest 		= new URLRequest(url);
        haxe_casts_image.load(request);
        Lib.current.addChild(haxe_casts_image);
	}	
}
                   