using UnityEngine;
using System.Collections;
using System;
using System.Threading;

public class TestingRotateAround : MonoBehaviour {
	
	private GameObject ltLogo;

	void Awake(){
		// LeanTween.init(3200); // This line is optional. Here you can specify the maximum number of tweens you will use (the default is 400).  This must be called before any use of LeanTween is made for it to be effective.
	}

	void Start () {
		ltLogo = GameObject.Find("LeanTweenLogo");

		LeanTween.rotateAround(ltLogo, Vector3.up, 360f, 1f);
	}

}
