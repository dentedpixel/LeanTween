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
