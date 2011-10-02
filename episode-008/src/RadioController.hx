class RadioController
{
	private var radioModel:RadioModel;
	
	public function new(radioModel:RadioModel)
	{
		this.radioModel = radioModel;
	}
	
	public function update(id:String, value:Float):Void
	{
		if( id == 'dial1')
		  radioModel.update('dial2', 1-value);
		else if( id == 'dial2')
		  radioModel.update('dial1', 1-value);
		else if( id == 'slider'){
			radioModel.update('dial2', value);
			radioModel.update('dial1', 1-value);
		}
	}
}