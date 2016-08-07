// LeanTween version 2.34 - http://dentedpixel.com/developer-diary/
//
// The MIT License (MIT)
//
// Copyright (c) 2016 Russell Savage - Dented Pixel
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.


/*
TERMS OF USE - EASING EQUATIONS#
Open source under the BSD License.
Copyright (c)2001 Robert Penner
All rights reserved.
Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
Neither the name of the author nor the names of contributors may be used to endorse or promote products derived from this software without specific prior written permission.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

/**
* Pass this to the "ease" parameter, to get a different easing behavior<br><br>
* <strong>Example: </strong><br>LeanTween.rotateX(gameObject, 270.0f, 1.5f).setEase(LeanTweenType.easeInBack);
*
* @class LeanTweenType
*/

/**
* @property {integer} linear
*/
/**
* @property {integer} easeOutQuad
*/
/**
* @property {integer} easeInQuad
*/
/**
* @property {integer} easeInOutQuad
*/
/**
* @property {integer} easeInCubic
*/
/**
* @property {integer} easeOutCubic
*/
/**
* @property {integer} easeInOutCubic
*/
/**
* @property {integer} easeInQuart
*/
/**
* @property {integer} easeOutQuart
*/
/**
* @property {integer} easeInOutQuart
*/
/**
* @property {integer} easeInQuint
*/
/**
* @property {integer} easeOutQuint
*/
/**
* @property {integer} easeInOutQuint
*/
/**
* @property {integer} easeInSine
*/
/**
* @property {integer} easeOutSine
*/
/**
* @property {integer} easeInOutSine
*/
/**
* @property {integer} easeInExpo
*/
/**
* @property {integer} easeOutExpo
*/
/**
* @property {integer} easeInOutExpo
*/
/**
* @property {integer} easeInCirc
*/
/**
* @property {integer} easeOutCirc
*/
/**
* @property {integer} easeInOutCirc
*/
/**
* @property {integer} easeInBounce
*/
/**
* @property {integer} easeOutBounce
*/
/**
* @property {integer} easeInOutBounce
*/
/**
* @property {integer} easeInBack
*/
/**
* @property {integer} easeOutBack
*/
/**
* @property {integer} easeInOutBack
*/
/**
* @property {integer} easeInElastic
*/
/**
* @property {integer} easeOutElastic
*/
/**
* @property {integer} easeInOutElastic
*/
/**
* @property {integer} punch
*/
using UnityEngine;
using System;
using System.Collections.Generic;

public enum TweenAction{
	MOVE_X,
	MOVE_Y,
	MOVE_Z,
	MOVE_LOCAL_X,
	MOVE_LOCAL_Y,
	MOVE_LOCAL_Z,
	MOVE_CURVED,
	MOVE_CURVED_LOCAL,
	MOVE_SPLINE,
	MOVE_SPLINE_LOCAL,
	SCALE_X,
	SCALE_Y,
	SCALE_Z,
	ROTATE_X,
	ROTATE_Y,
	ROTATE_Z,
	ROTATE_AROUND,
	ROTATE_AROUND_LOCAL,
	CANVAS_ROTATEAROUND,
	CANVAS_ROTATEAROUND_LOCAL,
	CANVAS_PLAYSPRITE,
	ALPHA,
    TEXT_ALPHA,
    CANVAS_ALPHA,
    CANVASGROUP_ALPHA,
    ALPHA_VERTEX,
	COLOR,
	CALLBACK_COLOR,
    TEXT_COLOR,
	CANVAS_COLOR,
	CANVAS_MOVE_X,
	CANVAS_MOVE_Y,
	CANVAS_MOVE_Z,
	CALLBACK,
	MOVE,
	MOVE_LOCAL,
	MOVE_TO_TRANSFORM,
	ROTATE,
	ROTATE_LOCAL,
	SCALE,
	VALUE3,
	GUI_MOVE,
	GUI_MOVE_MARGIN,
	GUI_SCALE,
	GUI_ALPHA,
	GUI_ROTATE,
	DELAYED_SOUND,
	CANVAS_MOVE,
	CANVAS_SCALE,
}

public enum LeanTweenType{
	notUsed, linear, easeOutQuad, easeInQuad, easeInOutQuad, easeInCubic, easeOutCubic, easeInOutCubic, easeInQuart, easeOutQuart, easeInOutQuart, 
	easeInQuint, easeOutQuint, easeInOutQuint, easeInSine, easeOutSine, easeInOutSine, easeInExpo, easeOutExpo, easeInOutExpo, easeInCirc, easeOutCirc, easeInOutCirc, 
	easeInBounce, easeOutBounce, easeInOutBounce, easeInBack, easeOutBack, easeInOutBack, easeInElastic, easeOutElastic, easeInOutElastic, easeSpring, easeShake, punch, once, clamp, pingPong, animationCurve
}

/**
* LeanTween is an efficient tweening engine for Unity3d<br><br>
* <a href="#index">Index of All Methods</a> | <a href="LTDescrLite.html">Optional Paramaters that can be passed</a><br><br>
* <strong id='optional'>Optional Parameters</strong> are passed at the end of every method<br> 
* <br>
* <i>Example:</i><br>
* LeanTween.moveX( gameObject, 1f, 1f).setEase( <a href="LeanTweenType.html">LeanTweenType</a>.easeInQuad ).setDelay(1f);<br>
* <br>
* You can pass the optional parameters in any order, and chain on as many as you wish!<br><br>
* You can also modify this tween later, just save the unique id of the tween.<br>
* <h4>Example:</h4>
* int id = LeanTween.moveX(gameObject, 1f, 1f).id;<br>
* <a href="LTDescrLite.html">LTDescrLite</a> d = LeanTween.<a href="#method_LeanTween.descr">descr</a>( id );<br><br>
* if(d!=null){ <span style="color:gray">// if the tween has already finished it will return null</span><br>
* <span style="color:gray">&nbsp;&nbsp; // change some parameters</span><br>
* &nbsp;&nbsp; d.setOnComplete( onCompleteFunc ).setEase( <a href="LeanTweenType.html">LeanTweenType</a>.easeInOutBack );<br>
* }
*
* @class LeanTween
*/

public class LeanTween : MonoBehaviour {

public static bool throwErrors = true;
public static float tau = Mathf.PI*2.0f; 

private static LTDescrLite[] tweens;
private static int[] tweensFinished;
private static LTDescrLite tween;
private static int tweenMaxSearch = -1;
private static int maxTweens = 400;
private static int frameRendered= -1;
private static GameObject _tweenEmpty;
public static float dtEstimated = -1f;
public static float dtManual;
#if UNITY_3_5 || UNITY_4_0 || UNITY_4_0_1 || UNITY_4_1 || UNITY_4_2 || UNITY_4_3 || UNITY_4_5
private static float previousRealTime;
#endif
public static float dtActual;
private static int i;
private static int j;
private static int finishedCnt;
public static AnimationCurve punch = new AnimationCurve( new Keyframe(0.0f, 0.0f ), new Keyframe(0.112586f, 0.9976035f ), new Keyframe(0.3120486f, -0.1720615f ), new Keyframe(0.4316337f, 0.07030682f ), new Keyframe(0.5524869f, -0.03141804f ), new Keyframe(0.6549395f, 0.003909959f ), new Keyframe(0.770987f, -0.009817753f ), new Keyframe(0.8838775f, 0.001939224f ), new Keyframe(1.0f, 0.0f ) );
public static AnimationCurve shake = new AnimationCurve( new Keyframe(0f, 0f), new Keyframe(0.25f, 1f), new Keyframe(0.75f, -1f), new Keyframe(1f, 0f) ) ;

public static void init(){
	init(maxTweens);
}

public static int maxSearch{
	get{ 
		return tweenMaxSearch;
	}
}

public static int maxSimulataneousTweens{
	get {
		return maxTweens;
	}
}

/**
* Find out how many tweens you have animating at a given time
* 
* @method LeanTween.tweensRunning
* @example
*   Debug.Log("I have "+LeanTween.tweensRunning+" animating!");
*/
public static int tweensRunning{
	get{ 
		int count = 0;
		for (int i = 0; i <= tweenMaxSearch; i++){
	        if (tweens[i].toggle){
	            count++;
	        }
	    }
		return count;
	}
}

/**
* This line is optional. Here you can specify the maximum number of tweens you will use (the default is 400).  This must be called before any use of LeanTween is made for it to be effective.
* 
* @method LeanTween.init
* @param {integer} maxSimultaneousTweens:int The maximum number of tweens you will use, make sure you don't go over this limit, otherwise the code will throw an error
* @example
*   LeanTween.init( 800 );
*/
public static void init(int maxSimultaneousTweens){
	if(tweens==null){
		maxTweens = maxSimultaneousTweens;
		tweens = new LTDescrLite[maxTweens];
		tweensFinished = new int[maxTweens];
		_tweenEmpty = new GameObject();
		_tweenEmpty.name = "~LeanTween";
		_tweenEmpty.AddComponent(typeof(LeanTween));
		_tweenEmpty.isStatic = true;
		#if !UNITY_EDITOR
		_tweenEmpty.hideFlags = HideFlags.HideAndDontSave;
		#endif
		DontDestroyOnLoad( _tweenEmpty );
		for(int i = 0; i < maxTweens; i++){
			tweens[i] = new LTDescrLite();
		}

		#if UNITY_5_4_OR_NEWER
			UnityEngine.SceneManagement.SceneManager.sceneLoaded += onLevelWasLoaded54;
		#endif
	}
}

public static void reset(){
	if(tweens!=null){
		for (int i = 0; i <= tweenMaxSearch; i++){
	        if(tweens[i]!=null)
		        tweens[i].toggle = false;
	    }
	}
	tweens = null;
	Destroy(_tweenEmpty);
}

public void Update(){
	LeanTween.update();
}

#if UNITY_5_4_OR_NEWER
private static void onLevelWasLoaded54( UnityEngine.SceneManagement.Scene scene, UnityEngine.SceneManagement.LoadSceneMode mode ){ internalOnLevelWasLoaded( scene.buildIndex ); }
#else
	public void OnLevelWasLoaded( int lvl ){ internalOnLevelWasLoaded( lvl ); }
#endif

private static void internalOnLevelWasLoaded( int lvl ){
	// Debug.Log("reseting gui");
//	LTGUI.reset();
}
		
private static int maxTweenReached;

public static void update() {
	if(frameRendered != Time.frameCount){ // make sure update is only called once per frame
		init();

		#if UNITY_3_5 || UNITY_4_0 || UNITY_4_0_1 || UNITY_4_1 || UNITY_4_2 || UNITY_4_3 || UNITY_4_5
		dtEstimated = Time.realtimeSinceStartup - previousRealTime;
		if(dtEstimated>0.2f) // a catch put in, when at the start sometimes this number can grow unrealistically large
			dtEstimated = 0.2f;
		previousRealTime = Time.realtimeSinceStartup;
		#else
		if(dtEstimated<0f){
			dtEstimated = 0f;
		}else{
			dtEstimated = Time.unscaledDeltaTime;
		}
		// Debug.Log("Time.unscaledDeltaTime:"+Time.unscaledDeltaTime);
		#endif

		dtActual = Time.deltaTime;
		maxTweenReached = 0;
		finishedCnt = 0;
//		if(tweenMaxSearch>1500)
//			Debug.Log("tweenMaxSearch:"+tweenMaxSearch +" maxTweens:"+maxTweens);
		for( int i = 0; i <= tweenMaxSearch && i < maxTweens; i++){
			tween = tweens[i];
//			if(i==3 && tweens[i].toggle)
//				Debug.Log("tweens["+i+"]:"+tweens[i]);
			if(tween.toggle){
				maxTweenReached = i;
				
				if (tween.update2()) {
					if (tween.loopCount == 0 || tween.loopType == LeanTweenType.once || tween.trans==null) {
	                    tweensFinished[finishedCnt] = i;
	                    finishedCnt++;
	                }
                }
			}
		}

		// Debug.Log("maxTweenReached:"+maxTweenReached);
		tweenMaxSearch = maxTweenReached;
		frameRendered = Time.frameCount;

//		for(int i = 0; i < finishedCnt; i++){
//			j = tweensFinished[i];
//			tween = tweens[ j ];
//	
//			// logError("removing tween:"+tween);
//			if(tween.onComplete!=null){
//				System.Action onComplete = tween.onComplete;
//				//logError("removing tween for j:"+j+" tween:"+tween);
//				removeTween(j);
//				//tween.cleanup();
//				onComplete();
//				
//			}else if(tween.onCompleteObject!=null){
//				System.Action<object> onCompleteObject = tween.onCompleteObject;
//				object onCompleteParam = tween.onCompleteParam;
//				removeTween(j);
//				//tween.cleanup();
//				onCompleteObject(onCompleteParam);
//			}
//			
//			else{
//				removeTween(j);
//				//tween.cleanup();
//			}
//		}

	}
}





public static int startSearch = 0;
public static LTDescrLite d;

private static LTDescrLite pushNewTween( GameObject gameObject, Vector3 to, float time, TweenAction tweenAction, LTDescrLite tween ){
	init(maxTweens);
	if(gameObject==null || tween==null)
		return null;

	tween.trans = gameObject.transform;
	tween.to = to;
	tween.time = time;
	tween.type = tweenAction;
	//tween.hasPhysics = gameObject.rigidbody!=null;
	
	return tween;
}
	public static object logError( string error ){
		if(throwErrors) Debug.LogError(error); else Debug.Log(error);
		return null;
	}

	public static LTDescrLite options(){
		init();

		bool found = false;
		for(j=0, i = startSearch; j < maxTweens; i++){
			if(i>=maxTweens-1)
				i = 0;
			if(tweens[i].toggle==false){
				if(i+1>tweenMaxSearch)
					tweenMaxSearch = i+1;
				startSearch = i + 1;
				found = true;
				break;
			}

			j++;
//			if(j >= maxTweens)
//				return logError("LeanTween - You have run out of available spaces for tweening. To avoid this error increase the number of spaces to available for tweening when you initialize the LeanTween class ex: LeanTween.init( "+(maxTweens*2)+" );") as LTDescr;
		}
		if(found==false)
			logError("no available tween found!");

		// Debug.Log("new tween with i:"+i+" counter:"+tweens[i].counter+" tweenMaxSearch:"+tweenMaxSearch+" tween:"+tweens[i]);
		tweens[i].reset();
		tweens[i].setId( (uint)i );

		return tweens[i];
	}

	public static LTDescrLite move(GameObject gameObject, Vector3 to, float time){
		return pushNewTween( gameObject, to, time, TweenAction.MOVE, options() );
	}

}

public class LTBezier {
	public float length;

	private Vector3 a;
	private Vector3 aa;
	private Vector3 bb;
	private Vector3 cc;
	private float len;
	private float[] arcLengths;

	public LTBezier(Vector3 a, Vector3 b, Vector3 c, Vector3 d, float precision){
		this.a = a;
		aa = (-a + 3*(b-c) + d);
		bb = 3*(a+c) - 6*b;
		cc = 3*(b-a);

		this.len = 1.0f / precision;
		arcLengths = new float[(int)this.len + (int)1];
		arcLengths[0] = 0;

		Vector3 ov = a;
		Vector3 v;
		float clen = 0.0f;
		for(int i = 1; i <= this.len; i++) {
			v = bezierPoint(i * precision);
			clen += (ov - v).magnitude;
			this.arcLengths[i] = clen;
			ov = v;
		}
		this.length = clen;
	}

	private float map(float u) {
		float targetLength = u * this.arcLengths[(int)this.len];
		int low = 0;
		int high = (int)this.len;
		int index = 0;
		while (low < high) {
			index = low + ((int)((high - low) / 2.0f) | 0);
			if (this.arcLengths[index] < targetLength) {
				low = index + 1;
			} else {
				high = index;
			}
		}
		if(this.arcLengths[index] > targetLength)
			index--;
		if(index<0)
			index = 0;

		return (index + (targetLength - arcLengths[index]) / (arcLengths[index + 1] - arcLengths[index])) / this.len;
	}

	private Vector3 bezierPoint(float t){
		return ((aa* t + (bb))* t + cc)* t + a;
	}

	public Vector3 point(float t){ 
		return bezierPoint( map(t) ); 
	}
}

/**
* Manually animate along a bezier path with this class
* @class LTBezierPath
* @constructor
* @param {Vector3 Array} pts A set of points that define one or many bezier paths (the paths should be passed in multiples of 4, which correspond to each individual bezier curve)<br>
* It goes in the order: <strong>startPoint</strong>,endControl,startControl,<strong>endPoint</strong> - <strong>Note:</strong> the control for the end and start are reversed! This is just a *quirk* of the API.<br>
* <img src="http://dentedpixel.com/assets/LTBezierExplanation.gif" width="413" height="196" style="margin-top:10px" />
* @example 
* LTBezierPath ltPath = new LTBezierPath( new Vector3[] { new Vector3(0f,0f,0f),new Vector3(1f,0f,0f), new Vector3(1f,0f,0f), new Vector3(1f,1f,0f)} );<br><br>
* LeanTween.move(lt, ltPath.vec3, 4.0f).setOrientToPath(true).setDelay(1f).setEase(LeanTweenType.easeInOutQuad); // animate <br>
* Vector3 pt = ltPath.point( 0.6f ); // retrieve a point along the path
*/
public class LTBezierPath {
	public Vector3[] pts;
	public float length;
	public bool orientToPath;
	public bool orientToPath2d;

	private LTBezier[] beziers;
	private float[] lengthRatio;
	private int currentBezier=0,previousBezier=0;

	public LTBezierPath(){ }
	public LTBezierPath( Vector3[] pts_ ){
		setPoints( pts_ );
	}

	public void setPoints( Vector3[] pts_ ){
		if(pts_.Length<4)
			LeanTween.logError( "LeanTween - When passing values for a vector path, you must pass four or more values!" );
		if(pts_.Length%4!=0)
			LeanTween.logError( "LeanTween - When passing values for a vector path, they must be in sets of four: controlPoint1, controlPoint2, endPoint2, controlPoint2, controlPoint2..." );

		pts = pts_;

		int k = 0;
		beziers = new LTBezier[ pts.Length / 4 ];
		lengthRatio = new float[ beziers.Length ];
		int i;
		length = 0;
		for(i = 0; i < pts.Length; i+=4){
			beziers[k] = new LTBezier(pts[i+0],pts[i+2],pts[i+1],pts[i+3],0.05f);
			length += beziers[k].length;
			k++;
		}
		// Debug.Log("beziers.Length:"+beziers.Length + " beziers:"+beziers);
		for(i = 0; i < beziers.Length; i++){
			lengthRatio[i] = beziers[i].length / length;
		}
	}

	/**
	* @property {float} distance distance of the path (in unity units)
	*/
	public float distance{
		get{
			return length;
		}
	}

	/**
	* Retrieve a point along a path
	* 
	* @method point
	* @param {float} ratio:float ratio of the point along the path you wish to receive (0-1)
	* @return {Vector3} Vector3 position of the point along the path
	* @example
	* transform.position = ltPath.point( 0.6f );
	*/
	public Vector3 point( float ratio ){
		float added = 0.0f;
		for(int i = 0; i < lengthRatio.Length; i++){
			added += lengthRatio[i];
			if(added >= ratio)
				return beziers[i].point( (ratio-(added-lengthRatio[i])) / lengthRatio[i] );
		}
		return beziers[lengthRatio.Length-1].point( 1.0f );
	}

	public void place2d( Transform transform, float ratio ){
		transform.position = point( ratio );
		ratio += 0.001f;
		if(ratio<=1.0f){
			Vector3 v3Dir = point( ratio ) - transform.position;
			float angle = Mathf.Atan2(v3Dir.y, v3Dir.x) * Mathf.Rad2Deg;
			transform.eulerAngles = new Vector3(0, 0, angle);
		}
	}

	public void placeLocal2d( Transform transform, float ratio ){
		transform.localPosition = point( ratio );
		ratio += 0.001f;
		if(ratio<=1.0f){
			Vector3 v3Dir = transform.parent.TransformPoint( point( ratio ) ) - transform.localPosition;
			float angle = Mathf.Atan2(v3Dir.y, v3Dir.x) * Mathf.Rad2Deg;
			transform.eulerAngles = new Vector3(0, 0, angle);
		}
	}

	/**
	* Place an object along a certain point on the path (facing the direction perpendicular to the path)
	* 
	* @method place
	* @param {Transform} transform:Transform the transform of the object you wish to place along the path
	* @param {float} ratio:float ratio of the point along the path you wish to receive (0-1)
	* @example
	* ltPath.place( transform, 0.6f );
	*/
	public void place( Transform transform, float ratio ){
		place( transform, ratio, Vector3.up );

	}

	/**
	* Place an object along a certain point on the path, with it facing a certain direction perpendicular to the path
	* 
	* @method place
	* @param {Transform} transform:Transform the transform of the object you wish to place along the path
	* @param {float} ratio:float ratio of the point along the path you wish to receive (0-1)
	* @param {Vector3} rotation:Vector3 the direction in which to place the transform ex: Vector3.up
	* @example
	* ltPath.place( transform, 0.6f, Vector3.left );
	*/
	public void place( Transform transform, float ratio, Vector3 worldUp ){
		transform.position = point( ratio );
		ratio += 0.001f;
		if(ratio<=1.0f)
			transform.LookAt( point( ratio ), worldUp );

	}

	/**
	* Place an object along a certain point on the path (facing the direction perpendicular to the path) - Local Space, not world-space
	* 
	* @method placeLocal
	* @param {Transform} transform:Transform the transform of the object you wish to place along the path
	* @param {float} ratio:float ratio of the point along the path you wish to receive (0-1)
	* @example
	* ltPath.placeLocal( transform, 0.6f );
	*/
	public void placeLocal( Transform transform, float ratio ){
		placeLocal( transform, ratio, Vector3.up );
	}

	/**
	* Place an object along a certain point on the path, with it facing a certain direction perpendicular to the path - Local Space, not world-space
	* 
	* @method placeLocal
	* @param {Transform} transform:Transform the transform of the object you wish to place along the path
	* @param {float} ratio:float ratio of the point along the path you wish to receive (0-1)
	* @param {Vector3} rotation:Vector3 the direction in which to place the transform ex: Vector3.up
	* @example
	* ltPath.placeLocal( transform, 0.6f, Vector3.left );
	*/
	public void placeLocal( Transform transform, float ratio, Vector3 worldUp ){
		ratio = getRationInOneRange (ratio);
		transform.localPosition = point( ratio );
		ratio = getRationInOneRange (ratio + 0.001f);
		if(ratio<=1.0f)
			transform.LookAt( transform.parent.TransformPoint( point( ratio ) ), worldUp );
	}

	public float getRationInOneRange(float ratio){
		if (ratio >= 0.0f && ratio <= 1.0f) {
			return ratio;
		} else if (ratio < 0.0f) {
			return Mathf.Ceil(ratio) - ratio;	//if -1.4 => it returns 0.4
		} else {
			return ratio - Mathf.Floor(ratio);	//if 1.4 => it return 0.4
		}
	}

	public void gizmoDraw(float t = -1.0f)
	{
		Vector3 prevPt = point(0);

		for (int i = 1; i <= 120; i++)
		{
			float pm = (float)i / 120f;
			Vector3 currPt2 = point(pm);
			//Gizmos.color = new Color(UnityEngine.Random.Range(0f,1f),UnityEngine.Random.Range(0f,1f),UnityEngine.Random.Range(0f,1f),1);
			Gizmos.color = (previousBezier == currentBezier) ? Color.magenta : Color.grey;
			Gizmos.DrawLine(currPt2, prevPt);
			prevPt = currPt2;
			previousBezier = currentBezier;
		}
	}
}

/**
* Animate along a set of points that need to be in the format: controlPoint, point1, point2.... pointLast, endControlPoint
* @class LTSpline
* @constructor
* @param {Vector3 Array} pts A set of points that define the points the path will pass through (starting with starting control point, and ending with a control point)<br>
<i><strong>Note:</strong> The first and last item just define the angle of the end points, they are not actually used in the spline path itself. If you do not care about the angle you can jus set the first two items and last two items as the same value.</i>
* @example 
* LTSpline ltSpline = new LTSpline( new Vector3[] { new Vector3(0f,0f,0f),new Vector3(0f,0f,0f), new Vector3(0f,0.5f,0f), new Vector3(1f,1f,0f), new Vector3(1f,1f,0f)} );<br><br>
* LeanTween.moveSpline(lt, ltSpline.vec3, 4.0f).setOrientToPath(true).setDelay(1f).setEase(LeanTweenType.easeInOutQuad); // animate <br>
* Vector3 pt = ltSpline.point( 0.6f ); // retrieve a point along the path
*/
[System.Serializable]
public class LTSpline {
	public static int DISTANCE_COUNT = 3; // increase for a more accurate constant speed
	public static int SUBLINE_COUNT = 20; // increase for a more accurate smoothing of the curves into lines

	/**
	* @property {float} distance distance of the spline (in unity units)
	*/
	public float distance = 0f;

	public bool constantSpeed = true;

	public Vector3[] pts;
	[System.NonSerialized]
	public Vector3[] ptsAdj;
	public int ptsAdjLength;
	public bool orientToPath;
	public bool orientToPath2d;
	private int numSections;
	private int currPt;

	public LTSpline( Vector3[] pts ){
		init( pts, true);
	}

	public LTSpline( Vector3[] pts, bool constantSpeed ) {
		this.constantSpeed = constantSpeed;
		init(pts, constantSpeed);
	}

	private void init( Vector3[] pts, bool constantSpeed){
		if(pts.Length<4){
			LeanTween.logError( "LeanTween - When passing values for a spline path, you must pass four or more values!" );
			return;
		}

		this.pts = new Vector3[pts.Length];
		System.Array.Copy(pts, this.pts, pts.Length);

		numSections = pts.Length - 3;

		float minSegment = float.PositiveInfinity;
		Vector3 earlierPoint = this.pts[1];
		float totalDistance = 0f;
		for(int i=1; i < this.pts.Length-1; i++){
			// float pointDistance = (this.pts[i]-earlierPoint).sqrMagnitude;
			float pointDistance = Vector3.Distance(this.pts[i], earlierPoint);
			//Debug.Log("pointDist:"+pointDistance);
			if(pointDistance < minSegment){
				minSegment = pointDistance;
			}

			totalDistance += pointDistance;
		}

		if(constantSpeed){
			minSegment = totalDistance / (numSections*SUBLINE_COUNT);
			//Debug.Log("minSegment:"+minSegment+" numSections:"+numSections);

			float minPrecision = minSegment / SUBLINE_COUNT; // number of subdivisions in each segment
			int precision = (int)Mathf.Ceil(totalDistance / minPrecision) * DISTANCE_COUNT;
			// Debug.Log("precision:"+precision);
			if(precision<=1) // precision has to be greater than one
				precision = 2;

			ptsAdj = new Vector3[ precision ];
			earlierPoint = interp( 0f );
			int num = 1;
			ptsAdj[0] = earlierPoint;
			distance = 0f;
			for(int i = 0; i < precision + 1; i++){
				float fract = ((float)(i)) / precision;
				// Debug.Log("fract:"+fract);
				Vector3 point = interp( fract );
				float dist = Vector3.Distance(point, earlierPoint);

				// float dist = (point-earlierPoint).sqrMagnitude;
				if(dist>=minPrecision || fract>=1.0f){
					ptsAdj[num] = point;
					distance += dist; // only add it to the total distance once we know we are adding it as an adjusted point

					earlierPoint = point;
					// Debug.Log("fract:"+fract+" point:"+point);
					num++;
				}
			}
			// make sure there is a point at the very end
			/*num++;
			Vector3 endPoint = interp( 1f );
			ptsAdj[num] = endPoint;*/
			// Debug.Log("fract 1f endPoint:"+endPoint);

			ptsAdjLength = num;
		}
		// Debug.Log("map 1f:"+map(1f)+" end:"+ptsAdj[ ptsAdjLength-1 ]);

		// Debug.Log("ptsAdjLength:"+ptsAdjLength+" minPrecision:"+minPrecision+" precision:"+precision);
	}

	public Vector3 map( float u ){
		if(u>=1f)
			return pts[ pts.Length - 2];
		float t = u * (ptsAdjLength-1);
		int first = (int)Mathf.Floor( t );
		int next = (int)Mathf.Ceil( t );

		if(first<0)
			first = 0;

		Vector3 val = ptsAdj[ first ];


		Vector3 nextVal = ptsAdj[ next ];
		float diff = t - first;

		// Debug.Log("u:"+u+" val:"+val +" nextVal:"+nextVal+" diff:"+diff+" first:"+first+" next:"+next);

		val = val + (nextVal - val) * diff;

		return val;
	}

	public Vector3 interp(float t) {
		currPt = Mathf.Min(Mathf.FloorToInt(t * (float) numSections), numSections - 1);
		float u = t * (float) numSections - (float) currPt;

		//Debug.Log("currPt:"+currPt+" numSections:"+numSections+" pts.Length :"+pts.Length );
		Vector3 a = pts[currPt];
		Vector3 b = pts[currPt + 1];
		Vector3 c = pts[currPt + 2];
		Vector3 d = pts[currPt + 3];

		Vector3 val = (.5f * (
			(-a + 3f * b - 3f * c + d) * (u * u * u)
			+ (2f * a - 5f * b + 4f * c - d) * (u * u)
			+ (-a + c) * u
			+ 2f * b));
		// Debug.Log("currPt:"+currPt+" t:"+t+" val.x"+val.x+" y:"+val.y+" z:"+val.z);

		return val;
	}

	/**
	* Retrieve a point along a path
	* 
	* @method ratioAtPoint
	* @param {Vector3} point:Vector3 given a current location it makes the best approximiation of where it is along the path ratio-wise (0-1)
	* @return {float} float of ratio along the path
	* @example
	* ratioIter = ltSpline.ratioAtPoint( transform.position );
	*/
	public float ratioAtPoint( Vector3 pt ){
		float closestDist = float.MaxValue;
		int closestI = 0;
		for (int i = 0; i < ptsAdjLength; i++) {
			float dist = Vector3.Distance(pt, ptsAdj[i]);
			// Debug.Log("i:"+i+" dist:"+dist);
			if(dist<closestDist){
				closestDist = dist;
				closestI = i;
			}
		}
		// Debug.Log("closestI:"+closestI+" ptsAdjLength:"+ptsAdjLength);
		return (float) closestI / (float)(ptsAdjLength-1);
	}

	/**
	* Retrieve a point along a path
	* 
	* @method point
	* @param {float} ratio:float ratio of the point along the path you wish to receive (0-1)
	* @return {Vector3} Vector3 position of the point along the path
	* @example
	* transform.position = ltSpline.point( 0.6f );
	*/
	public Vector3 point( float ratio ){
		float t = ratio>1f?1f:ratio;
		return constantSpeed ? map(t) : interp(t);
	}

	public void place2d( Transform transform, float ratio ){
		transform.position = point( ratio );
		ratio += 0.001f;
		if(ratio<=1.0f){
			Vector3 v3Dir = point( ratio ) - transform.position;
			float angle = Mathf.Atan2(v3Dir.y, v3Dir.x) * Mathf.Rad2Deg;
			transform.eulerAngles = new Vector3(0, 0, angle);
		}
	}

	public void placeLocal2d( Transform transform, float ratio ){
		transform.localPosition = point( ratio );
		ratio += 0.001f;
		if(ratio<=1.0f){
			Vector3 v3Dir = transform.parent.TransformPoint( point( ratio ) ) - transform.localPosition;
			float angle = Mathf.Atan2(v3Dir.y, v3Dir.x) * Mathf.Rad2Deg;
			transform.eulerAngles = new Vector3(0, 0, angle);
		}
	}


	/**
	* Place an object along a certain point on the path (facing the direction perpendicular to the path)
	* 
	* @method place
	* @param {Transform} transform:Transform the transform of the object you wish to place along the path
	* @param {float} ratio:float ratio of the point along the path you wish to receive (0-1)
	* @example
	* ltPath.place( transform, 0.6f );
	*/
	public void place( Transform transform, float ratio ){
		place(transform, ratio, Vector3.up);
	}

	/**
	* Place an object along a certain point on the path, with it facing a certain direction perpendicular to the path
	* 
	* @method place
	* @param {Transform} transform:Transform the transform of the object you wish to place along the path
	* @param {float} ratio:float ratio of the point along the path you wish to receive (0-1)
	* @param {Vector3} rotation:Vector3 the direction in which to place the transform ex: Vector3.up
	* @example
	* ltPath.place( transform, 0.6f, Vector3.left );
	*/
	public void place( Transform transform, float ratio, Vector3 worldUp ){
		// ratio = Mathf.Repeat(ratio, 1.0f); // make sure ratio is always between 0-1
		transform.position = point( ratio );
		ratio += 0.001f;
		if(ratio<=1.0f)
			transform.LookAt( point( ratio ), worldUp );

	}

	/**
	* Place an object along a certain point on the path (facing the direction perpendicular to the path) - Local Space, not world-space
	* 
	* @method placeLocal
	* @param {Transform} transform:Transform the transform of the object you wish to place along the path
	* @param {float} ratio:float ratio of the point along the path you wish to receive (0-1)
	* @example
	* ltPath.placeLocal( transform, 0.6f );
	*/
	public void placeLocal( Transform transform, float ratio ){
		placeLocal( transform, ratio, Vector3.up );
	}

	/**
	* Place an object along a certain point on the path, with it facing a certain direction perpendicular to the path - Local Space, not world-space
	* 
	* @method placeLocal
	* @param {Transform} transform:Transform the transform of the object you wish to place along the path
	* @param {float} ratio:float ratio of the point along the path you wish to receive (0-1)
	* @param {Vector3} rotation:Vector3 the direction in which to place the transform ex: Vector3.up
	* @example
	* ltPath.placeLocal( transform, 0.6f, Vector3.left );
	*/
	public void placeLocal( Transform transform, float ratio, Vector3 worldUp ){
		transform.localPosition = point( ratio );
		ratio += 0.001f;
		if(ratio<=1.0f)
			transform.LookAt( transform.parent.TransformPoint( point( ratio ) ), worldUp );
	}

	public void gizmoDraw(float t = -1.0f) {
		if(ptsAdj==null || ptsAdj.Length<=0)
			return;

		Vector3 prevPt = ptsAdj[0];

		for (int i = 0; i < ptsAdjLength; i++) {
			Vector3 currPt2 = ptsAdj[i];
			// Debug.Log("currPt2:"+currPt2);
			//Gizmos.color = new Color(UnityEngine.Random.Range(0f,1f),UnityEngine.Random.Range(0f,1f),UnityEngine.Random.Range(0f,1f),1);
			Gizmos.DrawLine(prevPt, currPt2);
			prevPt = currPt2;
		}
	}

	public void drawGizmo( Color color ) {
		if( this.ptsAdjLength>=4){

			Vector3 prevPt = this.ptsAdj[0];

			Color colorBefore = Gizmos.color;
			Gizmos.color = color;
			for (int i = 0; i < this.ptsAdjLength; i++) {
				Vector3 currPt2 = this.ptsAdj[i];
				// Debug.Log("currPt2:"+currPt2);

				Gizmos.DrawLine(prevPt, currPt2);
				prevPt = currPt2;
			}
			Gizmos.color = colorBefore;
		}
	}

	public static void drawGizmo(Transform[] arr, Color color) {
		if(arr.Length>=4){
			Vector3[] vec3s = new Vector3[arr.Length];
			for(int i = 0; i < arr.Length; i++){
				vec3s[i] = arr[i].position;
			}
			LTSpline spline = new LTSpline(vec3s);
			Vector3 prevPt = spline.ptsAdj[0];

			Color colorBefore = Gizmos.color;
			Gizmos.color = color;
			for (int i = 0; i < spline.ptsAdjLength; i++) {
				Vector3 currPt2 = spline.ptsAdj[i];
				// Debug.Log("currPt2:"+currPt2);

				Gizmos.DrawLine(prevPt, currPt2);
				prevPt = currPt2;
			}
			Gizmos.color = colorBefore;
		}
	}


	public static void drawLine(Transform[] arr, float width, Color color) {
		if(arr.Length>=4){

		}
	}

	/*public Vector3 Velocity(float t) {
		t = map( t );

		int numSections = pts.Length - 3;
		int currPt = Mathf.Min(Mathf.FloorToInt(t * (float) numSections), numSections - 1);
		float u = t * (float) numSections - (float) currPt;
				
		Vector3 a = pts[currPt];
		Vector3 b = pts[currPt + 1];
		Vector3 c = pts[currPt + 2];
		Vector3 d = pts[currPt + 3];

		return 1.5f * (-a + 3f * b - 3f * c + d) * (u * u)
				+ (2f * a -5f * b + 4f * c - d) * u
				+ .5f * c - .5f * a;
	}*/
}
