using UnityEngine;
using System.Collections;

public class Testing240 : MonoBehaviour {

    public GameObject cube1;

	// Use this for initialization
	void Start () {
        LTDescr lt1 = LeanTween.moveY(cube1, cube1.transform.position.y - 15.0f, 10f).setEase(LeanTweenType.easeInQuad).setDestroyOnComplete(false).setOnComplete(()=>{
            Debug.Log("Done");
        });

        LeanTween.rotateAround(cube1, Vector3.forward, 360.0f, 10f).setRepeat(-1);
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
