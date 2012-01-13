import  flash.Vector;
import flash.media.Sound;
import flash.events.SampleDataEvent;
import flash.utils.ByteArray;

class AudioEngine extends AView
{
	public static inline var TRACKS:Int = 4;
	public static inline var BUFFER_SIZE:Int = 4096*2;
	
	
	// audio channels
	private var audioChannels:Vector<AudioChannel>;
	private var amplifyer:Amplifyer;
	
	
	// sound output
	var outputSnd:Sound;
	// buffer shared by AudioChannels
	private var sndBuf:Vector<Float>;
	// global audio buffer
	private var bytes:ByteArray;
	// house keeping
	private var samplesInSong:Float;
	private var channelsLoaded:UInt;
	
	private var playing:Bool;
	private var loaded:Bool;
	private var started:Bool;
	
  public function new(model:Model, controller:IController )
  {
    super();
    this.model 	= model;
    this.controller = controller;

		init();
		buildTracks();
		loadAudio();
		amplifyer = new Amplifyer();
	}
	
	private function init():Void{
		audioChannels = new Vector<AudioChannel>();
		outputSnd = new Sound();
		sndBuf = new Vector<Float>();
		bytes  = new ByteArray();
		samplesInSong	=	0;
		channelsLoaded = 0;
		playing = false;
		loaded = false;
		started = false;
		
		model.addEventListener('channel_loaded', onAudioChannelLoaded);
		model.addEventListener('channel_volume', onChannelVolume);
		model.addEventListener('channel_pan', onChannelPan);
		model.addEventListener('master_volume', onMasterVolume);
		model.addEventListener('master_pan', onMasterPan);
		model.addEventListener('play', onPlay);
		
	}
	
	private function buildTracks():Void{
		for( i in 0... TRACKS){
			audioChannels.push(new AudioChannel(i, model, controller));
		}
	}
	
	private function loadAudio():Void{
		trace('loading audio');
//		audioChannels[0].load('audio-files/track-01.mp3');
//		audioChannels[1].load('audio-files/track-02.mp3');
//		audioChannels[2].load('audio-files/track-03.mp3');
//		audioChannels[3].load('audio-files/track-04.mp3');

		audioChannels[0].load('audio-files/track-01.mp3');
		audioChannels[1].load('audio-files/track-02.mp3');
		audioChannels[2].load('audio-files/track-03.mp3');
		audioChannels[3].load('audio-files/track-04.mp3');

	}
	
	private function onAudioChannelLoaded(e:UIEvent):Void{	
		// finding the longest track
		if( this.samplesInSong < e.pos)
			this.samplesInSong = e.pos;	
  
		channelsLoaded++;
		// start processing when all sound is loaded
		if(channelsLoaded == audioChannels.length){
			loaded = true;
			if(loaded && playing) play();
			trace('all tracks loaded');
			trace('press the playbutton \nto start');
		//	trace(this.samplesInSong);
		}
	}
	
	private function onChannelVolume(e:UIEvent):Void{
		audioChannels[e.index].volume(e.pos);
	}
	
	private function onChannelPan(e:UIEvent):Void{
		audioChannels[e.index].pan(e.pos);
	}
	
	private function onMasterVolume(e:UIEvent):Void{
		amplifyer.volume(e.pos);
	}
	private function onMasterPan(e:UIEvent):Void{
		amplifyer.pan(e.pos);
	}
	
	private function onPlay(e:UIEvent):Void{
		if(e.pos == 1){
			playing = true;
			if(loaded && playing) play();	
		}
		else{
			playing = false;
		}
		for( i in 0...TRACKS){
			audioChannels[i].play(playing);
		}
	}
	
	public function play():Void{
		// only call play once
		if(!started){
			trace('stop by pressing \nthe playbutton again');
			outputSnd.addEventListener(SampleDataEvent.SAMPLE_DATA, mixerSection);
			outputSnd.play();
			started = true;
		}
	}
	
	public function mixerSection(event:SampleDataEvent):Void{
	//	trace('+++');
		audioChannels[0].setSamples( sndBuf, BUFFER_SIZE >> 1);
		
		//// add the rest of the channels to the buffer
		for( i in 1...TRACKS){
			audioChannels[i].addSamples( sndBuf, BUFFER_SIZE>>1);
		}
		// write result from masterSection to the sound output
		event.data.writeBytes(masterSection());	
	}
	
	private function masterSection():ByteArray{
		
		amplifyer.process(sndBuf, BUFFER_SIZE);
			
			
			
		// write to output
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
