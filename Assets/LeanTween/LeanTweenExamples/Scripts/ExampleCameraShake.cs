using UnityEngine;
using System.Collections;

public class ExampleCameraShake : MonoBehaviour {

	LTDescr tween1;
	LTDescr tween2;

	void Start () {
		tween1 = LeanTween.rotateAroundLocal( gameObject, Vector3.up, 1f, 0.2f).setEase( LeanTweenType.easeShake ).setLoopClamp().setRepeat(-1);
		tween2 = LeanTween.rotateAroundLocal( gameObject, Vector3.right, 1f, 0.25f).setEase( LeanTweenType.easeShake ).setLoopClamp().setRepeat(-1).setDelay(0.05f);

		LeanTween.delayedCall(gameObject, 3f, stopShake);
	}

	void stopShake(){
		tween1.setRepeat(1);
		tween2.setRepeat(1);
	}

}
