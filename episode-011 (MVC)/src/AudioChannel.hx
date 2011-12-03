import flash.media.SoundChannel;
import flash.media.Sound;
import flash.net.URLRequest;
import flash.events.Event;
import flash.utils.ByteArray;
import flash.errors.IOError;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.Vector;

class AudioChannel extends AView
{
	private var bufferSize:Int;

	private var id:Int;
	private var sound:Sound;
	private var soundIndex:Int;
	private var bytes:ByteArray;
	
	var vol:Float;
	var panPos:Float;
	var curVolL:Float;
	var curVolR:Float;
	var volL:Float;
	var volR:Float;
	var playing:Bool;

	
	public function new(id:Int, model:Model, controller:IController){
		super();
		this.id = id;
		this.model 	= model;
    this.controller = controller;
		vol = 1;
		panPos = 0.5;
		curVolL = 0;
		curVolR = 0;
		playing = false;
		updateVolumes();

		soundIndex = 0;
		bytes  = new ByteArray();

		
	}

	public function load(songURL:String):Void{	
		sound = new Sound();
		sound.load(new URLRequest(songURL));
		sound.addEventListener(Event.COMPLETE, onLoaded);
	}
	
	private function onLoaded(event:Event):Void{
		sound.removeEventListener(Event.COMPLETE, onLoaded);
		//audioEngine.onAudioChannelLoaded(sound.length * 44.1);
		controller.update('channel_loaded', id, sound.length * 44.1);
	}
	
	public function setSamples(sndBuf:Vector<Float> , bufferSize:Int):Void
	{
		// get samples
		bytes.position = 0;
		sound.extract(bytes, bufferSize, soundIndex);
		var samplesRead:Int = bytes.position >> 2;
		soundIndex += samplesRead >> 1;
		var i:Int = 0;
		bytes.position = 0;
		
		// fill buffer with samples
		while (i < samplesRead){	
			curVolL +=  (volL-curVolL)*0.01; 
			curVolR +=  (volR-curVolR)*0.01;
			
			sndBuf[i]   = bytes.readFloat()*curVolL;
			sndBuf[i+1] = bytes.readFloat()*curVolR;
			sndBuf[i+2] = bytes.readFloat()*curVolL;
			sndBuf[i+3] = bytes.readFloat()*curVolR;
			sndBuf[i+4] = bytes.readFloat()*curVolL;
			sndBuf[i+5] = bytes.readFloat()*curVolR;
			sndBuf[i+6] = bytes.readFloat()*curVolL;
			sndBuf[i+7] = bytes.readFloat()*curVolR;
			
			i+=8;
		}
		// fill end of buffer with silence
		for(j in i... bufferSize){
			sndBuf[i]  			= 0;
			sndBuf[i+1]  		= 0;   
			i+=2;
		}
	}
	
	public function addSamples(sndBuf:Vector<Float> , bufferSize:Int):Void{
		// get samples
		bytes.position = 0;
		sound.extract(bytes, bufferSize,soundIndex);
		var samplesRead:Int = bytes.position >> 2;
		soundIndex += samplesRead >> 1;
		var i:Int = 0;
		bytes.position = 0;

		// fill buffer with samples
		while (i < samplesRead){	
			curVolL +=  (volL-curVolL)*0.01; 
			curVolR +=  (volR-curVolR)*0.01;
			
			sndBuf[i]  		+= bytes.readFloat()*curVolL;
			sndBuf[i+1]  	+= bytes.readFloat()*curVolR;
			sndBuf[i+2]  	+= bytes.readFloat()*curVolL;
			sndBuf[i+3]  	+= bytes.readFloat()*curVolR;
			sndBuf[i+4]  	+= bytes.readFloat()*curVolL;
			sndBuf[i+5]  	+= bytes.readFloat()*curVolR;
			sndBuf[i+6]  	+= bytes.readFloat()*curVolL;
			sndBuf[i+7]  	+= bytes.readFloat()*curVolR;
			
			i+=8;
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

	public function play(b:Bool):Void
	{
		playing = b;
		updateVolumes();
		if(playing){
			setAudioPos(0);
		}
	}
	
	public function setAudioPos(soundIndex:Int):Void{
		this.soundIndex = soundIndex;
	}

	private function updateVolumes():Void
	{
		if(!playing){
			volL = 0.0000001;
			volR = 0.0000001;
		}
		else{
			var panL:Float = 1 - (panPos*panPos);
			var panR:Float = 1 - panPos;
			panR = 1 - (panR*panR);
			// boost volumes
			volL = vol * panL;
			volR = vol * panR;
		}
	}
}