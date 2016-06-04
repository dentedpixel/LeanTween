using UnityEngine;
using System.Collections;

public class TestingIssue2 : MonoBehaviour {
	public RectTransform rect;
	public GameObject go;

	// Use this for initialization
	void Start () {
		
		int id1 = LeanTween.move(go,new Vector3(-.209f,-3.891f,-01.162f),2.0f).setEase(LeanTweenType.easeInQuart).id;
		int id2 = LeanTween.rotate(rect,360f,1f).id;

		Debug.Log("id1:"+id1+" 2:"+id2);
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
