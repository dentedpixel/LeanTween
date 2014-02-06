using UnityEngine;
using System.Collections;
using System;
using System.Threading;

public class TestingUniqueId : MonoBehaviour {
	
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

		loopTestClamp();
		loopTestPingPong();
		
		//LeanTween.move( ltLogo, Vector3.zero, 10f);
		//LeanTween.delayedCall(2f, pauseNow);

		LeanTween.delayedCall(1, loopCancel);
		LeanTween.delayedCall(10, loopCancel2);
		LeanTween.delayedCall(5, loopPause);
		LeanTween.delayedCall(8, loopResume);
	}

	void pauseNow(){
		Time.timeScale = 0f;
		Debug.Log("pausing");
	}

	void endlessCallback(){
		Debug.Log("endless");
	}


	public void loopTestClamp(){
		cube1 = GameObject.Find("Cube1");
		cube1.transform.localScale = new Vector3(1.0f, 1.0f, 1.0f);
		cube1ScaleZId = LeanTween.scaleZ( cube1, 4.0f, 1.0f).setEase(LeanTweenType.easeOutElastic).setRepeat(7).setLoopClamp().id;//

		slowShakeId = LeanTween.moveY( cube1, cube1.transform.position.y+0.3f, 1.0f).setEase(LeanTweenType.easeInOutCirc).setRepeat(-1).setLoopPingPong().id;
	}

	public void loopTestPingPong(){
		cube2 = GameObject.Find("Cube2");
		cube2.transform.localScale = new Vector3(1.0f, 1.0f, 1.0f);
		cube2ScaleYId = LeanTween.scaleY( cube2, 4.0f, 1.0f ).setEase(LeanTweenType.easeOutQuad).setLoopPingPong().setRepeat(8).id;
		//LeanTween.scaleY( cube2, 4.0f, 1.0f, LeanTween.options().setEaseOutQuad().setRepeat(8).setLoopPingPong().setUseEstimatedTime(useEstimatedTime) );
	}


	public void loopCancel(){
		LeanTween.cancel( cube1, cube1ScaleZId );
	}

	public void loopCancel2(){
		LeanTween.cancel( cube1, slowShakeId );
	}

	public void loopPause(){
		LeanTween.pause( cube2ScaleYId );
	}

	public void loopResume(){
		LeanTween.resume( cube2ScaleYId );
	}

	public void punchTest(){
		LeanTween.moveX( ltLogo, 7.0f, 1.0f ).setEase(LeanTweenType.punch);
	}
}
