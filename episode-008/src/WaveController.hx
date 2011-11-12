class WaveController implements IController
{
  private var model:Model;
  
  public function new(model:Model){
    this.model = model;
  }
  
  public function update(id:String, value:Float):Void{
    if( id == 'dial1'){
      model.update('dial2', 1-wave(value));
      model.update('slider',1-wave(value));
    }
    else if( id == 'dial2'){
      model.update('dial1', 1-wave(value));
      model.update('slider', wave(value));
    }
    else if( id == 'slider'){
      model.update('dial2', wave(value));
      model.update('dial1', wave(value));
    }
  }

// private functions
  private function wave(value:Float):Float{
    return (Math.cos(value*3.14159265358979*2)*0.5)+0.5;
  }
}