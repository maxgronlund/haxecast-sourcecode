package;


import  flash.Vector;
	

class Amplifyer {
    
	var vol:Float;
	var panPos:Float;
	var curVolL:Float;
	var curVolR:Float;
	var volL:Float;
	var volR:Float;
	var muted:Bool;

	public function new() {
		// constructor code
		vol = 1;
		panPos = 0.5;
		curVolL = 0;
		curVolR = 0;
		muted = false;
		updateVolumes();
	
	}
	
	public function process(snd:Vector<Float>, bufferSize:Int):Void{
		var i:Int = 0;
		
		while( i < bufferSize){
			curVolL +=  (volL-curVolL)*0.04; 
			curVolR +=  (volR-curVolR)*0.04; 
			
			snd[i]  *= curVolL;
			snd[i+1]  *= curVolR;
			snd[i+2]  *= curVolL;
			snd[i+3]  *= curVolR;
			snd[i+4]  *= curVolL;
			snd[i+5]  *= curVolR;
			snd[i+6]  *= curVolL;
			snd[i+7]  *= curVolR;
			snd[i+8]  *= curVolL;
			snd[i+9]  *= curVolR;
			snd[i+10]  *= curVolL;
			snd[i+11]  *= curVolR;
			snd[i+12]  *= curVolL;
			snd[i+13]  *= curVolR;
			snd[i+14]  *= curVolL;
			snd[i+15]  *= curVolR;
			snd[i+16]  *= curVolL;
			snd[i+17]  *= curVolR;
			snd[i+18]  *= curVolL;
			snd[i+19]  *= curVolR;
			snd[i+20]  *= curVolL;
			snd[i+21]  *= curVolR;
			snd[i+22]  *= curVolL;
			snd[i+23]  *= curVolR;
			snd[i+24]  *= curVolL;
			snd[i+25]  *= curVolR;
			snd[i+26]  *= curVolL;
			snd[i+27]  *= curVolR;
			snd[i+28]  *= curVolL;
			snd[i+29]  *= curVolR;
			snd[i+30]  *= curVolL;
			snd[i+31]  *= curVolR;
			i+=32;
		}
	}
	
	public function pan(panPos:Float):Void
	{
		this.panPos = panPos;
		updateVolumes();
	}

	public function volume(vol:Float):Void
	{
		this.vol = vol;
		updateVolumes();
	}

	public function mute(b:Bool):Void
	{
		muted = b;
		updateVolumes();
	}

	private function updateVolumes():Void
	{
		if(muted){
			volL = 0.0000001;
			volR = 0.0000001;
		}
		else{
			var panL:Float = 1 - (panPos*panPos);
			var panR:Float = 1 - panPos;
			panR = 1 - (panR*panR);
			// boost volumes
			volL = vol * panL * 1.66;
			volR = vol * panR * 1.66;
		}
	}
}


