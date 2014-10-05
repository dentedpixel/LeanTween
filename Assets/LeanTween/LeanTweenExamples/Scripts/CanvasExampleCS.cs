using UnityEngine;
using System.Collections;

public class CanvasExampleCS : MonoBehaviour {
	#if UNITY_4_6 || UNITY_5_0

	public RectTransform button;

	void Start () {
		
		// Tweening various values in a block callback style
		LeanTween.value(button.gameObject, button.anchoredPosition, new Vector2(200f,100f), 1f ).setOnUpdate( 
			(Vector3 val)=>{
				button.anchoredPosition = new Vector2(val.x, val.y);
			}
		);

		LeanTween.value(gameObject, 1f, 0.5f, 1f ).setOnUpdate( 
			(float volume)=>{
				Debug.Log("volume:"+volume);
			}
		);

		LeanTween.value(gameObject, gameObject.transform.position, gameObject.transform.position + new Vector3(0,1f,0), 1f ).setOnUpdate( 
			(Vector3 val)=>{
				gameObject.transform.position = val;
			}
		);

		LeanTween.value(gameObject, Color.red, Color.green, 1f ).setOnUpdate( 
			(Color val)=>{
				UnityEngine.UI.Image image = (UnityEngine.UI.Image)button.gameObject.GetComponent( typeof(UnityEngine.UI.Image) );
				image.color = val;
			}
		);

		// Tweening Using Unity's new Canvas GUI System
		LeanTween.move(button, new Vector3(200f,-100f,0f), 1f).setDelay(1f);
		LeanTween.rotateAround(button, Vector3.forward, 90f, 1f).setDelay(2f);
		LeanTween.scale(button, button.localScale*2f, 1f).setDelay(3f);
		LeanTween.rotateAround(button, Vector3.forward, -90f, 1f).setDelay(4f).setEase(LeanTweenType.easeInOutElastic);
	}
	
	#endif
}
