#pragma strict

public var exportCurve:AnimationCurve;

function Start () {
	var str:String = "new AnimationCurve( ";
		
	for(var i:int = 0; i < exportCurve.length; i++){
		str += "new Keyframe("+exportCurve[i].time+"f, "+exportCurve[i].value+"f)";
		if(i<exportCurve.length-1)
			str += ", ";
	}
	str += " ) ";

	Debug.Log("AnimationCurve:");
	Debug.Log(str);
}
