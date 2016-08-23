using UnityEngine;
using System.Collections;

public class GeneralEasingTypes : MonoBehaviour {

	void Start () {
	
		Transform obj1 = GameObject.Find("EaseInQuad").transform.FindChild("Line");
		float obj1val = 0f;
		LeanTween.value( obj1.gameObject, 0f, 1f, 1f).setLoopCount(-1).setLoopClamp().setOnUpdate( (float val)=>{
			Vector3 vec = obj1.localPosition;
			vec.x = obj1val;
			vec.y = val;
			obj1.localPosition = vec;

			obj1val += Time.deltaTime;
			Debug.Log("time:"+obj1val+" val:"+val);
			if(obj1val>1f)
				obj1val = 0f;
		}).setEaseInQuad();
	}

}
