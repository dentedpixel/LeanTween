#pragma strict

public var customAnimationCurve:AnimationCurve;

public var pt1:Transform;
public var pt2:Transform;
public var pt3:Transform;
public var pt4:Transform;
public var pt5:Transform;

private var containingSphere:Transform;

function Awake(){
	LeanTween.init(400); // This line is optional. Here you can specify the maximum number of tweens you will use (the default is 400).  This must be called before any use of LeanTween is made for it to be effective.
}

function Start () {
	ltLogo = GameObject.Find("LeanTweenLogo");
	containingSphere = GameObject.Find("ContaingCube").transform;
	cycleThroughExamples();
}

function OnGUI(){
	GUI.Label(Rect(0.03*Screen.width,0.03*Screen.height,0.5*Screen.width,0.3*Screen.height), "useEstimatedTime:"+useEstimatedTime);
}

function Update(){
	containingSphere.transform.eulerAngles.y += Time.deltaTime*100.0;
}

private var exampleIter:int = 0;
private var exampleFunctions = [moveOnACurveExample];
private var useEstimatedTime:boolean = true;
private var ltLogo:GameObject;

function cycleThroughExamples(){
	if(exampleIter==0){
		useEstimatedTime = !useEstimatedTime;
		Time.timeScale = useEstimatedTime ? 0 : 1; // pause the Time Scale to show the effectiveness of the useEstimatedTime feature (this is very usefull with Pause Screens)
	}
	exampleFunctions[ exampleIter ]();
	exampleIter = exampleIter+1>=exampleFunctions.length ? 0 : exampleIter + 1;
	
	LeanTween.delayedCall( 3.05, cycleThroughExamples, ["useEstimatedTime",useEstimatedTime]);
}

function moveOnACurveExample(){
	Debug.Log("moveOnACurveExample");
	var path:Vector3[] = [ltLogo.transform.localPosition,pt1.position,pt2.position,pt3.position,pt3.position,pt4.position,pt5.position,ltLogo.transform.localPosition];
	LeanTween.moveLocal( ltLogo, path, 3.0 ).setEase(LeanTweenType.easeInQuad).setOrientToPath(true).setUseEstimatedTime(useEstimatedTime);
}
