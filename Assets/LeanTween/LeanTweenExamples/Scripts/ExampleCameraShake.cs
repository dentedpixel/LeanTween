using UnityEngine;
using System.Collections;

public class ExampleCameraShake : MonoBehaviour {

	void Start () {
		LeanTween.rotateAround( gameObject, Vector3.up, 1f, 0.2f).setEase( LeanTweenType.easeShake ).setLoopClamp().setRepeat(-1);
		LeanTween.rotateAround( gameObject, Vector3.right, 1f, 0.25f).setEase( LeanTweenType.easeShake ).setLoopClamp().setRepeat(-1).setDelay(0.05f);
	}

}
