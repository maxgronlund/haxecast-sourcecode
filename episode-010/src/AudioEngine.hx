import flash.Vector;
import flash.media.Sound;
import flash.events.SampleDataEvent;
import flash.utils.ByteArray;

class AudioEngine
{
  public static inline var TRACKS:Int = 4;
  public static inline var BUFFER_SIZE:Int = 4096*2;
  
  // audio channels
  private var audioTrack:Vector<AudioTrack>;
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
    audioTrack = new Vector<AudioTrack>();
    outputSnd = new Sound();
    sndBuf = new Vector<Float>();
    bytes  = new ByteArray();
    samplesInSong	=	0;
    channelsLoaded = 0;
  }
  
  private function buildTracks():Void{
    for( i in 0... TRACKS){
      audioTrack.push(new AudioTrack(this));
    }
  }
  
  private function loadAudio():Void{
    trace('loading audio...');
    audioTrack[0].load('audio-files/track-01.mp3');
    audioTrack[1].load('audio-files/track-02.mp3');
    audioTrack[2].load('audio-files/track-03.mp3');
    audioTrack[3].load('audio-files/track-04.mp3');		
  }

  public function onAudioChannelLoaded():Void{	
    channelsLoaded++;
    // start processing when all sound is loaded
    if(channelsLoaded == audioTrack.length){
      trace('all track loaded');
      play();
    }
  }
  
  public function play():Void{
    outputSnd.addEventListener(SampleDataEvent.SAMPLE_DATA, MixerSection);
    outputSnd.play();
  }

  public function MixerSection(event:SampleDataEvent):Void{
    // override buffer with first channel
    audioTrack[0].setSamples( sndBuf, BUFFER_SIZE >> 1);
    
    // add the rest of the channels to the buffer
    for( i in 1...TRACKS){
    	audioTrack[i].addSamples( sndBuf, BUFFER_SIZE>>1);
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
