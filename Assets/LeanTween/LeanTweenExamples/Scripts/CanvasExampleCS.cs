using UnityEngine;
using System.Collections;

public class CanvasExampleCS : MonoBehaviour {
	#if UNITY_4_6 || UNITY_5_0
	
	public RectTransform button;

	void Start () {
		
		LeanTween.move(button, new Vector3(200f,100f,0f), 1f);
		LeanTween.rotateAround(button, Vector3.forward, 90f, 1f).setDelay(1f);
		LeanTween.scale(button, button.localScale*2f, 1f).setDelay(2f);
	}
	
	#endif
}
