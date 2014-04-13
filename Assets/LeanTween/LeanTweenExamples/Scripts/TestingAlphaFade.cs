using UnityEngine;
using System.Collections;

public class TestingAlphaFade : MonoBehaviour {

	// Use this for initialization
	void Start () {
		
		LeanTween.alpha(gameObject, 0f, 1f).setLoopPingPong();
	}
	
}
