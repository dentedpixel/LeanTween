using UnityEngine;
using System.Collections;
using System;
using System.Threading;

public class TestingPauseResume : MonoBehaviour {
	
	private GameObject ltLogo;
	private int cube1ScaleZId;
	private int cube2ScaleYId;
	private int slowShakeId;
	private GameObject cube1;
	private GameObject cube2;

	void Awake(){
		// LeanTween.init(3200); // This line is optional. Here you can specify the maximum number of tweens you will use (the default is 400).  This must be called before any use of LeanTween is made for it to be effective.
	}

	void Start () {
		ltLogo = GameObject.Find("LeanTweenLogo");

		//LeanTween.moveX(ltLogo, 5, 5f).setOnComplete(logoMovedCallback);
		//LeanTween.delayedCall(ltLogo, 5f, ltLogoCallback);
		LeanTween.delayedCall(0.1f, pauseNow);

		LeanTween.moveY(ltLogo, ltLogo.transform.position.y + 2f, 1).setDelay(3.1f).setLoopPingPong().setEase(LeanTweenType.easeInOutSine);
		LeanTween.delayedCall(3f, resumeFromPause);
	}

	void resumeFromPause(){
		Debug.Log("resumeFromPause");
		LeanTween.resume( ltLogo );
	}

	void logoMovedCallback(){
		Debug.Log("logoMovedCallback");
	}

	void ltLogoCallback(){
		Debug.Log("ltLogoCallback");
	}

	void pauseNow(){
		LeanTween.pause( ltLogo );
	}

}
