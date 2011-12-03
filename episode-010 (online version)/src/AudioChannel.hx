import flash.media.SoundChannel;
import flash.media.Sound;
import flash.net.URLRequest;
import flash.events.Event;
import flash.utils.ByteArray;
import flash.errors.IOError;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.Vector;

class AudioChannel
{
	private var bufferSize:Int;
	private var audioEngine:AudioEngine;
	private var id:Int;
	private var sound:Sound;
	private var soundIndex:Int;
	
	private var bytes:ByteArray;
//	private var soundLength:Float;
	
	public function new(id:Int, audioEngine:AudioEngine){
		this.id = id;
		this.audioEngine = audioEngine;
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
		audioEngine.onAudioChannelLoaded(sound.length * 44.1);
	}
	
	public function setSamples(soundBuf:Vector<Float> , bufferSize:Int):Void
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
			soundBuf[i]  		= bytes.readFloat();
			soundBuf[i+1]  	= bytes.readFloat();
			soundBuf[i+2]  	= bytes.readFloat();
			soundBuf[i+3]  	= bytes.readFloat();
			soundBuf[i+4]  	= bytes.readFloat();
			soundBuf[i+5]  	= bytes.readFloat();
			soundBuf[i+6]  	= bytes.readFloat();
			soundBuf[i+7]  	= bytes.readFloat();
			i+=8;
		}
		// fill end of buffer with silence
		for(j in i... bufferSize){
			soundBuf[i]  			= 0;
			soundBuf[i+1]  		= 0;   
			i+=2;
		}
	}
	
	public function addSamples(soundBuf:Vector<Float> , bufferSize:Int):Void{
		// get samples
		bytes.position = 0;
		sound.extract(bytes, bufferSize,soundIndex);
		var samplesRead:Int = bytes.position >> 2;
		soundIndex += samplesRead >> 1;
		var i:Int = 0;
		bytes.position = 0;

		// fill buffer with samples
		while (i < samplesRead){	
			soundBuf[i]  		+= bytes.readFloat();
			soundBuf[i+1]  	+= bytes.readFloat();
			soundBuf[i+2]  	+= bytes.readFloat();
			soundBuf[i+3]  	+= bytes.readFloat();
			soundBuf[i+4]  	+= bytes.readFloat();
			soundBuf[i+5]  	+= bytes.readFloat();
			soundBuf[i+6]  	+= bytes.readFloat();
			soundBuf[i+7]  	+= bytes.readFloat();
			i+=8;
		}
	}
}