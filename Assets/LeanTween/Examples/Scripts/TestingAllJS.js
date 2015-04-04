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
	//LeanTween.delayedCall(1.0f, cycleThroughExamples);
	// loopTestClamp();
	// loopTestPingPong();
	// LeanTween.delayedCall(2.6, loopPause);
	// LeanTween.delayedCall(4.5, loopResume);
	// LeanTween.delayedCall(1.5, loopCancel);
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
	
	LeanTween.delayedCall( 1.05, cycleThroughExamples).setUseEstimatedTime(useEstimatedTime);
}

function updateValue3Example(){
	Debug.Log("updateValue3Example");
	LeanTween.value( ltLogo, updateValue3ExampleCallback, new Vector3(0.0, 270.0, 0.0), new Vector3(30.0, 270.0, 180), 0.5).setEase(LeanTweenType.easeInBounce).setLoopPingPong().setRepeat(2).setOnUpdateVector3(updateValue3ExampleUpdate).setUseEstimatedTime(useEstimatedTime);
}

function updateValue3ExampleUpdate( val:Vector3 ){
	Debug.Log("val:"+val);
}

function updateValue3ExampleCallback( val:Vector3 ){
	ltLogo.transform.eulerAngles = val;
}

function loopTestClamp(){
	Debug.Log("loopTestClamp");
	var cube1:GameObject = GameObject.Find("Cube1");
	cube1.transform.localScale.z = 1.0;
	moveId = LeanTween.scaleZ( cube1, 4.0, 1.0).setEase(LeanTweenType.easeOutElastic).setLoopClamp().setRepeat(7).setUseEstimatedTime(useEstimatedTime);
}

function loopTestPingPong(){
	Debug.Log("loopTestPingPong");
	var cube2:GameObject = GameObject.Find("Cube2");
	cube2.transform.localScale.y = 1.0;
	pingPongDescr = LeanTween.scaleY( cube2, 4.0, 1.0).setEase(LeanTweenType.easeOutQuad).setLoopPingPong(4).setUseEstimatedTime(useEstimatedTime);
	Debug.Log("id:"+pingPongDescr.id);
}

function moveOnACurveExample(){
	Debug.Log("moveOnACurveExample");
	var path:Vector3[] = [ltLogo.transform.position,pt1.position,pt2.position,pt3.position,pt3.position,pt4.position,pt5.position,ltLogo.transform.position];
	LeanTween.move( ltLogo, path, 1.0).setEase(LeanTweenType.easeInQuad).setOrientToPath(true).setUseEstimatedTime(useEstimatedTime);
}

function punchTest(){
	LeanTween.moveX( ltLogo, 7, 1.0).setEase(LeanTweenType.punch).setUseEstimatedTime(useEstimatedTime);
}

function customTweenExample(){
	Debug.Log("customTweenExample");
	
	LeanTween.moveX( ltLogo, -10, 0.5).setEase(customAnimationCurve).setUseEstimatedTime(useEstimatedTime);
	LeanTween.moveX( ltLogo, 0, 0.5).setDelay(0.5).setEase(customAnimationCurve).setUseEstimatedTime(useEstimatedTime);
}

function moveExample(){
	Debug.Log("moveExample");
	
	LeanTween.move( ltLogo, new Vector3(-2f,-1f,0f), 0.5f).setUseEstimatedTime(useEstimatedTime);
	LeanTween.move( ltLogo, ltLogo.transform.position, 0.5f).setDelay(0.5).setUseEstimatedTime(useEstimatedTime);
}

function rotateExample(){
	Debug.Log("rotateExample");
	
	LeanTween.rotate( ltLogo, Vector3(0,360,0), 1.0).setEase(LeanTweenType.easeOutQuad).setUseEstimatedTime(useEstimatedTime);
}

function scaleExample(){
	Debug.Log("scaleExample");
	
	var currentScale:Vector3 = ltLogo.transform.localScale;
	LeanTween.scale( ltLogo, new Vector3(currentScale.x+0.2,currentScale.y+0.2,currentScale.z+0.2), 1).setEase(LeanTweenType.easeOutBounce).setUseEstimatedTime(useEstimatedTime);
}

function updateValueExample(){
	Debug.Log("updateValueExample");
	LeanTween.value( ltLogo, updateValueExampleCallback, ltLogo.transform.eulerAngles.y, 270.0, 1).setEase(LeanTweenType.easeOutElastic).setUseEstimatedTime(useEstimatedTime);
}

function updateValueExampleCallback( val:float ){
	ltLogo.transform.eulerAngles.y = val;
}

function delayedCallExample(){
	Debug.Log("delayedCallExample");
	
	LeanTween.delayedCall(0.5, delayedCallExampleCallback).setUseEstimatedTime(useEstimatedTime);
	// LeanTween.delayedCall(gameObject, 1, delayedCallCallback); // pass an object of type GameObject value in case you want the tween to quit if this gameObject is ever destroyed (this is useful with tweens the might be interrupted when a new level is loaded).
}

function delayedCallExampleCallback(){
	Debug.Log("Delayed function was called");
	var currentScale:Vector3 = gameObject.transform.localScale;
	LeanTween.scale( ltLogo, new Vector3(currentScale.x-0.2,currentScale.y-0.2,currentScale.z-0.2), 0.5).setEase(LeanTweenType.easeInOutCirc).setUseEstimatedTime(useEstimatedTime);
}

function alphaExample(){
	Debug.Log("alphaExample");
	
	var cube:GameObject = GameObject.Find ("LCharacter");
	LeanTween.alpha( cube, 0.0f, 0.5f).setUseEstimatedTime(useEstimatedTime);
	LeanTween.alpha( cube, 1.0f, 0.5f).setDelay(0.5f).setUseEstimatedTime(useEstimatedTime);
}

function moveLocalExample(){
	Debug.Log("moveLocalExample");
	
	var cube:GameObject = GameObject.Find ("LCharacter");
	var origPos:Vector3 = cube.transform.localPosition;
	LeanTween.moveLocal( cube, new Vector3(0.0f,2.0f,0.0f), 0.5f).setUseEstimatedTime(useEstimatedTime);
	LeanTween.moveLocal( cube, origPos, 0.5f).setDelay(0.5f).setUseEstimatedTime(useEstimatedTime);
}

function rotateAroundExample(){
	Debug.Log("rotateAroundExample");
	
	var cube:GameObject = GameObject.Find ("LCharacter");
	LeanTween.rotateAround( cube, Vector3.up, 360.0f, 1.0f ).setUseEstimatedTime(useEstimatedTime);
}

function moveXExample(){
	LeanTween.moveX( ltLogo, 5, 0.5);
}

function rotateXExample(){

}

function scaleXExample(){

}

private var moveId:LTDescr;
private var pingPongDescr:LTDescr;

function loopPause(){
	moveId.pause();
}

function loopResume(){
	moveId.resume();
}

function loopCancel(){
	pingPongDescr.cancel();
}
