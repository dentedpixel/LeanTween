#pragma strict

public var customAnimationCurve:AnimationCurve;
public var shakeCurve:AnimationCurve;

public var pt1:Transform;
public var pt2:Transform;
public var pt3:Transform;
public var pt4:Transform;
public var pt5:Transform;

function Awake(){
	LeanTween.init(400); // This line is optional. Here you can specify the maximum number of tweens you will use (the default is 400).  This must be called before any use of LeanTween is made for it to be effective.
}

function Start () {
	ltLogo = GameObject.Find("LeanTweenLogo");
	cycleThroughExamples();
	// loopTestClamp();
	// loopTestPingPong();
	// LeanTween.delayedCall(2.6, loopPause);
	// LeanTween.delayedCall(3.5, loopResume);
	// updateValue3Example();
}

function OnGUI(){
	GUI.Label(Rect(0.03*Screen.width,0.03*Screen.height,0.5*Screen.width,0.3*Screen.height), "useEstimatedTime:"+useEstimatedTime);
}

private var exampleIter:int = 0;
private var exampleFunctions = [updateValue3Example,loopTestPingPong,loopTestClamp,moveOnACurveExample,punchTest, customTweenExample, moveExample, rotateExample, scaleExample, updateValueExample, alphaExample, moveLocalExample, delayedCallExample, rotateAroundExample];
private var useEstimatedTime:boolean = true;
private var ltLogo:GameObject;

function cycleThroughExamples(){
	
	if(exampleIter==0){
		useEstimatedTime = !useEstimatedTime;
		Time.timeScale = useEstimatedTime ? 0 : 1; // pause the Time Scale to show the effectiveness of the useEstimatedTime feature (this is very usefull with Pause Screens)
	}
	exampleFunctions[ exampleIter ]();
	exampleIter = exampleIter+1>=exampleFunctions.length ? 0 : exampleIter + 1;
	
	LeanTween.delayedCall( 1.05, cycleThroughExamples, ["useEstimatedTime",useEstimatedTime]);
}

function loopTestClamp(){
	Debug.Log("loopTestClamp");
	var cube1:GameObject = GameObject.Find("Cube1");
	cube1.transform.localScale.z = 1.0;
	LeanTween.scaleZ( cube1, 4.0, 1.0, ["ease",LeanTweenType.easeOutElastic,"useEstimatedTime",useEstimatedTime,"repeat",7]);
}

function loopPause(){
	var cube1:GameObject = GameObject.Find("Cube1");
	LeanTween.pause(cube1);
}

function loopResume(){
	var cube1:GameObject = GameObject.Find("Cube1");
	LeanTween.resume(cube1 );
}

private var loopTestId:int;

function loopTestPingPong(){
	Debug.Log("loopTestPingPong");
	var cube2:GameObject = GameObject.Find("Cube2");
	cube2.transform.localScale.y = 1.0;
	LeanTween.scaleY( cube2, 4.0, 1.0, ["ease",LeanTweenType.easeOutQuad,"useEstimatedTime",useEstimatedTime,"repeat",8,"loopType",LeanTweenType.pingPong]);
}

function moveOnACurveExample(){
	Debug.Log("moveOnACurveExample");
	var path:Vector3[] = [ltLogo.transform.position,pt1.position,pt2.position,pt3.position,pt3.position,pt4.position,pt5.position,ltLogo.transform.position];
	LeanTween.move( ltLogo, path, 1.0, ["ease",LeanTweenType.easeInQuad,"useEstimatedTime",useEstimatedTime,"orientToPath",true]);
}

function punchTest(){
	LeanTween.moveX( ltLogo, 7, 1.0, ["useEstimatedTime",useEstimatedTime, "ease",LeanTweenType.punch]);
}

function customTweenExample(){
	Debug.Log("customTweenExample");
	
	LeanTween.moveX( ltLogo, -10, 0.5, ["useEstimatedTime",useEstimatedTime, "ease",customAnimationCurve]);
	LeanTween.moveX( ltLogo, 0, 0.5, ["delay",0.5,"useEstimatedTime",useEstimatedTime, "ease",customAnimationCurve]);
}

function moveExample(){
	Debug.Log("moveExample");
	
	LeanTween.move( ltLogo, new Vector3(-2f,-1f,0f), 0.5f, ["useEstimatedTime",useEstimatedTime]);
	LeanTween.move( ltLogo, ltLogo.transform.position, 0.5f, ["delay",0.5f,"useEstimatedTime",useEstimatedTime]);
}

function rotateExample(){
	Debug.Log("rotateExample");
	
	LeanTween.rotate( ltLogo, Vector3(0,360,0), 1.0, ["ease",LeanTweenType.easeOutQuad,"useEstimatedTime",useEstimatedTime]);
}

function scaleExample(){
	Debug.Log("scaleExample");
	
	var currentScale:Vector3 = ltLogo.transform.localScale;
	LeanTween.scale( ltLogo, new Vector3(currentScale.x+0.2,currentScale.y+0.2,currentScale.z+0.2), 1, ["ease",LeanTweenType.easeOutBounce,"useEstimatedTime",useEstimatedTime]);
}

function updateValueExample(){
	Debug.Log("updateValueExample");
	LeanTween.value( ltLogo, updateValueExampleCallback, ltLogo.transform.eulerAngles.y, 270.0, 1, ["ease",LeanTweenType.easeOutElastic,"useEstimatedTime",useEstimatedTime]);
}

function updateValueExampleCallback( val:float ){
	ltLogo.transform.eulerAngles.y = val;
}

function updateValue3Example(){
	Debug.Log("updateValue3Example");
	LeanTween.value( ltLogo, updateValue3ExampleCallback, new Vector3(0.0, 270.0, 0.0), new Vector3(30.0, 270.0, 180), 0.5, ["ease",LeanTweenType.easeInBounce,"useEstimatedTime",useEstimatedTime,"repeat",2,"loopType",LeanTweenType.pingPong]);
}

function updateValue3ExampleCallback( val:Vector3 ){
	ltLogo.transform.eulerAngles = val;
}

function delayedCallExample(){
	Debug.Log("delayedCallExample");
	
	LeanTween.delayedCall(0.5, delayedCallExampleCallback);
	// LeanTween.delayedCall(gameObject, 1, delayedCallCallback); // pass an object of type GameObject value in case you want the tween to quit if this gameObject is ever destroyed (this is useful with tweens the might be interrupted when a new level is loaded).
}

function delayedCallExampleCallback(){
	Debug.Log("Delayed function was called");
	var currentScale:Vector3 = gameObject.transform.localScale;
	LeanTween.scale( ltLogo, new Vector3(currentScale.x-0.2,currentScale.y-0.2,currentScale.z-0.2), 0.5, ["ease",LeanTweenType.easeInOutCirc,"useEstimatedTime",useEstimatedTime]);
}

function alphaExample(){
	Debug.Log("alphaExample");
	
	var cube:GameObject = GameObject.Find ("LCharacter");
	LeanTween.alpha( cube, 0.0f, 0.5f, ["useEstimatedTime",useEstimatedTime] );
	LeanTween.alpha( cube, 1.0f, 0.5f, ["delay",0.5f,"useEstimatedTime",useEstimatedTime] );
}

function moveLocalExample(){
	Debug.Log("moveLocalExample");
	
	var cube:GameObject = GameObject.Find ("LCharacter");
	var origPos:Vector3 = cube.transform.localPosition;
	LeanTween.moveLocal( cube, new Vector3(0.0f,2.0f,0.0f), 0.5f, ["useEstimatedTime",useEstimatedTime]);
	LeanTween.moveLocal( cube, origPos, 0.5f, ["delay",0.5f,"useEstimatedTime",useEstimatedTime]);
}

function rotateAroundExample(){
	Debug.Log("rotateAroundExample");
	
	var cube:GameObject = GameObject.Find ("LCharacter");
	LeanTween.rotateAround( cube, Vector3.up, 360.0f, 1.0f, ["useEstimatedTime",useEstimatedTime] );
}

function moveXExample(){
	LeanTween.moveX( ltLogo, 5, 0.5);
}

function rotateXExample(){

}

function scaleXExample(){

}
