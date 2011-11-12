class ResetController implements IController
{
  private var model:Model;
  
  public function new(model:Model){
    this.model = model;
  }
  
  public function update(id:String, value:Float):Void{
    if( id == 'dial1'){
      model.update('dial2', 0);
      model.update('slider', 0);
    }
    else if( id == 'dial2'){
      model.update('dial1', 0);
      model.update('slider', 0);
    }
    else if( id == 'slider'){
      model.update('dial1', 0);
      model.update('dial2', 0);
    }
  }
}