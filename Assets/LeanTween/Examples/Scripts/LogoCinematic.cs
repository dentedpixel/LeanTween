using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class LogoCinematic : MonoBehaviour {

	public GameObject lean;

	public GameObject tween;

	void Awake(){
		
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

	void playBoom(){
		AnimationCurve volumeCurve = new AnimationCurve( new Keyframe(-0.001454365f, 0.006141067f, -3.698472f, -3.698472f), new Keyframe(0.01393294f, 2f, -3.613532f, -3.613532f), new Keyframe(0.9999977f, 0.00601998f, -0.1788428f, -0.1788428f));
		AnimationCurve frequencyCurve = new AnimationCurve( new Keyframe(2.99277E-05f, 0.002244899f, 0.01912267f, 0.01912267f), new Keyframe(0.9984757f, 0.06040816f, 0f, 0f));
		AudioClip audioClip = LeanAudio.createAudio(volumeCurve, frequencyCurve, new LeanAudioOptions().setVibrato( new Vector3[]{ new Vector3(0.1f,0f,0f)} ).setFrequency(11025));
		LeanAudio.playClipAt(audioClip, Vector3.zero);
	}
	
}
