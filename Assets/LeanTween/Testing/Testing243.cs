using UnityEngine;
using System.Collections;

public class Testing243 : MonoBehaviour {
	public GameObject cube1;

	// Use this for initialization
	void Start () {
		cube1.transform.localPosition = new Vector3(0, 10, -10);
		LeanTween.move(cube1, new Vector3(0, 0, -10), 1f).setEaseInOutQuart().setOnUpdate( ( Vector3 val )=>{
			Debug.Log("val:"+val);	
		}).setOnComplete(() => {
			Debug.Log("cube1 end pos:"+cube1.transform.position);
		});
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
