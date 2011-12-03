class AppController implements IController
{
  private var model:Model;
  
  public function new(model:Model){
    this.model = model;
  }
  
  public function update(id:String, index:UInt, value:Float):Void{
	
		switch(id){
			case 'channel_volume':{
				model.update(id, index, value*value);
			}
			case 'channel_pan':{
				model.update(id, index, value);
			}
			case 'master_volume':{
				model.update(id, index, value*value);
			}
			case 'master_pan':{
				model.update(id, index, value);
			}
			case 'play':{
				model.update(id, index, value);
			}
			default:{
				model.update(id, index, value);
			}
		}
		
	/*
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
*/
  }
}