using UnityEngine;
using System.Collections;

public class TestingAlphaFade : MonoBehaviour {

	GameObject sphere1;

	// Use this for initialization
	void Start () {
		
		LeanTween.alpha(gameObject, 0f, 1f).setLoopPingPong();

		sphere1 = GameObject.Find("Sphere1");

		LeanTween.alpha(sphere1, 0.0f, 1.0f).setLoopPingPong();
	}
	
}
