import  flash.Vector;
import flash.media.Sound;
import flash.events.SampleDataEvent;
import flash.utils.ByteArray;

class AudioEngine
{
	public static inline var TRACKS:Int = 4;
	public static inline var BUFFER_SIZE:Int = 4096*2;
	
	
	// audio channels
	private var audioChannels:Vector<AudioChannel>;
	// sound output
	var outputSnd:Sound;
	// buffer shared by AudioChannels
	private var sndBuf:Vector<Float>;
	// global audio buffer
	private var bytes:ByteArray;
	// house keeping
	private var samplesInSong:Float;
	private var channelsLoaded:UInt;
	
	public function new(){
		init();
		buildTracks();
		loadAudio();
	}
	
	private function init():Void{
		audioChannels = new Vector<AudioChannel>();
		outputSnd = new Sound();
		sndBuf = new Vector<Float>();
		bytes  = new ByteArray();
		samplesInSong	=	0;
		channelsLoaded = 0;
	}
	
	private function buildTracks():Void{
		for( i in 0... TRACKS){
			audioChannels.push(new AudioChannel(i,this));
		}
	}
	
	private function loadAudio():Void{
		trace('loading audio...');
		audioChannels[0].load('http://haxecasts.com/audio-files/track-01.mp3');
		audioChannels[1].load('http://haxecasts.com/audio-files/track-02.mp3');
		audioChannels[2].load('http://haxecasts.com/audio-files/track-03.mp3');
		audioChannels[3].load('http://haxecasts.com/audio-files/track-04.mp3');		
	}
	
	public function onAudioChannelLoaded(samplesInSong:Float):Void{	
		// finding the longest track
		if( this.samplesInSong < samplesInSong)
			this.samplesInSong = samplesInSong;	
		channelsLoaded++;
		// start processing when all sound is loaded
		if(channelsLoaded == audioChannels.length){
			trace('samples in song: '+Std.int(samplesInSong));
			trace('press the playbutton to play');
		}
	}
	
	public function play():Void{
		trace("'He he, you can't stop");
		outputSnd.addEventListener(SampleDataEvent.SAMPLE_DATA, MixerSection);
		outputSnd.play();
	}
	
	public function MixerSection(event:SampleDataEvent):Void{
		// override buffer with first channel
		audioChannels[0].setSamples( sndBuf, BUFFER_SIZE >> 1);
		
		// add the rest of the channels to the buffer
		for( i in 1...TRACKS){
			audioChannels[i].addSamples( sndBuf, BUFFER_SIZE>>1);
		}
		// write result from masterSection to the sound output
		event.data.writeBytes(masterSection());	
	}
	
	private function masterSection():ByteArray{
		bytes.position = 0;
		var i:Int = 0;
		while( i < BUFFER_SIZE )
		{
			bytes.writeFloat(sndBuf[i]);
			bytes.writeFloat(sndBuf[i+1]);
			bytes.writeFloat(sndBuf[i+2]);
			bytes.writeFloat(sndBuf[i+3]);
			bytes.writeFloat(sndBuf[i+4]);
			bytes.writeFloat(sndBuf[i+5]);
			bytes.writeFloat(sndBuf[i+6]);
			bytes.writeFloat(sndBuf[i+7]);
			i+=8;
		}
		return bytes;
	}
}
