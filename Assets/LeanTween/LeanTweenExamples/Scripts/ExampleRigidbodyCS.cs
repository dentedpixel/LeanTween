using UnityEngine;
using System.Collections;

public class ExampleRigidbodyCS : MonoBehaviour {

	private GameObject ball1;
	// Use this for initialization
	void Start () {
		ball1 = GameObject.Find("Sphere1");

		LeanTween.rotateAround( ball1, Vector3.forward, -90f, 1.0f, new Hashtable());

		LeanTween.move( ball1, new Vector3(2f,0f,7f), 1.0f, new object[]{"delay",1.0f});
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
