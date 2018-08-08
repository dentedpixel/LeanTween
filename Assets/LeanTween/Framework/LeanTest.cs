using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public static class LeanTweenExt
{
    public static LTDescr LeanMoveX(this GameObject gameObject, float to, float time) { return LeanTween.moveX(gameObject, to, time); }
    //LeanTween.addListener
    //LeanTween.alpha
    public static LTDescr LeanAlpha(this GameObject gameObject, float to, float time) { return LeanTween.alpha(gameObject, to, time); }
    //LeanTween.alphaCanvas
    public static LTDescr LeanAlphaVertex(this GameObject gameObject, float to, float time) { return LeanTween.alphaVertex(gameObject, to, time); }
    //LeanTween.alpha (RectTransform)
    public static LTDescr LeanAlpha(this RectTransform rectTransform, float to, float time) { return LeanTween.alpha(rectTransform, to, time); }
    //LeanTween.alphaCanvas
    public static LTDescr LeanAlpha(this CanvasGroup canvas, float to, float time) { return LeanTween.alphaCanvas(canvas, to, time); }
    //LeanTween.alphaText
    public static LTDescr LeanAlphaText(this RectTransform rectTransform, float to, float time) { return LeanTween.alphaText(rectTransform, to, time); }
    //LeanTween.cancel
    public static void LeanCancel(this GameObject gameObject) { LeanTween.cancel(gameObject); }
    public static void LeanCancel(this GameObject gameObject, bool callOnComplete) { LeanTween.cancel(gameObject, callOnComplete); }
    public static void LeanCancel(this GameObject gameObject, int uniqueId, bool callOnComplete = false) { LeanTween.cancel(gameObject, uniqueId, callOnComplete); }
    //LeanTween.cancel
    public static void LeanCancel(this RectTransform rectTransform) { LeanTween.cancel(rectTransform); }
    //LeanTween.cancelAll
    //LeanTween.color
    public static LTDescr LeanColor(this GameObject gameObject, Color to, float time) { return LeanTween.color(gameObject, to, time); }
    //LeanTween.colorText
    public static LTDescr LeanColorText(this RectTransform rectTransform, Color to, float time) { return LeanTween.colorText(rectTransform, to, time); }
    //LeanTween.delayedCall
    public static LTDescr LeanDelayedCall(this GameObject gameObject, float delayTime, System.Action callback) { return LeanTween.delayedCall(gameObject, delayTime, callback); }
    public static LTDescr LeanDelayedCall(this GameObject gameObject, float delayTime, System.Action<object> callback) { return LeanTween.delayedCall(gameObject, delayTime, callback); }

    //LeanTween.isPaused
    public static bool LeanIsPaused(this GameObject gameObject) { return LeanTween.isPaused(gameObject); }
    public static bool LeanIsPaused(this RectTransform rectTransform) { return LeanTween.isPaused(rectTransform); }

    //LeanTween.isTweening
    public static bool LeanIsTweening(this GameObject gameObject) { return LeanTween.isTweening(gameObject); }
    //LeanTween.isTweening
    //LeanTween.move
    public static LTDescr LeanMove(this GameObject gameObject, Vector3 to, float time) { return LeanTween.move(gameObject, to, time); }
    //LeanTween.move
    // public static LTDescr LeanMoveX(this GameObject gameObject) { }
    //LeanTween.move
    // public static LTDescr LeanMoveX(this GameObject gameObject) { }
    //LeanTween.move (GUI)
    //LeanTween.move (RectTransform)
    //LeanTween.moveLocal
    //LeanTween.moveLocal
    //LeanTween.moveSpline
    //LeanTween.moveSpline
    //LeanTween.moveSplineLocal
    //LeanTween.moveX
    //LeanTween.moveX (RectTransform)
    //LeanTween.moveY
    //LeanTween.moveY (RectTransform)
    //LeanTween.moveZ
    //LeanTween.moveZ (RectTransform)
    //LeanTween.pause
    //LeanTween.pause
    //LeanTween.pauseAll
    //LeanTween.play
    //LeanTween.removeListener
    //LeanTween.resume
    //LeanTween.resume
    //LeanTween.resumeAll
    //LeanTween.rotate
    //LeanTween.rotate
    //LeanTween.rotate (RectTransform)
    //LeanTween.rotateAround
    //LeanTween.rotateAround (RectTransform)
    //LeanTween.rotateAroundLocal
    //LeanTween.rotateAroundLocal (RectTransform)
    //LeanTween.rotateLocal
    //LeanTween.rotateX
    //LeanTween.rotateY
    //LeanTween.rotateZ
    //LeanTween.scale
    //LeanTween.scale (GUI)
    //LeanTween.scale (RectTransform)
    //LeanTween.scaleX
    //LeanTween.scaleY
    //LeanTween.scaleZ
    //LeanTween.sequence
    //LeanTween.size (RectTransform)
    //LeanTween.tweensRunning
    //LeanTween.value (Color)
    //LeanTween.value (Color)
    //LeanTween.value (float)
    //LeanTween.value (float)
    //LeanTween.value (float)
    //LeanTween.value (float, object)
    //LeanTween.value (Vector2)
    //LeanTween.value (Vector2)
    //LeanTween.value (Vector3)
    //LeanTween.value (Vector3)
}

public class LeanTester : MonoBehaviour {
	public float timeout = 15f;

	#if !UNITY_3_5 && !UNITY_4_0 && !UNITY_4_0_1 && !UNITY_4_1 && !UNITY_4_2 && !UNITY_4_3 && !UNITY_4_5
	public void Start(){
		StartCoroutine( timeoutCheck() );
	}

	IEnumerator timeoutCheck(){
		float pauseEndTime = Time.realtimeSinceStartup + timeout;
	    while (Time.realtimeSinceStartup < pauseEndTime)
	    {
	        yield return 0;
	    }
		if(LeanTest.testsFinished==false){
			Debug.Log(LeanTest.formatB("Tests timed out!"));
			LeanTest.overview();
		}
	}
	#endif
}

public class LeanTest : object {
	public static int expected = 0;
	private static int tests = 0;
	private static int passes = 0;

	public static float timeout = 15f;
	public static bool timeoutStarted = false;
	public static bool testsFinished = false;
	
	public static void debug( string name, bool didPass, string failExplaination = null){
		expect( didPass, name, failExplaination);
	}

	public static void expect( bool didPass, string definition, string failExplaination = null){
		float len = printOutLength(definition);
		int paddingLen = 40-(int)(len*1.05f);
		#if UNITY_FLASH
		string padding = padRight(paddingLen);
		#else
		string padding = "".PadRight(paddingLen,"_"[0]);
		#endif
		string logName = formatB(definition) +" " + padding + " [ "+ (didPass ? formatC("pass","green") : formatC("fail","red")) +" ]";
		if(didPass==false && failExplaination!=null)
			logName += " - " + failExplaination;
		Debug.Log(logName);
		if(didPass)
			passes++;
		tests++;
		
		// Debug.Log("tests:"+tests+" expected:"+expected);
		if(tests==expected && testsFinished==false){
			overview();
		}else if(tests>expected){
			Debug.Log(formatB("Too many tests for a final report!") + " set LeanTest.expected = "+tests);
		}

		if(timeoutStarted==false){
			timeoutStarted = true;
			GameObject tester = new GameObject();
			tester.name = "~LeanTest";
			LeanTester test = tester.AddComponent(typeof(LeanTester)) as LeanTester;
			test.timeout = timeout;
			#if !UNITY_EDITOR
			tester.hideFlags = HideFlags.HideAndDontSave;
			#endif
		}
	}
	
	public static string padRight(int len){
		string str = "";
		for(int i = 0; i < len; i++){
			str += "_";
		}
		return str;
	}
	
	public static float printOutLength( string str ){
		float len = 0.0f;
		for(int i = 0; i < str.Length; i++){
			if(str[i]=="I"[0]){
				len += 0.5f;
			}else if(str[i]=="J"[0]){
				len += 0.85f;
			}else{
				len += 1.0f;
			}
		}
		return len;
	}
	
	public static string formatBC( string str, string color ){
		return formatC(formatB(str),color);
	}
	
	public static string formatB( string str ){
		#if UNITY_3_5 || UNITY_4_0 || UNITY_4_0_1 || UNITY_4_1 || UNITY_4_2
		return str;
		#else
		return "<b>"+ str + "</b>";
		#endif
	}
	
	public static string formatC( string str, string color ){
		#if UNITY_3_5 || UNITY_4_0 || UNITY_4_0_1 || UNITY_4_1 || UNITY_4_2
		return str;
		#else
		return "<color="+color+">"+ str + "</color>";
		#endif
	}
	
	public static void overview(){ 
		testsFinished = true;
		int failedCnt = (expected-passes);
		string failedStr = failedCnt > 0 ? formatBC(""+failedCnt,"red") : ""+failedCnt;
		Debug.Log(formatB("Final Report:")+" _____________________ PASSED: "+formatBC(""+passes,"green")+" FAILED: "+failedStr+" ");
	}
}
	