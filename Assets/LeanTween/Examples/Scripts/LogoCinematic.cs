using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class LogoCinematic : MonoBehaviour {

	public GameObject lean;

	public GameObject tween;

	public AudioClip audioBoom;

	public AnimationCurve generatedAudio1;
	public AnimationCurve generatedAudio2;

	public AnimationCurve volumeCurve;
	public AnimationCurve frequencyCurve;

	public bool useRealSound = false;

	void Awake(){
		float time = 0.5f;
		/*Keyframe[] frames = new Keyframe[500];
		
		for(int i = 0; i < frames.Length; i++){
			float ratio = (float) i / (float)frames.Length;
			float stretcher = 1f - ratio*0.5f;
			float height = Mathf.Sin(ratio * 400f * stretcher);
			float hStretcher =  1f - Mathf.Pow(ratio, 0.1f);
			height = height * hStretcher;
			frames[i] = new Keyframe( ratio * time, height );
		}
		boomAudioCurve = new AnimationCurve( frames );*/

		List<float> list = new List<float>();
		float passed = 0f;
		for(int i = 0; i < 1000; i++){
			
			float f = frequencyCurve.Evaluate(passed);
			float height = volumeCurve.Evaluate(passed);
			passed += f;
			if(passed>=time)
				break;

			list.Add( passed );
			list.Add( i%2==0 ? -height : height );

			Debug.Log("i:"+i+" f:"+f+" passed:"+passed);
		}

		Keyframe[] frames = new Keyframe[list.Count/2+2];
		frames[0] = new Keyframe( 0f, 0f );
		frames[ frames.Length-1 ] = new Keyframe( time, 0f );
		int k = 0;
		for(int i = 1; i < frames.Length-1; i++){
			float waveTime = list[ k*2 ];
			float waveHeight = list[ k*2 + 1 ];
			frames[i] = new Keyframe( waveTime, waveHeight );
			Debug.Log("waveTime:"+waveTime+" waveHeight:"+waveHeight+" 1:"+(k*2)+" 2:"+(k*2 + 1));
			k++;
		}
		boomAudioCurve = new AnimationCurve( frames );

		printOutAudioClip( audioBoom, ref generatedAudio1 );

		if(useRealSound==false)
			audioBoom = createAudio( boomAudioCurve );

		printOutAudioClip( audioBoom, ref generatedAudio2 );
	}

	void printOutAudioClip( AudioClip audio, ref AnimationCurve curve ){
		Debug.Log("Audio channels:"+audioBoom.channels+" frequency:"+audioBoom.frequency+" length:"+audioBoom.length+" samples:"+audioBoom.samples);
		float[] samples = new float[audio.samples * audio.channels];
        audio.GetData(samples, 0);
        int i = 0;
        string outstr = "";

        Keyframe[] frames = new Keyframe[samples.Length];
        while (i < samples.Length) {
           // outstr += i+":"+samples[i]+",";
           frames[i] = new Keyframe( (float)i, samples[i] );
            ++i;
        }
        curve = new AnimationCurve( frames );
        Debug.Log("Audio length:"+samples.Length);
	}

	void Start () {
		//Time.timeScale = 0.2f;
		
		// Slide in
		tween.transform.localPosition += -Vector3.right * 15f;
		LeanTween.moveLocalX(tween, tween.transform.localPosition.x+15f, 0.4f).setEase(LeanTweenType.linear).setDelay(0f).setOnComplete( playBoom );

		// Drop Down tween down
		tween.transform.RotateAround(tween.transform.position, Vector3.forward, -30f);
		LeanTween.rotateAround(tween, Vector3.forward, 30f, 0.4f).setEase(LeanTweenType.easeInQuad).setDelay(0.4f).setOnComplete( playBoom );

		// Drop Lean In
		lean.transform.position += Vector3.up * 5.1f;
		LeanTween.moveY(lean, lean.transform.position.y-5.1f, 0.6f).setEase(LeanTweenType.easeInQuad).setDelay(0.6f).setOnComplete( playBoom );
	}


	public AnimationCurve boomAudioCurve;

	AudioClip createAudio( AnimationCurve curve ){
		float curveTime = curve[ curve.length - 1 ].time;
		int frequency = 44100;
		float time = curveTime;
		float[] audioArr = new float[ (int)(frequency*time) ];

		Debug.Log("curveTime:"+curveTime+" AudioSettings.outputSampleRate:"+AudioSettings.outputSampleRate);
		for(int i = 0; i < audioArr.Length; i++){
			float pt = (float)i / (float)frequency;
			audioArr[i] = curve.Evaluate( pt );
			// Debug.Log("pt:"+pt+" i:"+i+" val:"+audioArr[i]+" len:"+audioArr.Length);
		}

		bool is3dSound = false;
		int lengthSamples = audioArr.Length;//(int)( (float)frequency * curveTime );
		AudioClip audioClip = AudioClip.Create("Generated Audio", lengthSamples, 1, frequency, is3dSound, false);
		audioClip.SetData(audioArr, 0);
		return audioClip;
	}

	void playAudio( AudioClip audioClip, Vector3 pos, float volume, float pitch ){
		// Debug.Log("audioClip length:"+audioClip.length);
		AudioSource audioSource = PlayClipAt(audioClip, pos);
		audioSource.minDistance = 1f;
		audioSource.pitch = pitch;
		audioSource.volume = volume;
	}

	void playBoom(){
		PlayClipAt(audioBoom, Vector3.zero);
	}

	AudioSource PlayClipAt( AudioClip clip, Vector3 pos ) {
		GameObject tempGO = new GameObject(); // create the temp object
		tempGO.transform.position = pos; // set its position
		AudioSource aSource = tempGO.AddComponent<AudioSource>(); // add an audio source
		aSource.clip = clip; // define the clip
		aSource.Play(); // start the sound
		Destroy(tempGO, clip.length); // destroy object after clip duration
		return aSource; // return the AudioSource reference
	}
	
}
