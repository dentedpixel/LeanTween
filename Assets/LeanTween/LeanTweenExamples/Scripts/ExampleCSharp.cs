using UnityEngine;
using System.Collections;
using System;
using System.Threading;

public class ExampleCSharp : MonoBehaviour {
	public AnimationCurve customAnimationCurve;
	public Transform pt1;
	public Transform pt2;
	public Transform pt3;
	public Transform pt4;
	public Transform pt5;
	
	public delegate void NextFunc();
	private int exampleIter = 0;
	private string[] exampleFunctions = new string[] { "updateValue3Example", "loopTestClamp", "loopTestPingPong", "moveOnACurveExample", "customTweenExample", "moveExample", "rotateExample", "scaleExample", "updateValueExample", "delayedCallExample", "alphaExample", "moveLocalExample", "rotateAroundExample" };
	private bool useEstimatedTime = true;
	private GameObject ltLogo;

	void Awake(){
		LeanTween.init(400); // This line is optional. Here you can specify the maximum number of tweens you will use (the default is 400).  This must be called before any use of LeanTween is made for it to be effective.
	}

	void Start () {
		ltLogo = GameObject.Find("LeanTweenLogo");
		cycleThroughExamples();
	}

	void OnGUI(){
		GUI.Label(new Rect(0.03f*Screen.width,0.03f*Screen.height,0.5f*Screen.width,0.3f*Screen.height), "useEstimatedTime:"+useEstimatedTime);
	}
	
	void cycleThroughExamples(){
		if(exampleIter==0){
			useEstimatedTime = !useEstimatedTime;
			Time.timeScale = useEstimatedTime ? 0 : 1.0f; // pause the Time Scale to show the effectiveness of the useEstimatedTime feature (this is very usefull with Pause Screens)
		}
		gameObject.BroadcastMessage( exampleFunctions[ exampleIter ] );
		
		exampleIter = exampleIter+1>=exampleFunctions.Length ? 0 : exampleIter + 1;
		
		LeanTween.delayedCall( gameObject, 1.05f, "cycleThroughExamples", new object[]{ "useEstimatedTime", useEstimatedTime, "ease", customAnimationCurve } );
	}

	public void loopTestClamp(){
		Debug.Log("loopTestClamp");
		GameObject cube1 = GameObject.Find("Cube1");
		cube1.transform.localScale = new Vector3(1.0f, 1.0f, 1.0f);
		LeanTween.scaleZ( cube1, 4.0f, 1.0f, new object[]{ "ease",LeanTweenType.easeOutElastic,"useEstimatedTime",useEstimatedTime,"repeat",7});
	}

	public void loopPause(){
		GameObject cube1 = GameObject.Find("Cube1");
		LeanTween.pause(cube1);
	}

	public void loopResume(){
		GameObject cube1 = GameObject.Find("Cube1");
		LeanTween.resume(cube1 );
	}

	private int loopTestId;

	public void loopTestPingPong(){
		Debug.Log("loopTestPingPong");
		GameObject cube2 = GameObject.Find("Cube2");
		cube2.transform.localScale = new Vector3(1.0f, 1.0f, 1.0f);
		LeanTween.scaleY( cube2, 4.0f, 1.0f, new object[]{ "ease",LeanTweenType.easeOutQuad,"useEstimatedTime",useEstimatedTime,"repeat",8,"loopType",LeanTweenType.pingPong});
	}

	public void moveOnACurveExample(){
		Debug.Log("moveOnACurveExample");

		Vector3[] path = new Vector3[] { ltLogo.transform.position,pt1.position,pt2.position,pt3.position,pt3.position,pt4.position,pt5.position,ltLogo.transform.position};
		LeanTween.move( ltLogo, path, 1.0f, new object[]{ "ease",LeanTweenType.easeOutQuad,"useEstimatedTime",useEstimatedTime,"orientToPath",true});
	}

	public void punchTest(){
		LeanTween.moveX( ltLogo, 7.0f, 1.0f, new object[]{"useEstimatedTime",useEstimatedTime, "ease",LeanTweenType.punch});
	}
	
	public void customTweenExample(){
		Debug.Log("customTweenExample");
		
		LeanTween.moveX( ltLogo, -10.0f, 0.5f, new object[]{ "useEstimatedTime", useEstimatedTime, "ease", customAnimationCurve });
		LeanTween.moveX( ltLogo, 0.0f, 0.5f, new object[]{ "delay", 0.5f, "useEstimatedTime", useEstimatedTime, "ease", customAnimationCurve });
	}
	
	public void moveExample(){
		Debug.Log("moveExample");
		
		LeanTween.move( ltLogo, new Vector3(-2f,-1f,0f), 0.5f, new object[]{"useEstimatedTime",useEstimatedTime});
		LeanTween.move( ltLogo, ltLogo.transform.position, 0.5f, new object[]{"delay",0.5f,"useEstimatedTime",useEstimatedTime});
	}
	
	public void rotateExample(){
		Debug.Log("rotateExample");

		Hashtable returnParam = new Hashtable();
		returnParam.Add("yo", 5.0);
		
		Hashtable optional = new Hashtable();
		optional.Add("useEstimatedTime", useEstimatedTime);
		optional.Add("ease", LeanTweenType.easeOutQuad);
		optional.Add("onComplete", "rotateFinished");
		optional.Add("onCompleteParam", returnParam);
		optional.Add("onCompleteTarget", gameObject);
		optional.Add("onUpdate", "rotateOnUpdate");
		optional.Add("onUpdateTarget", gameObject);
		LeanTween.rotate( ltLogo, new Vector3(0f,360f,0f), 1, optional);
	}

	public void rotateOnUpdate( float val ){
		Debug.Log("rotating val:"+val);
	}

	public void rotateFinished( Hashtable hash ){
		Debug.Log("rotateFinished hash:"+hash["yo"]);
	}
	
	public void scaleExample(){
		Debug.Log("scaleExample");
		
		Vector3 currentScale = ltLogo.transform.localScale;
		LeanTween.scale( ltLogo, new Vector3(currentScale.x+0.2f,currentScale.y+0.2f,currentScale.z+0.2f), 1f, new object[]{ "useEstimatedTime", useEstimatedTime, "ease", LeanTweenType.easeOutBounce });
	}
	
	public void updateValueExample(){
		Debug.Log("updateValueExample");
		Hashtable pass = new Hashtable();
		pass.Add("message", "hi");
		LeanTween.value( gameObject, updateValueExampleCallback, ltLogo.transform.eulerAngles.y, 270f, 1f, new object[]{ "useEstimatedTime", useEstimatedTime, "ease", LeanTweenType.easeOutElastic, "onUpdateParam", pass });
	}
	
	public void updateValueExampleCallback( float val, Hashtable hash ){
		Debug.Log("message:"+hash["message"]);
		Vector3 tmp = ltLogo.transform.eulerAngles;
		tmp.y = val;
		ltLogo.transform.eulerAngles = tmp;
	}

	public void updateValue3Example(){
		Debug.Log("updateValue3Example");
		LeanTween.value( gameObject, "updateValue3ExampleCallback", new Vector3(0.0f, 270.0f, 0.0f), new Vector3(30.0f, 270.0f, 180f), 0.5f, new object[]{"ease",LeanTweenType.easeInBounce,"useEstimatedTime",useEstimatedTime,"repeat",2,"loopType",LeanTweenType.pingPong});
	}

	public void updateValue3ExampleCallback( Vector3 val ){
		ltLogo.transform.eulerAngles = val;
	}
	
	public void delayedCallExample(){
		Debug.Log("delayedCallExample");
		
		LeanTween.delayedCall(gameObject, 0.5f, "delayedCallExampleCallback");
	}
	
	public void delayedCallExampleCallback(){
		Debug.Log("Delayed function was called");
		Vector3 currentScale = ltLogo.transform.localScale;

		LeanTween.scale( ltLogo, new Vector3(currentScale.x-0.2f,currentScale.y-0.2f,currentScale.z-0.2f), 0.5f, new object[]{ "useEstimatedTime", useEstimatedTime, "ease", LeanTweenType.easeInOutCirc });
	}

	public void alphaExample(){
		Debug.Log("alphaExample");
		
		GameObject cube = GameObject.Find ("LCharacter");
		LeanTween.alpha( cube, 0.0f, 0.5f, new object[]{ "useEstimatedTime",useEstimatedTime} );
		LeanTween.alpha( cube, 1.0f, 0.5f, new object[]{ "delay",0.5f,"useEstimatedTime",useEstimatedTime} );
	}

	public void moveLocalExample(){
		Debug.Log("moveLocalExample");
		
		GameObject cube = GameObject.Find ("LCharacter");
		Vector3 origPos = cube.transform.localPosition;
		LeanTween.moveLocal( cube, new Vector3(0.0f,2.0f,0.0f), 0.5f, new object[]{ "useEstimatedTime",useEstimatedTime});
		LeanTween.moveLocal( cube, origPos, 0.5f, new object[]{ "delay",0.5f,"useEstimatedTime",useEstimatedTime});
	}

	public void rotateAroundExample(){
		Debug.Log("rotateAroundExample");
		
		GameObject cube = GameObject.Find ("LCharacter");
		LeanTween.rotateAround( cube, Vector3.up, 360.0f, 1.0f, new object[]{"useEstimatedTime",useEstimatedTime} );
	}

}
