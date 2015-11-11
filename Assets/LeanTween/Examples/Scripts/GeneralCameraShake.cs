#if !UNITY_FLASH
using UnityEngine;
using System.Collections;

public class GeneralCameraShake : MonoBehaviour {

	private GameObject avatarBig;
	private float jumpIter = 9.5f;
	private AudioClip boomAudioClip;

	// Use this for initialization
	void Start () {
		avatarBig = GameObject.Find("AvatarBig");
		boomAudioClip = createAudio( boomAudioCurve, 50);

		bigGuyJump();	
	}

	void bigGuyJump(){
		float height = Mathf.PerlinNoise(jumpIter, 0f)*10f;
		height = height*height * 0.3f;
		// Debug.Log("height:"+height+" jumpIter:"+jumpIter);

		LeanTween.moveY(avatarBig, height, 1f).setEase(LeanTweenType.easeInOutQuad).setOnComplete( ()=>{
			LeanTween.moveY(avatarBig, 0f, 0.27f).setEase(LeanTweenType.easeInQuad).setOnComplete( ()=>{
				LeanTween.cancel(gameObject);

				/**************
				* Camera Shake
				**************/
				
				float shakeAmt = height*0.2f; // the degrees to shake the camera
				float shakePeriodTime = 0.42f; // The period of each shake
				float dropOffTime = 1.6f; // How long it takes the shaking to settle down to nothing
				LTDescr shakeTween = LeanTween.rotateAroundLocal( gameObject, Vector3.right, shakeAmt, shakePeriodTime)
				.setEase( LeanTweenType.easeShake ) // this is a special ease that is good for shaking
				.setLoopClamp()
				.setRepeat(-1);

				// Slow the camera shake down to zero
				LeanTween.value(gameObject, shakeAmt, 0f, dropOffTime).setOnUpdate( 
					(float val)=>{
						shakeTween.setTo(Vector3.right*val);
					}
				).setEase(LeanTweenType.easeOutQuad);


				/********************
				* Shake scene objects
				********************/

				// Make the boxes jump from the big stomping
				GameObject[] boxes = GameObject.FindGameObjectsWithTag("Respawn"); // I just arbitrarily tagged the boxes with this since it was available in the scene
		        foreach (GameObject box in boxes) {
		            box.GetComponent<Rigidbody>().AddForce(Vector3.up * 100 * height);
		        }

		        // Make the lamps spin from the big stomping
		        GameObject[] lamps = GameObject.FindGameObjectsWithTag("GameController"); // I just arbitrarily tagged the lamps with this since it was available in the scene
		        foreach (GameObject lamp in lamps) {
		        	float z = lamp.transform.eulerAngles.z;
		        	z = z > 0.0f && z < 180f ? 1 : -1; // push the lamps in whatever direction they are currently swinging
		            lamp.GetComponent<Rigidbody>().AddForce(new Vector3(z, 0f, 0f ) * 15 * height);
		        }

		        // Play BOOM!
				playAudio(boomAudioClip, transform.position, height*0.2f, 0.34f);
		        
		        // Have the jump happen again 2 seconds from now
		        LeanTween.delayedCall(2f, bigGuyJump);
			});
		});
		jumpIter += 5.2f;
	}



	/******************************
	* Dynamic Audio Creation Stuff
	******************************/
	public AnimationCurve boomAudioCurve;

	AudioClip createAudio( AnimationCurve curve, int granularity){
		int frequency = 440*granularity;
		float[] audioArr = new float[granularity];

		float curveTime = curve[ curve.length - 1 ].time;
		// Debug.Log("curveTime:"+curveTime+" AudioSettings.outputSampleRate:"+AudioSettings.outputSampleRate);
		for(int i = 0; i < audioArr.Length; i++){
			float pt = (float)i/(float)audioArr.Length * curveTime;
			audioArr[i] = curve.Evaluate( pt );
			// Debug.Log("pt:"+pt+" i:"+i+" val:"+audioArr[i]+" len:"+audioArr.Length);
		}
		
		int lengthSamples =  (int)( (float)frequency * curveTime );
		#if !UNITY_3_5 && !UNITY_4_0 && !UNITY_4_0_1 && !UNITY_4_1 && !UNITY_4_2 && !UNITY_4_3 && !UNITY_4_5 && !UNITY_4_6
		AudioClip audioClip = AudioClip.Create("", lengthSamples, 1, frequency, false);
		#else
		bool is3dSound = true;
		AudioClip audioClip = AudioClip.Create("", lengthSamples, 1, frequency, is3dSound, false);
		#endif
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

	AudioSource PlayClipAt(AudioClip clip, Vector3 pos ) {
		GameObject tempGO = new GameObject(); // create the temp object
		tempGO.transform.position = pos; // set its position
		AudioSource aSource = tempGO.AddComponent<AudioSource>(); // add an audio source
		aSource.clip = clip; // define the clip
		aSource.Play(); // start the sound
		Destroy(tempGO, clip.length); // destroy object after clip duration
		return aSource; // return the AudioSource reference
	}
	
}
#endif