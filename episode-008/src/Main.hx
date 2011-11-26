import flash.display.Sprite;
import flash.Lib;

class Main extends Sprite
{
  private var model:Model;
  private var controller:IController;
  private var view1:AView;
  private var view2:AView;
  private var view3:AView;

  static function main(){
    new Main();
  }
  
  public function new()
  {	
    super();
    // model
    model = new Model();
    // controller
    controller = new WaveController(model);
    // views
    buildView1();
    buildView2();
    buildView3();
  }

  private function buildView1():Void{
    view1 = new DialView(model,controller, 'dial1');
    Lib.current.addChild(view1);
    view1.x = 70;
    view1.y = 60;
  }
  private function buildView2():Void{
    view2 = new DialView(model,controller, 'dial2');
    Lib.current.addChild(view2);
    view2.x = 180;
    view2.y = 60;
  }
  private function buildView3():Void{
    view3 = new SliderView(model,controller, 'slider');
    Lib.current.addChild(view3);
    view3.x = 300;
    view3.y = 10;
  }
}
                   