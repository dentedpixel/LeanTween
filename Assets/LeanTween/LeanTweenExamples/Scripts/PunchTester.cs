using UnityEngine;
using System.Collections;

public class PunchTester : MonoBehaviour {

	// Use this for initialization
	void Start () {
	
	}

	void Update () 
    {        
        if (Input.GetKeyDown(KeyCode.S))
        {
            LeanTween.scale(this.gameObject, Vector3.one*3f, 1.0f).setEase(LeanTweenType.easeSpring);            
            print("scale punch!");
        }
 
        if (Input.GetKeyDown(KeyCode.R))
        {
            LeanTween.rotate(this.gameObject, Vector3.one, 1.0f).setEase(LeanTweenType.punch);
            print("rotate punch!");
        }
 
        if (Input.GetKeyDown(KeyCode.M))
        {
            LeanTween.move(this.gameObject, new Vector3(0f,0f,1f), 1.0f).setEase(LeanTweenType.punch);
            print("move punch!");
        }
	}
}
