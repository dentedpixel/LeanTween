using UnityEngine;
using System.Collections;
using System;
using System.Threading;

public class ExampleCSharp : MonoBehaviour {
	public GUIText debugInfo;
	public AnimationCurve customAnimationCurve;
	public Transform pt1;
	public Transform pt2;
	public Transform pt3;
	public Transform pt4;
	public Transform pt5;
	
	public delegate void NextFunc();
	private int exampleIter = 0;
	private string[] exampleFunctions = new string[] { "moveOnACurveExample", "customTweenExample", "moveExample", "rotateExample", "scaleExample", "updateValueExample", "delayedCallExample", "alphaExample", "moveLocalExample" };
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
		LeanTween.delayedCall( gameObject, 1.05f, "cycleThroughExamples", new object[]{ "useEstimatedTime", useEstimatedTime, "ease", customAnimationCurve } );
	}

	public void moveOnACurveExample(){
		Debug.Log("moveOnACurveExample");

		LeanTween.move( gameObject, new Vector3[] { pt1.position,pt2.position,pt3.position,pt4.position,pt5.position,transform.position}, 1.0f, new object[]{ "ease",LeanTweenType.easeOutQuad,"useEstimatedTime",useEstimatedTime});
	}
	
	public void customTweenExample(){
		Debug.Log("customTweenExample");
		
		LeanTween.moveX( gameObject, -10.0f, 0.5f, new object[]{ "useEstimatedTime", useEstimatedTime, "ease", customAnimationCurve });
		LeanTween.moveX( gameObject, 0.0f, 0.5f, new object[]{ "delay", 0.5f, "useEstimatedTime", useEstimatedTime, "ease", customAnimationCurve });
	}
	
	public void moveExample(){
		Debug.Log("moveExample");
		
		LeanTween.move( gameObject, new Vector3(-2f,-1f,0f), 0.5f, new object[]{ "useEstimatedTime", useEstimatedTime });
		LeanTween.move( gameObject, new Vector3(0f,0f,0f), 0.5f, new object[]{ "delay", 0.5f, "useEstimatedTime", useEstimatedTime});
	}
	
	public void rotateExample(){
		Debug.Log("rotateExample");

		Hashtable returnParam = new Hashtable();
		returnParam.Add("yo", 5.0);
		
		Hashtable optional = new Hashtable();
		optional.Add("useEstimatedTime", useEstimatedTime);
		optional.Add("ease",LeanTweenType.easeOutQuad);
		optional.Add("onComplete", "rotateFinished");
		optional.Add("onCompleteParam", returnParam);
		optional.Add("onCompleteTarget",gameObject);
		optional.Add("onUpdate", "rotateOnUpdate");
		optional.Add("onUpdateTarget",gameObject);
		LeanTween.rotate( gameObject, new Vector3(180f,360f,0f), 1, optional);
	}

	public void rotateOnUpdate( float val ){
		Debug.Log("rotating val:"+val);
	}

	public void rotateFinished( Hashtable hash ){
		Debug.Log("rotateFinished hash:"+hash["yo"]);
	}
	
	public void scaleExample(){
		Debug.Log("scaleExample");
		
		Vector3 currentScale = gameObject.transform.localScale;
		LeanTween.scale( gameObject, new Vector3(currentScale.x+0.2f,currentScale.y+0.2f,currentScale.z+0.2f), 1f, new object[]{ "useEstimatedTime", useEstimatedTime, "ease", LeanTweenType.easeOutBounce });
	}
	
	public void updateValueExample(){
		Debug.Log("updateValueExample");
		
		LeanTween.value( gameObject, "updateValueExampleCallback", gameObject.transform.eulerAngles.z, 270f, 1f, new object[]{ "useEstimatedTime", useEstimatedTime, "ease", LeanTweenType.easeOutElastic });
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

		LeanTween.scale( gameObject, new Vector3(currentScale.x-0.2f,currentScale.y-0.2f,currentScale.z-0.2f), 0.5f, new object[]{ "useEstimatedTime", useEstimatedTime, "ease", LeanTweenType.easeInOutCirc });
	}
	
	public void alphaExample(){
		Debug.Log("alphaExample");
		
		GameObject cube = GameObject.Find ("ArrowArm");
		LeanTween.alpha( cube, 0.0f, 0.5f, new object[]{ "useEstimatedTime", useEstimatedTime } );
		LeanTween.alpha( cube, 1.0f, 0.5f, new object[]{ "delay", 0.5f, "useEstimatedTime", useEstimatedTime } );
	}
	
	public void moveLocalExample(){
		Debug.Log("moveLocalExample");
		
		GameObject cube = GameObject.Find ("ArrowArm");
		Vector3 origPos = cube.transform.localPosition;
		LeanTween.moveLocal( cube, new Vector3(0f,2f,0f), 0.5f, new object[]{ "useEstimatedTime", useEstimatedTime });
		LeanTween.moveLocal( cube, origPos, 0.5f, new object[]{ "delay", 0.5f, "useEstimatedTime", useEstimatedTime });
	}

}
