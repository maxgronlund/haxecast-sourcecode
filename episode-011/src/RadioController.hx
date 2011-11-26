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
		else
		  radioModel.update('dial1', 1-value);
	}
}