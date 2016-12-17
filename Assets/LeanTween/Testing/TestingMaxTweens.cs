using UnityEngine;
using System.Collections;

public class TestingMaxTweens : MonoBehaviour {

	private int tweenIter = 0;

	void Awake(){
		LeanTween.init (20);
	}

	// Use this for initialization
	void Start () {
	
	}
	
	void Update(){
		GameObject box = GameObject.CreatePrimitive(PrimitiveType.Cube);
		Destroy( box.GetComponent( typeof(BoxCollider) ) as Component );

		Debug.Log ("tweenIter:" + tweenIter + " tweensRunning:" + LeanTween.tweensRunning + " Time:" + Time.time);
		if (tweenIter < 20) {
			LeanTween.moveX (box, 100f, 10f);
			tweenIter++;
		}
	}
}
