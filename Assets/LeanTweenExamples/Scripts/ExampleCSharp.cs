using UnityEngine;
using System.Collections;
using System;
using System.Threading;

public class ExampleCSharp : MonoBehaviour {
	public GUIText debugInfo;
	public AnimationCurve customAnimationCurve;
	
	public delegate void NextFunc();
	private int exampleIter = 0;
	private string[] exampleFunctions = new string[] { "customTweenExample", "moveExample", "rotateExample", "scaleExample", "updateValueExample", "delayedCallExample", "alphaExample", "moveLocalExample" };
	private bool useEstimatedTime = true;
	
	void Awake(){
		LeanTween.init(400); // This line is optional. Here you can specify the maximum number of tweens you will use (the default is 400).  This must be called before any use of LeanTween is made for it to be effective.
	}

	void Start () {
		cycleThroughExamples();
	}
	
	void cycleThroughExamples(){
		if(exampleIter==0){
			useEstimatedTime = !useEstimatedTime;
			Time.timeScale = useEstimatedTime ? 0 : 1; // pause the Time Scale to show the effectiveness of the useEstimatedTime feature (this is very usefull with Pause Screens)
		}
		gameObject.BroadcastMessage( exampleFunctions[ exampleIter ] );
		
		exampleIter = exampleIter+1>=exampleFunctions.Length ? 0 : exampleIter + 1;
		
		debugInfo.text = "useEstimatedTime:"+useEstimatedTime;
		Hashtable optional = new Hashtable();
		optional.Add("useEstimatedTime", useEstimatedTime);
		LeanTween.delayedCall( gameObject, 1.05f, "cycleThroughExamples", optional );
	}
	
	public void customTweenExample(){
		Debug.Log("customTweenExample");
		
		Hashtable optional = new Hashtable();
		optional.Add("useEstimatedTime", useEstimatedTime);
		optional.Add("ease",customAnimationCurve);
		LeanTween.moveX( gameObject, -10.0f, 0.5f, optional);
		
		Hashtable optional2 = new Hashtable();
		optional2.Add("useEstimatedTime", useEstimatedTime);
		optional2.Add("ease",customAnimationCurve);
		optional2.Add("delay",0.5f);	
		LeanTween.moveX( gameObject, 0.0f, 0.5f, optional2);
	}
	
	public void moveExample(){
		Debug.Log("moveExample");
		
		Hashtable optional = new Hashtable();
		optional.Add("useEstimatedTime", useEstimatedTime);
		LeanTween.move( gameObject, new Vector3(-2f,-1f,0f), 0.5f, optional);
		Hashtable optional2 = new Hashtable();
		optional2.Add("useEstimatedTime", useEstimatedTime);
		optional2.Add("delay",0.5f);	
		LeanTween.move( gameObject, new Vector3(0f,0f,0f), 0.5f, optional2);
	}
	
	public void rotateExample(){
		Debug.Log("rotateExample");
		
		Hashtable optional = new Hashtable();
		optional.Add("useEstimatedTime", useEstimatedTime);
		optional.Add("ease",LeanTweenType.easeOutQuad);
		optional.Add("onComplete", "rotateFinished");
		optional.Add("onCompleteTarget",gameObject);
		optional.Add("onUpdate", "rotateOnUpdate");
		optional.Add("onUpdateTarget",gameObject);
		LeanTween.rotate( gameObject, new Vector3(180f,360f,0f), 1, optional);
	}

	public void rotateOnUpdate( float val ){
		Debug.Log("rotating val:"+val);
	}

	public void rotateFinished(){
		Debug.Log("rotateFinished");
	}
	
	public void scaleExample(){
		Debug.Log("scaleExample");
		
		Hashtable optional = new Hashtable();
		optional.Add("useEstimatedTime", useEstimatedTime);
		optional.Add("ease",LeanTweenType.easeOutBounce);
		Vector3 currentScale = gameObject.transform.localScale;
		LeanTween.scale( gameObject, new Vector3(currentScale.x+0.2f,currentScale.y+0.2f,currentScale.z+0.2f), 1f, optional);
	}
	
	public void updateValueExample(){
		Debug.Log("updateValueExample");
		
		Hashtable optional = new Hashtable();
		optional.Add("useEstimatedTime", useEstimatedTime);
		optional.Add("ease",LeanTweenType.easeOutElastic);
		LeanTween.value( gameObject, "updateValueExampleCallback", gameObject.transform.eulerAngles.z, 270f, 1f, optional);
	}
	
	public void updateValueExampleCallback( float val ){
		Vector3 tmp = transform.eulerAngles;
		tmp.z = val;
		transform.eulerAngles = tmp;
	}
	
	public void delayedCallExample(){
		Debug.Log("delayedCallExample");
		
		LeanTween.delayedCall(gameObject, 0.5f, "delayedCallExampleCallback");
		
	}
	
	public void delayedCallExampleCallback(){
		Debug.Log("Delayed function was called");
		Vector3 currentScale = gameObject.transform.localScale;
		Hashtable optional = new Hashtable();
		optional.Add("useEstimatedTime", useEstimatedTime);
		optional.Add("ease",LeanTweenType.easeInOutCirc);	
		LeanTween.scale( gameObject, new Vector3(currentScale.x-0.2f,currentScale.y-0.2f,currentScale.z-0.2f), 0.5f, optional);
	}
	
	public void alphaExample(){
		Debug.Log("alphaExample");
		
		GameObject cube = GameObject.Find ("Cube1");
		Hashtable optional = new Hashtable();
		optional.Add("useEstimatedTime", useEstimatedTime);	
		LeanTween.alpha( cube, 0.0f, 0.5f, optional );
		Hashtable optional2 = new Hashtable();
		optional2.Add("useEstimatedTime", useEstimatedTime);
		optional2.Add("delay",0.5f);
		LeanTween.alpha( cube, 1.0f, 0.5f, optional2 );
	}
	
	public void moveLocalExample(){
		Debug.Log("moveLocalExample");
		
		GameObject cube = GameObject.Find ("Cube1");
		Vector3 origPos = cube.transform.localPosition;
		Hashtable optional = new Hashtable();
		optional.Add("useEstimatedTime", useEstimatedTime);
		LeanTween.moveLocal( cube, new Vector3(0f,2f,0f), 0.5f, optional);
		Hashtable optional2 = new Hashtable();
		optional2.Add("useEstimatedTime", useEstimatedTime);
		optional2.Add("delay",0.5f);	
		LeanTween.moveLocal( cube, origPos, 0.5f, optional2);
	}

}
