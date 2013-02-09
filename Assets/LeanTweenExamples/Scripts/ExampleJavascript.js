#pragma strict

public var debugInfo:GUIText;

public var customAnimationCurve:AnimationCurve;

function Awake(){
	LeanTween.init(400); // This line is optional. Here you can specify the maximum number of tweens you will use (the default is 400).  This must be called before any use of LeanTween is made for it to be effective.
}

function Start () {
	cycleThroughExamples();

	//Debug.Log("closestRot 1:"+ LeanTween.closestRot(-3, 185));
}

private var exampleIter:int = 0;
private var exampleFunctions = [customTweenExample, moveExample, rotateExample, scaleExample, updateValueExample, delayedCallExample, alphaExample, moveLocalExample];
private var useEstimatedTime:boolean = true;
function cycleThroughExamples(){
	if(exampleIter==0){
		useEstimatedTime = !useEstimatedTime;
		Time.timeScale = useEstimatedTime ? 0 : 1; // pause the Time Scale to show the effectiveness of the useEstimatedTime feature (this is very usefull with Pause Screens)
	}
	exampleFunctions[ exampleIter ]();
	
	exampleIter = exampleIter+1>=exampleFunctions.length ? 0 : exampleIter + 1;
	
	debugInfo.text = "useEstimatedTime:"+useEstimatedTime;
	LeanTween.delayedCall( 1.05, cycleThroughExamples, {"useEstimatedTime":useEstimatedTime});
}

function customTweenExample(){
	Debug.Log("customTweenExample");
	
	LeanTween.moveX( gameObject, -10, 0.5, {"useEstimatedTime":useEstimatedTime, "ease":customAnimationCurve});
	LeanTween.moveX( gameObject, 0, 0.5, {"delay":0.5,"useEstimatedTime":useEstimatedTime, "ease":customAnimationCurve});
}


function moveExample(){
	Debug.Log("moveExample");
	
	LeanTween.move( gameObject, new Vector3(-2,-1,0), 0.5, {"useEstimatedTime":useEstimatedTime});
	LeanTween.move( gameObject, new Vector3(0,0,0), 0.5, {"delay":0.5,"useEstimatedTime":useEstimatedTime});
}

function rotateExample(){
	Debug.Log("rotateExample");
	
	LeanTween.rotate( gameObject, new Vector3(180,360,0), 1, {"ease":LeanTweenType.easeOutQuad,"useEstimatedTime":useEstimatedTime});
}

function scaleExample(){
	Debug.Log("scaleExample");
	
	var currentScale:Vector3 = gameObject.transform.localScale;
	LeanTween.scale( gameObject, new Vector3(currentScale.x+0.2,currentScale.y+0.2,currentScale.z+0.2), 1, {"ease":LeanTweenType.easeOutBounce,"useEstimatedTime":useEstimatedTime});
}

function updateValueExample(){
	Debug.Log("updateValueExample");
	
	LeanTween.value( gameObject, updateValueExampleCallback, gameObject.transform.eulerAngles.z, 270.0, 1, {"ease":LeanTweenType.easeOutElastic,"useEstimatedTime":useEstimatedTime});
}

function updateValueExampleCallback( val:float ){
	gameObject.transform.eulerAngles.z = val;
}

function delayedCallExample(){
	Debug.Log("delayedCallExample");
	
	LeanTween.delayedCall(0.5, delayedCallExampleCallback);
	
	// LeanTween.delayedCall(gameObject, 1, delayedCallCallback); // pass an object of type GameObject value in case you want the tween to quit if this gameObject is ever destroyed (this is useful with tweens the might be interrupted when a new level is loaded).
}

function delayedCallExampleCallback(){
	Debug.Log("Delayed function was called");
	var currentScale:Vector3 = gameObject.transform.localScale;
	LeanTween.scale( gameObject, new Vector3(currentScale.x-0.2,currentScale.y-0.2,currentScale.z-0.2), 0.5, {"ease":LeanTweenType.easeInOutCirc,"useEstimatedTime":useEstimatedTime});
}

function alphaExample(){
	Debug.Log("alphaExample");
	
	var cube:GameObject = GameObject.Find ("Cube1");
	LeanTween.alpha( cube, 0.0, 0.5, {"useEstimatedTime":useEstimatedTime} );
	LeanTween.alpha( cube, 1.0, 0.5, {"delay":0.5,"useEstimatedTime":useEstimatedTime} );
}

function moveLocalExample(){
	Debug.Log("moveLocalExample");
	
	var cube:GameObject = GameObject.Find ("Cube1");
	var origPos:Vector3 = cube.transform.localPosition;
	LeanTween.moveLocal( cube, new Vector3(0,2,0), 0.5, {"useEstimatedTime":useEstimatedTime});
	LeanTween.moveLocal( cube, origPos, 0.5, {"delay":0.5,"useEstimatedTime":useEstimatedTime});
}

function moveXExample(){

}

function rotateXExample(){

}

function scaleXExample(){

}
