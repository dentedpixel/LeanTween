using UnityEngine;
using System.Collections;
using System.Reflection;

public class GeneralEasingTypes : MonoBehaviour {

	public float lineDrawScale = 10f;

	void Start () {

		string[] easeTypes = new string[]{"EaseInQuad","EaseOutQuad","EaseInOutQuad"};
	
		for(int i = 0; i < easeTypes.Length; i++){
			string easeName = easeTypes[i];
			Transform obj1 = GameObject.Find(easeName).transform.FindChild("Line");
			float obj1val = 0f;
			LTDescr lt = LeanTween.value( obj1.gameObject, 0f, 1f, 5f).setLoopCount(-1).setOnUpdate( (float val)=>{
				Vector3 vec = obj1.localPosition;
				vec.x = obj1val*lineDrawScale;
				vec.y = val*lineDrawScale;
				obj1.localPosition = vec;

				obj1val += Time.deltaTime/5f;
				if(obj1val>1f)
					obj1val = 0f;
			});
			MethodInfo theMethod = lt.GetType().GetMethod("set"+easeName);
			theMethod.Invoke(lt, null);
		}
	}

}
