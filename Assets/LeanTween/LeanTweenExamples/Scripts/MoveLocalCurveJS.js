#pragma strict

public var customAnimationCurve:AnimationCurve;

public var pt1:Transform;
public var pt2:Transform;
public var pt3:Transform;
public var pt4:Transform;

private var containingSphere:Transform;
private var spline:LTSpline;
private var ltLogo:GameObject;

function Start () {
	ltLogo = GameObject.Find("LeanTweenLogo");
	containingSphere = GameObject.Find("ContaingCube").transform;
	
	var path:Vector3[] = [pt1.position,pt1.position,pt2.position,pt3.position,pt4.position,pt4.position];
	spline = new LTSpline( path );
	LeanTween.moveSplineLocal( ltLogo, path, 3.0 ).setEase(LeanTweenType.easeInQuad).setOrientToPath(true).setRepeat(-1);
}

function Update(){
	containingSphere.transform.eulerAngles.y += Time.deltaTime*3.0;
}

function OnDrawGizmos(){
	if(spline!=null) 
		spline.gizmoDraw(1.0f); // debug aid to be able to see the path in the scene inspector
}

