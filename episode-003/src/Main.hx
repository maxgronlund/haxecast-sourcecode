package;

import flash.display.Sprite;
import flash.Lib;
import flash.display.Loader;
import flash.net.URLLoader;
import flash.net.URLRequest;
import flash.events.Event;

class Main
{
  static function main(){
    new Main();
  }
  
  public function new(){
    loadParams();
  }
  
  private function loadParams():Void
  {
    var xml_url:String = Lib.current.loaderInfo.parameters.xml_url;
    if(xml_url != null){
      var loader:URLLoader = new URLLoader();
      var url_request  = new URLRequest(xml_url);
      
      loader.addEventListener( Event.COMPLETE , onXmlLoaded);
      loader.load(url_request);
    }
  }
  
  private function onXmlLoaded(e:Event):Void{
    var xml:Xml = Xml.parse(e.target.data);
    parse_xml(xml); 
  }
  
  private function parse_xml(xml:Xml):Void{
    // parse xml
    for( images in xml.elementsNamed("images") ) {
      for( image_url in images.elementsNamed("image_url") ) {
        load_image(image_url.firstChild().nodeValue);
      }	
    }
  }
  
  private function load_image(url:String):Void
  {
    var haxe_casts_image:Loader = new Loader();
    var request:URLRequest  = new URLRequest(url);
    haxe_casts_image.load(request);
    Lib.current.addChild(haxe_casts_image);
    
  }
}







