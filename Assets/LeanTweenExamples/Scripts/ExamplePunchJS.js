#pragma strict

public var punchCurve:AnimationCurve; // Only used for development

// private var punch:AnimationCurve = new AnimationCurve( Keyframe(0, 0 ), Keyframe(0.112586, 0.9976035 ), Keyframe(0.3120486, -0.1720615 ), Keyframe(0.4316337, 0.07030682 ), Keyframe(0.5524869, -0.03141804 ), Keyframe(0.6549395, 0.003909959 ), Keyframe(0.770987, -0.009817753 ), Keyframe(0.8838775, 0.001939224 ), Keyframe(1, 0 ) );

function Awake(){
	LeanTween.init(400); // This line is optional. Here you can specify the maximum number of tweens you will use (the default is 400).  This must be called before any use of LeanTween is made for it to be effective.
}

function Start () {
	// var output:String = "";
	// for(var i:int = 0; i < punchCurve.keys.Length; i++){
	// 	output += "Keyframe("+punchCurve.keys[i].time+", "+punchCurve.keys[i].value+" ), ";
	// }
	// print("keys:"+output);
	punchTest();
}

function punchTest(){

	// var a = new Hashtable( [["hello",1.0],["ease",LeanTweenType.punch]] );

	LeanTween.rotate( gameObject, Vector3(-40,10,0), 1.0, ["onComplete", punchTest, "ease", LeanTweenType.punch] );
	//LeanTween.rotate( gameObject, Vector3(90,90,320), 1.0, {"ease":LeanTweenType.punch, "onComplete":punchTest});
}

