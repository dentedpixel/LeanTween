// Copyright (c) 2012 Russell Savage - Dented Pixel
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

/*
TERMS OF USE - EASING EQUATIONS
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
* Pass this to the "ease" parameter in the optional hashtable, to get a different easing behavior<br><br>
* <strong>Example Javascript: </strong><br>LeanTween.rotateX(gameObject, 270.0f, 1.5f, {"ease":LeanTweenType.easeInBack});<br>
* <br>
* <strong>Example C#: </strong> <br>
* Hashtable optional = new Hashtable();<br>
* optional.Add("ease":LeanTweenType.easeInBack);<br>
* LeanTween.rotateX(gameObject, 270.0f, 1.5f, optional);<br>
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
using UnityEngine;
using System.Collections;
using System;
using System.Reflection;
public enum LeanTweenType{
	notUsed, linear, easeOutQuad, easeInQuad, easeInOutQuad, easeInCubic, easeOutCubic, easeInOutCubic, easeInQuart, easeOutQuart, easeInOutQuart, 
	easeInQuint, easeOutQuint, easeInOutQuint, easeInSine, easeOutSine, easeInOutSine, easeInExpo, easeOutExpo, easeInOutExpo, easeInCirc, easeOutCirc, easeInOutCirc, 
	easeInBounce, easeOutBounce, easeInOutBounce, easeInBack, easeOutBack, easeInOutBack, easeInElastic, easeOutElastic, easeInOutElastic, punch
}

class TweenDescr{
	public bool toggle;
	public Transform trans;
	public LTRect ltRect;
	public Vector3 from;
	public Vector3 to;
	public Vector3 diff;
	public float time;
	public bool useEstimatedTime;
	public bool useFrames;
	public float passed;
	public TweenAction type;
	public Hashtable optional;
	public float delay;
	//var tweenFunc:Function;
    public string tweenFunc;
	public LeanTweenType tweenType;
	public AnimationCurve animationCurve;
	public int id;

    public string TweenToString()
    {
		return "gameObject:"+trans.gameObject+" toggle:"+toggle+" passed:"+passed+" time:"+time+" delay:"+delay+" from:"+from+" to:"+to+" type:"+type+" useEstimatedTime:"+useEstimatedTime+" id:"+id;
	}
}

/**
* Animate GUI Elements by creating this object and passing the *.rect variable to the GUI method<br><br>
* <strong>Example Javascript: </strong><br>var bRect:LTRect = new LTRect( 0, 0, 100, 50 );<br>
* LeanTween.scale( bRect, Vector2(bRect.rect.width, bRect.rect.height) * 1.3, 0.25 );<br>
* function OnGUI(){<br>
* &nbsp; if(GUI.Button(bRect.rect, "Scale")){ }<br>
* }<br>
* <br>
* <strong>Example C#: </strong> <br>
* LTRect bRect = new LTRect( 0f, 0f, 100f, 50f );<br>
* LeanTween.scale( bRect, new Vector2(150f,75f), 0.25f );<br>
* void OnGUI(){<br>
* &nbsp; if(GUI.Button(bRect.rect, "Scale")){ }<br>
* }<br>
*
* @class LTRect
* @constructor
* @param {float} x:float X location
* @param {float} y:float Y location
* @param {float} width:float Width
* @param {float} height:float Height
*/

public class LTRect{
	/**
	* Pass this value to the GUI Methods
	* 
	* @property rect
	* @type {Rect} rect:Rect Rect object that controls the positioning and size
	*/
	public Rect rect;

	public LTRect(float x, float y, float width, float height){
		rect =new Rect(x,y,width,height);
	}
}

public enum TweenAction{
	MOVE_X=1,
	MOVE_Y=2,
	MOVE_Z=3,
	MOVE_LOCAL_X=4,
	MOVE_LOCAL_Y=5,
	MOVE_LOCAL_Z=6,
	SCALE_X=7,
	SCALE_Y=8,
	SCALE_Z=9,
	ROTATE_X=10,
	ROTATE_Y=11,
	ROTATE_Z=12,
	ALPHA=13,
	CALLBACK=14,
	MOVE=15,
	MOVE_LOCAL=16,
	ROTATE=17,
	ROTATE_LOCAL=18,
	SCALE=19,
	GUI_MOVE=20,
	GUI_SCALE=21
}

/**
* LeanTween is an efficient tweening engine for Unity3d<br><br>
* <strong id='optional'>Optional Parameters</strong> are passed in a hastable variable that is accepted at the end of every tweening function.<br>
* Values you can pass:<br>
* <strong>delay</strong>: time (or frames if you are using "useFrames") before the tween starts<br>
* <strong>ease</strong>: Function that desribes the easing you want to be used, you can pass your own or use many of the included tweens. ex: <i>{"ease":LeanTween.easeOutQuad}</i><br> 
* <strong>onComplete</strong>: Function to call at the end of the tween ex: <i>{"onComplete":functionToCallOnComplete}</i> or <i>{"onComplete":functionToCallOnComplete,"onCompleteParam":hashTableToPassToOnComplete}</i><br>
* <strong>onUpdate</strong>: Function to call on every update ex: <i>{"onUpdate":functionToCallOnUpdate}</i> or <i>{"onUpdate":functionToCallOnUpdate,"onUpdateParam":hashTableToPassToOnUpdate}</i><br>
* <strong>useEstimatedTime</strong>: This is useful if the Time.timeScale is set to zero (such as when the game is paused) or some other value and you still want the tween to move at a normal pace ex: <i>{"useEstimatedTime":true}</i><br>
* <strong>useFrames</strong>: Instead of time passed for both the delay and time value, the amount of frames that have passed is used <i>ex: {"useFrames":true}</i><br>
*
* @class LeanTween
*/

public class LeanTween: MonoBehaviour {

   //Added By Azade
   
    public delegate float DelFunc(float fromVect, float toVect, float ratioPassed);
   //End
public static bool throwErrors= true;

private static TweenDescr[] tweens;
private static int tweenMaxSearch = 0;
private static int maxTweens = 400;
private static int frameRendered= -1;
private static GameObject tweenEmpty;
private static float dtEstimated;
private static float dt;
private static float dtActual;
private static TweenDescr tween;
private static int i;
private static int j;
private static AnimationCurve punch = new AnimationCurve( new Keyframe(0.0f, 0.0f ), new Keyframe(0.112586f, 0.9976035f ), new Keyframe(0.3120486f, -0.1720615f ), new Keyframe(0.4316337f, 0.07030682f ), new Keyframe(0.5524869f, -0.03141804f ), new Keyframe(0.6549395f, 0.003909959f ), new Keyframe(0.770987f, -0.009817753f ), new Keyframe(0.8838775f, 0.001939224f ), new Keyframe(1.0f, 0.0f ) );


public static void init(){
	init(maxTweens);
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
		Debug.LogWarning("If possible use the LeanTween.js file, this file is only provided for people who wish to compile LeanTween as a DLL file. LeanTween.js should be fully functionaly for C# users.");
		maxTweens = maxSimultaneousTweens;
		tweens = new TweenDescr[maxTweens];
		tweenEmpty = new GameObject();
		tweenEmpty.name = "~LeanTween";
		tweenEmpty.AddComponent(typeof(LeanTween));
		tweenEmpty.isStatic = true;
		DontDestroyOnLoad( tweenEmpty );
		for(int i = 0; i < maxTweens; i++){
			tweens[i] = new TweenDescr();
		}
	}
}

public void Update(){
	LeanTween.update();
}

private static Transform trans;
private static float timeTotal;
private static int tweenAction;
private static Hashtable optionalItems;
//private static var tweenFunc:Function;
private static string tweenFunc;
private static AnimationCurve animationCurve;
private static float ratioPassed;
private static float from;
private static float to;
private static float val;
private static Vector3 fromVect;
private static Vector3 toVect;
private static Vector3 newVect;
private static bool isTweenFinished;
private static GameObject target;
private static GameObject customTarget;

public static void update() {
	if(frameRendered != Time.frameCount){ // make sure update is only called once per frame
		init();
		dtEstimated = (Application.targetFrameRate > 0 )? (1.0f/ Application.targetFrameRate ): (1.0f / 60.0f);
		dtActual = Time.deltaTime*Time.timeScale;
		// if(tweenMaxSearch>1500)
		// 	Debug.Log("tweenMaxSearch:"+tweenMaxSearch +" maxTweens:"+maxTweens);
		for( int i = 0; i < tweenMaxSearch && i < maxTweens; i++){
			
			//Debug.Log("tweens["+i+"].toggle:"+tweens[i].toggle);
			if(tweens[i].toggle){
				tween = tweens[i];
				trans = tween.trans as Transform;
				timeTotal = tween.time;
				tweenAction = (int)tween.type;
				tweenFunc = tween.tweenFunc;
				animationCurve = tween.animationCurve;
				optionalItems = tween.optional;
				//Debug.Log("type:"+tweens[i].type+" animationCurve:"+animationCurve);
				dt = dtActual;
				if( tween.useEstimatedTime ){
					dt = dtEstimated;
				}else if( tween.useFrames ){
					dt = 1;
				}
				//Debug.Log("tweens["+i+"]:"+tweens[i] + " dt:"+Time.deltaTime);
				
				if(trans==null){
					removeTween(i);
					continue;
				}
				
				// Check for tween finished
				isTweenFinished = false;
				if(tween.passed + dt > timeTotal){
					isTweenFinished = true;
					tween.passed = timeTotal; // Set to the exact end time so that it can finish tween exactly on the end value
				}
				
				if(tween.passed==0.0 && tweens[i].delay==0.0){
					// Initialize From Values
					switch((TweenAction)tweenAction){
						case TweenAction.MOVE:
							tween.from = trans.position; break;
						case TweenAction.MOVE_X:
							tween.from.x = trans.position.x; break;
						case TweenAction.MOVE_Y:
							tween.from.x = trans.position.y; break;
						case TweenAction.MOVE_Z:
							tween.from.x = trans.position.z; break;
						case TweenAction.MOVE_LOCAL_X:
							tweens[i].from.x = trans.localPosition.x; break;
						case TweenAction.MOVE_LOCAL_Y:
							tweens[i].from.x = trans.localPosition.y; break;
						case TweenAction.MOVE_LOCAL_Z:
							tweens[i].from.x = trans.localPosition.z; break;
						case TweenAction.SCALE_X:
							tween.from.x = trans.localScale.x; break;
						case TweenAction.SCALE_Y:
							tween.from.x = trans.localScale.y; break;
						case TweenAction.SCALE_Z:
							tween.from.x = trans.localScale.z; break;
						case TweenAction.ALPHA:
							tween.from.x = trans.gameObject.renderer.material.color.a; break;
						case TweenAction.MOVE_LOCAL:
							tween.from = trans.localPosition; break;
						case TweenAction.ROTATE:
							tween.from = trans.eulerAngles; 
							tween.to.x = LeanTween.closestRot( tween.from.x, tween.to.x);
							tween.to.y = LeanTween.closestRot( tween.from.y, tween.to.y);
							tween.to.z = LeanTween.closestRot( tween.from.z, tween.to.z);
							break;
						case TweenAction.ROTATE_X:
							tween.from.x = trans.eulerAngles.x; 
							tween.to.x = LeanTween.closestRot( tween.from.x, tween.to.x);
							break;
						case TweenAction.ROTATE_Y:
							tween.from.x = trans.eulerAngles.y; 
							tween.to.x = LeanTween.closestRot( tween.from.x, tween.to.x);
							break;
						case TweenAction.ROTATE_Z:
							tween.from.x = trans.eulerAngles.z; 
							tween.to.x = LeanTween.closestRot( tween.from.x, tween.to.x);
							break;
						case TweenAction.ROTATE_LOCAL:
							tween.from = trans.localEulerAngles; 
							tween.to.x = LeanTween.closestRot( tween.from.x, tween.to.x);
							tween.to.y = LeanTween.closestRot( tween.from.y, tween.to.y);
							tween.to.z = LeanTween.closestRot( tween.from.z, tween.to.z);
							break;
						case TweenAction.SCALE:
							tween.from = trans.localScale; break;
						case TweenAction.GUI_MOVE:
							tween.from =new Vector3(tween.ltRect.rect.x, tween.ltRect.rect.y, 0); break;
						case TweenAction.GUI_SCALE:
							tween.from =new  Vector3(tween.ltRect.rect.width, tween.ltRect.rect.height, 0); break;
					}
					tween.diff.x = tween.to.x - tween.from.x;
					tween.diff.y = tween.to.y - tween.from.y;
					tween.diff.z = tween.to.z - tween.from.z;
				}
				if(tween.delay<=0){
					// Move Values
					ratioPassed = tween.passed / timeTotal;
					if(ratioPassed>1.0)
						ratioPassed = 1.0f;
					
					if(tweenAction>=(int)TweenAction.MOVE_X && tweenAction<=(int)TweenAction.CALLBACK){
						if(animationCurve!=null){
							val = tweenOnCurve(tween, ratioPassed);
						}else {
							switch( tween.tweenType ){
								case LeanTweenType.linear:
									val = tween.from.x + tween.diff.x * ratioPassed; break;
								case LeanTweenType.easeOutQuad:
									val = easeOutQuadOpt(tween.from.x, tween.diff.x, ratioPassed); break;
								case LeanTweenType.easeInQuad:
									val = easeInQuadOpt(tween.from.x, tween.diff.x, ratioPassed); break;
								case LeanTweenType.easeInOutQuad:
									val = easeInOutQuadOpt(tween.from.x, tween.diff.x, ratioPassed); break;
								case LeanTweenType.easeInCubic:
									val = easeInCubic(tween.from.x, tween.to.x, ratioPassed); break;
								case LeanTweenType.easeOutCubic:
									val = easeOutCubic(tween.from.x, tween.to.x, ratioPassed); break;
								case LeanTweenType.easeInOutCubic:
									val = easeInOutCubic(tween.from.x, tween.to.x, ratioPassed); break;
								case LeanTweenType.easeInQuart:
									val = easeInQuart(tween.from.x, tween.to.x, ratioPassed); break;
								case LeanTweenType.easeOutQuart:
									val = easeOutQuart(tween.from.x, tween.to.x, ratioPassed); break;
								case LeanTweenType.easeInOutQuart:
									val = easeInOutQuart(tween.from.x, tween.to.x, ratioPassed); break;
								case LeanTweenType.easeInQuint:
									val = easeInQuint(tween.from.x, tween.to.x, ratioPassed); break;
								case LeanTweenType.easeOutQuint:
									val = easeOutQuint(tween.from.x, tween.to.x, ratioPassed); break;
								case LeanTweenType.easeInOutQuint:
									val = easeInOutQuint(tween.from.x, tween.to.x, ratioPassed); break;
								case LeanTweenType.easeInSine:
									val = easeInSine(tween.from.x, tween.to.x, ratioPassed); break;
								case LeanTweenType.easeOutSine:
									val = easeOutSine(tween.from.x, tween.to.x, ratioPassed); break;
								case LeanTweenType.easeInOutSine:
									val = easeInOutSine(tween.from.x, tween.to.x, ratioPassed); break;
								case LeanTweenType.easeInExpo:
									val = easeInExpo(tween.from.x, tween.to.x, ratioPassed); break;
								case LeanTweenType.easeOutExpo:
									val = easeOutExpo(tween.from.x, tween.to.x, ratioPassed); break;
								case LeanTweenType.easeInOutExpo:
									val = easeInOutExpo(tween.from.x, tween.to.x, ratioPassed); break;
								case LeanTweenType.easeInCirc:
									val = easeInCirc(tween.from.x, tween.to.x, ratioPassed); break;
								case LeanTweenType.easeOutCirc:
									val = easeOutCirc(tween.from.x, tween.to.x, ratioPassed); break;
								case LeanTweenType.easeInOutCirc:
									val = easeInOutCirc(tween.from.x, tween.to.x, ratioPassed); break;
								case LeanTweenType.easeInBounce:
									val = easeInBounce(tween.from.x, tween.to.x, ratioPassed); break;
								case LeanTweenType.easeOutBounce:
									val = easeOutBounce(tween.from.x, tween.to.x, ratioPassed); break;
								case LeanTweenType.easeInOutBounce:
									val = easeInOutBounce(tween.from.x, tween.to.x, ratioPassed); break;
								case LeanTweenType.easeInBack:
									val = easeInBack(tween.from.x, tween.to.x, ratioPassed); break;
								case LeanTweenType.easeOutBack:
									val = easeOutBack(tween.from.x, tween.to.x, ratioPassed); break;
								case LeanTweenType.easeInOutBack:
									val = easeInOutElastic(tween.from.x, tween.to.x, ratioPassed); break;
								case LeanTweenType.easeInElastic:
									val = easeInElastic(tween.from.x, tween.to.x, ratioPassed); break;
								case LeanTweenType.easeOutElastic:
									val = easeOutElastic(tween.from.x, tween.to.x, ratioPassed); break;
								case LeanTweenType.easeInOutElastic:
									val = easeInOutElastic(tween.from.x, tween.to.x, ratioPassed); 
                                    break;
                                case LeanTweenType.punch:
									tween.animationCurve = LeanTween.punch;
									tween.to.x = tween.from.x + tween.to.x;
									val = tweenOnCurve(tween, ratioPassed); break;
                                default:
                                    {
                                        val = tween.from.x + tween.diff.x * ratioPassed; break;
                                    }
							}
						
						}
						//Debug.Log("from:"+from+" to:"+to+" val:"+val+" ratioPassed:"+ratioPassed);
						if((TweenAction)tweenAction==TweenAction.MOVE_X){
							trans.position=new Vector3( val,trans.position.y,trans.position.z);
						}else if((TweenAction)tweenAction==TweenAction.MOVE_Y){
							trans.position =new Vector3( trans.position.x,val,trans.position.z);
						}else if((TweenAction)tweenAction==TweenAction.MOVE_Z){
							trans.position=new Vector3( trans.position.x,trans.position.y,val);
						}if((TweenAction)tweenAction==TweenAction.MOVE_LOCAL_X){
							trans.localPosition=new Vector3( val,trans.localPosition.y,trans.localPosition.z);
						}else if((TweenAction)tweenAction==TweenAction.MOVE_LOCAL_Y){
							trans.localPosition=new Vector3( trans.localPosition.x,val,trans.localPosition.z);
						}else if((TweenAction)tweenAction==TweenAction.MOVE_LOCAL_Z){
							trans.localPosition=new Vector3( trans.localPosition.x,trans.localPosition.y,val);
						}else if((TweenAction)tweenAction==TweenAction.SCALE_X){
							trans.localScale=new Vector3(val, trans.localScale.y,trans.localScale.z);
						}else if((TweenAction)tweenAction==TweenAction.SCALE_Y){
							trans.localScale=new Vector3( trans.localScale.x,val,trans.localScale.z);
						}else if((TweenAction)tweenAction==TweenAction.SCALE_Z){
							trans.localScale=new Vector3(trans.localScale.x,trans.localScale.y,val);
						}else if((TweenAction)tweenAction==TweenAction.ROTATE_X){
					    	trans.eulerAngles=new Vector3(val, trans.eulerAngles.y,trans.eulerAngles.z);
					    }else if((TweenAction)tweenAction==TweenAction.ROTATE_Y){
					    	trans.eulerAngles=new Vector3(trans.eulerAngles.x,val,trans.eulerAngles.z);
					    }else if((TweenAction)tweenAction==TweenAction.ROTATE_Z){
					    	trans.eulerAngles=new Vector3(trans.eulerAngles.x,trans.eulerAngles.y,val);
					    }else if((TweenAction)tweenAction==TweenAction.ALPHA){
							trans.gameObject.renderer.material.color=new Color(trans.gameObject.renderer.material.color.r,trans.gameObject.renderer.material.color.g,trans.gameObject.renderer.material.color.b,val);
						}
						
					}else if((TweenAction) tweenAction>=TweenAction.MOVE){
						//
						
						if(animationCurve!=null){
							newVect = tweenOnCurveVector(tween, ratioPassed);
						}else{
							if(tween.tweenType == LeanTweenType.linear){
								newVect.x = tween.from.x + tween.diff.x * ratioPassed;
								newVect.y = tween.from.y + tween.diff.y * ratioPassed;
								newVect.z = tween.from.z + tween.diff.z * ratioPassed;
							}else if(tween.tweenType >= LeanTweenType.linear){
								switch(tween.tweenType){
									case LeanTweenType.easeOutQuad:
										newVect = new Vector3(easeOutQuadOpt(tween.from.x, tween.diff.x, ratioPassed), easeOutQuadOpt(tween.from.y, tween.diff.y, ratioPassed), easeOutQuadOpt(tween.from.z, tween.diff.z, ratioPassed)); break;
									case LeanTweenType.easeInQuad:
										newVect = new Vector3(easeInQuadOpt(tween.from.x, tween.diff.x, ratioPassed), easeInQuadOpt(tween.from.y, tween.diff.y, ratioPassed), easeInQuadOpt(tween.from.z, tween.diff.z, ratioPassed)); break;
									case LeanTweenType.easeInOutQuad:
										newVect = new Vector3(easeInOutQuadOpt(tween.from.x, tween.diff.x, ratioPassed), easeInOutQuadOpt(tween.from.y, tween.diff.y, ratioPassed), easeInOutQuadOpt(tween.from.z, tween.diff.z, ratioPassed)); break;
									case LeanTweenType.easeInCubic:
										newVect = new Vector3(easeInCubic(tween.from.x, tween.to.x, ratioPassed), easeInCubic(tween.from.y, tween.to.y, ratioPassed), easeInCubic(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeOutCubic:
										newVect = new Vector3(easeOutCubic(tween.from.x, tween.to.x, ratioPassed), easeOutCubic(tween.from.y, tween.to.y, ratioPassed), easeOutCubic(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeInOutCubic:
										newVect = new Vector3(easeInOutCubic(tween.from.x, tween.to.x, ratioPassed), easeInOutCubic(tween.from.y, tween.to.y, ratioPassed), easeInOutCubic(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeInQuart:
										newVect = new Vector3(easeInQuart(tween.from.x, tween.to.x, ratioPassed), easeInQuart(tween.from.y, tween.to.y, ratioPassed), easeInQuart(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeOutQuart:
										newVect = new Vector3(easeOutQuart(tween.from.x, tween.to.x, ratioPassed), easeOutQuart(tween.from.y, tween.to.y, ratioPassed), easeOutQuart(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeInOutQuart:
										newVect = new Vector3(easeInOutQuart(tween.from.x, tween.to.x, ratioPassed), easeInOutQuart(tween.from.y, tween.to.y, ratioPassed), easeInOutQuart(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeInQuint:
										newVect = new Vector3(easeInQuint(tween.from.x, tween.to.x, ratioPassed), easeInQuint(tween.from.y, tween.to.y, ratioPassed), easeInQuint(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeOutQuint:
										newVect = new Vector3(easeOutQuint(tween.from.x, tween.to.x, ratioPassed), easeOutQuint(tween.from.y, tween.to.y, ratioPassed), easeOutQuint(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeInOutQuint:
										newVect = new Vector3(easeInOutQuint(tween.from.x, tween.to.x, ratioPassed), easeInOutQuint(tween.from.y, tween.to.y, ratioPassed), easeInOutQuint(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeInSine:
										newVect = new Vector3(easeInSine(tween.from.x, tween.to.x, ratioPassed), easeInSine(tween.from.y, tween.to.y, ratioPassed), easeInSine(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeOutSine:
										newVect = new Vector3(easeOutSine(tween.from.x, tween.to.x, ratioPassed), easeOutSine(tween.from.y, tween.to.y, ratioPassed), easeOutSine(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeInOutSine:
										newVect = new Vector3(easeInOutSine(tween.from.x, tween.to.x, ratioPassed), easeInOutSine(tween.from.y, tween.to.y, ratioPassed), easeInOutSine(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeInExpo:
										newVect = new Vector3(easeInExpo(tween.from.x, tween.to.x, ratioPassed), easeInExpo(tween.from.y, tween.to.y, ratioPassed), easeInExpo(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeOutExpo:
										newVect = new Vector3(easeOutExpo(tween.from.x, tween.to.x, ratioPassed), easeOutExpo(tween.from.y, tween.to.y, ratioPassed), easeOutExpo(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeInOutExpo:
										newVect = new Vector3(easeInOutExpo(tween.from.x, tween.to.x, ratioPassed), easeInOutExpo(tween.from.y, tween.to.y, ratioPassed), easeInOutExpo(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeInCirc:
										newVect = new Vector3(easeInCirc(tween.from.x, tween.to.x, ratioPassed), easeInCirc(tween.from.y, tween.to.y, ratioPassed), easeInCirc(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeOutCirc:
										newVect = new Vector3(easeOutCirc(tween.from.x, tween.to.x, ratioPassed), easeOutCirc(tween.from.y, tween.to.y, ratioPassed), easeOutCirc(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeInOutCirc:
										newVect = new Vector3(easeInOutCirc(tween.from.x, tween.to.x, ratioPassed), easeInOutCirc(tween.from.y, tween.to.y, ratioPassed), easeInOutCirc(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeInBounce:
										newVect = new Vector3(easeInBounce(tween.from.x, tween.to.x, ratioPassed), easeInBounce(tween.from.y, tween.to.y, ratioPassed), easeInBounce(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeOutBounce:
										newVect = new Vector3(easeOutBounce(tween.from.x, tween.to.x, ratioPassed), easeOutBounce(tween.from.y, tween.to.y, ratioPassed), easeOutBounce(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeInOutBounce:
										newVect = new Vector3(easeInOutBounce(tween.from.x, tween.to.x, ratioPassed), easeInOutBounce(tween.from.y, tween.to.y, ratioPassed), easeInOutBounce(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeInBack:
										newVect = new Vector3(easeInBack(tween.from.x, tween.to.x, ratioPassed), easeInBack(tween.from.y, tween.to.y, ratioPassed), easeInBack(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeOutBack:
										newVect = new Vector3(easeOutBack(tween.from.x, tween.to.x, ratioPassed), easeOutBack(tween.from.y, tween.to.y, ratioPassed), easeOutBack(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeInOutBack:
										newVect = new Vector3(easeInOutBack(tween.from.x, tween.to.x, ratioPassed), easeInOutBack(tween.from.y, tween.to.y, ratioPassed), easeInOutBack(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeInElastic:
										newVect = new Vector3(easeInElastic(tween.from.x, tween.to.x, ratioPassed), easeInElastic(tween.from.y, tween.to.y, ratioPassed), easeInElastic(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeOutElastic:
										newVect = new Vector3(easeOutElastic(tween.from.x, tween.to.x, ratioPassed), easeOutElastic(tween.from.y, tween.to.y, ratioPassed), easeOutElastic(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeInOutElastic:
										newVect = new Vector3(easeInOutElastic(tween.from.x, tween.to.x, ratioPassed), easeInOutElastic(tween.from.y, tween.to.y, ratioPassed), easeInOutElastic(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.punch:
										tween.animationCurve = LeanTween.punch;
										tween.to.x = tween.from.x + tween.to.x;
										tween.to.y = tween.from.y + tween.to.y;
										tween.to.z = tween.from.z + tween.to.z;
										if((TweenAction) tweenAction==TweenAction.ROTATE || (TweenAction) tweenAction==TweenAction.ROTATE_LOCAL){
											tween.to.x = closestRot(tween.from.x, tween.to.x);
											tween.to.y = closestRot(tween.from.y, tween.to.y);
											tween.to.z = closestRot(tween.from.z, tween.to.z);
										}
										newVect = tweenOnCurveVector(tween, ratioPassed); break;
								}
							}else{
								fromVect = tween.from;
								toVect = tween.to;
                                newVect.x = tween.from.x + tween.diff.x * ratioPassed;
								newVect.y = tween.from.y + tween.diff.y * ratioPassed;
								newVect.z = tween.from.z + tween.diff.z * ratioPassed;
							}
						}
						 
						if((TweenAction) tweenAction==TweenAction.MOVE){
							trans.position = newVect;
					    }else if((TweenAction) tweenAction==TweenAction.MOVE_LOCAL){
							trans.localPosition = newVect;
					    }else if((TweenAction) tweenAction==TweenAction.ROTATE){
					    	trans.eulerAngles = newVect;
					    }else if((TweenAction) tweenAction==TweenAction.ROTATE_LOCAL){
					    	trans.localEulerAngles = newVect;
					    }else if((TweenAction) tweenAction==TweenAction.SCALE){
					    	trans.localScale = newVect;
					    }else if((TweenAction) tweenAction==TweenAction.GUI_MOVE){
					    	tween.ltRect.rect.x = newVect.x;
					    	tween.ltRect.rect.y = newVect.y;
					    }else if((TweenAction) tweenAction==TweenAction.GUI_SCALE){
					    	tween.ltRect.rect.width = newVect.x;
					    	tween.ltRect.rect.height = newVect.y;
					    }
					}

					if(tween.optional!=null){
						var onUpdate = optionalItems["onUpdate"];
						if(onUpdate!=null){
							//Hashtable updateParam = (Hashtable)optionalItems["onUpdateParam"];
							if(onUpdate.GetType() == typeof(string)){
								string onUpdateS = onUpdate as string;
								if (optionalItems["onUpdateTarget"]!=null){
									customTarget = optionalItems["onUpdateTarget"] as GameObject;
									customTarget.BroadcastMessage( onUpdateS, val );
								}else{
									trans.gameObject.BroadcastMessage( onUpdateS, val );
								}
							}else{
                                //var onUpdateF:Function = onUpdate as Function;
                                //if(updateParam) onUpdateF( val, updateParam );
                                //else onUpdateF(val);
							}
						}
					}
				}
				
				if(isTweenFinished){
					//var callback=null;
					string callbackS=string.Empty;
					object callbackParam=null;
					if(tween.optional!=null && tween.trans){
						if(optionalItems["onComplete"]!=null){
							if(optionalItems["onComplete"].GetType()==typeof(string)){
								callbackS = optionalItems["onComplete"] as string;
							}else{
								//callback = optionalItems["onComplete"] as Function;
							}
						}
						callbackParam = optionalItems["onCompleteParam"];
					}
					removeTween(i);
					//if(callback){
						///if(callbackParam!=null) callback( callbackParam );
						//else callback();
					//}else
                    if(callbackS!=string.Empty){
						if (optionalItems["onCompleteTarget"]!=null){
							customTarget = optionalItems["onCompleteTarget"] as GameObject;
							if(callbackParam!=null) customTarget.BroadcastMessage ( callbackS, callbackParam );
							else customTarget.BroadcastMessage( callbackS );
						}else{
							if(callbackParam!=null) trans.gameObject.BroadcastMessage ( callbackS, callbackParam );
							else trans.gameObject.BroadcastMessage( callbackS );
						}
					}
				}else if(tween.delay<=0){
					tween.passed += dt;
				}else{
					tween.delay -= dt;
					if(tween.delay<0){
						tween.passed = 0.0f;//-tween.delay
						tween.delay = 0.0f;
					}
				}
			}
		}

		frameRendered = Time.frameCount;
	}
}

private static void removeTween( int i ){
	tweens[i].toggle = false;
	startSearch = i;
	//Debug.Log("start search reset:"+startSearch + " i:"+i+" tweenMaxSearch:"+tweenMaxSearch);
	if(i+1>=tweenMaxSearch){
		//Debug.Log("reset to zero");
		startSearch = 0;
		tweenMaxSearch--;
	}
}

public static int startSearch = 0;
public static int lastMax= 0;

private static int pushNewTween( GameObject gameObject, Vector3 to, float time, TweenAction tweenAction, Hashtable optional ){
	init(maxTweens);
	if(gameObject==null)
		return -1;
	
	j = 0;
	for(i = startSearch; j < maxTweens; i++){
		if(i>=maxTweens-1){
			i = 0;
		}
		//Debug.Log("tweens["+i+"]:"+tweens[i].toggle);
		if(tweens[i].toggle==false){
			if(i+1>tweenMaxSearch){
				tweenMaxSearch = i+1;
				//Debug.Log("tweenMaxSearch:"+tweenMaxSearch);
			}
			startSearch = i + 1;
			break;
		}
		
		j++;
		if(j>=maxTweens){
			string errorMsg = "LeanTween - You have run out of available spaces for tweening. To avoid this error increase the number of spaces to available for tweening when you initialize the LeanTween class ex: LeanTween.init( "+(maxTweens*2)+" );";
			if(throwErrors) Debug.LogError(errorMsg); else Debug.Log(errorMsg);
			return -1;
		}
	}
	// if(tweenMaxSearch>lastMax){
	// 	lastMax = tweenMaxSearch;
	// 	Debug.Log("tweenMaxSearch:"+tweenMaxSearch);
	// }

	tween = tweens[i];
	tween.toggle = true;
	tween.trans = gameObject.transform;
	tween.to = to;
	tween.time = time;
	tween.passed = 0.0f;
	tween.type = tweenAction;
	tween.optional = optional;
	tween.delay = 0.0f;
	tween.id = i;
	tween.useEstimatedTime = false;
	tween.useFrames = false;
	tween.animationCurve = null;
	tween.tweenType = LeanTweenType.linear;

	if(optional!=null){
        var ease =optional["ease"];
        //LeanTweenType ease;
		var optionsNotUsed = 0;
		if(ease!=null)
        {
            //ease = (LeanTweenType)Enum.Parse(typeof(LeanTweenType), optional["ease"].ToString());
			tween.tweenType = LeanTweenType.notUsed;
			if( ease.GetType() ==typeof( LeanTweenType) )
            {
                tween.tweenType = (LeanTweenType)ease;// Enum.Parse(typeof(LeanTweenType), optional["ease"].ToString());
			}
            else if(ease.GetType() == typeof(AnimationCurve))
            {
				tween.animationCurve = optional["ease"] as AnimationCurve;
			}
            else{
				tween.tweenFunc = optional["ease"].ToString();
				if(tween.tweenFunc.Equals("easeOutQuad")){
					tween.tweenType = LeanTweenType.easeOutQuad;
				}else if(tween.tweenFunc.Equals("easeInQuad")){
					tween.tweenType = LeanTweenType.easeInQuad;
				}else if(tween.tweenFunc.Equals("easeInOutQuad")){
					tween.tweenType = LeanTweenType.easeInOutQuad;
				}
			}
			optionsNotUsed++;
		}
		if(optional["rect"]!=null){
			tween.ltRect = (LTRect)optional["rect"];
			optionsNotUsed++;
		}
		if(optional["delay"]!=null){
			tween.delay =(float) optional["delay"];
			optionsNotUsed++;
		}
		if(optional["useEstimatedTime"]!=null){
			tween.useEstimatedTime =(bool) optional["useEstimatedTime"];
			optionsNotUsed++;
		}
		if(optional["useFrames"]!=null){
			tween.useFrames =(bool) optional["useFrames"];
			optionsNotUsed++;
		}
		if(optional.Count <= optionsNotUsed)
			tween.optional = null;  // nothing else is used with the extra piece, so set to null
	}
	//Debug.Log("pushing new tween["+i+"]:"+tweens[i]);
	
	return tweens[i].id;
}

public static float closestRot( float from, float to ){
	float minusWhole = 0 - (360 - to);
	float plusWhole = 360 + to;
	float toDiffAbs = Mathf.Abs( to-from );
	float minusDiff = Mathf.Abs(minusWhole-from);
	float plusDiff = Mathf.Abs(plusWhole-from);
	if( toDiffAbs < minusDiff && toDiffAbs < plusDiff ){
		return to;
	}else {
		if(minusDiff < plusDiff){
			return minusWhole;
		}else{
			return plusWhole;
		}
	}
}

/**
* Cancel all tweens that are currently targeting the gameObject
* 
* @method LeanTween.cancel
* @param {GameObject} GameObject gameObject whose tweens you want to cancel
*/
public static void cancel( GameObject gameObject ){
	Transform trans = gameObject.transform;
	for(int i = 0; i < tweenMaxSearch; i++){
		if(tweens[i].trans==trans)
			removeTween(i);
	}
}

/**
* Cancel a specific tween for a gameObject
* 
* @method LeanTween.cancel
* @param {GameObject} GameObject gameObject GameObject whose tweens you want to cancel
* @param {int} int id Id of the tween you want to cancel ex: int id = LeanTween.MoveX(gameObject, 5, 1.0);
*/
public static void cancel( GameObject gameObject, int id ){
	Transform trans = gameObject.transform;
	for(int i = 0; i < tweenMaxSearch; i++){
		if(tweens[i].trans==trans && tweens[i].id == id)
			removeTween(i);
	}
}

public static bool isTweening( GameObject gameObject ){
	Transform trans = gameObject.transform;
	for(int i = 0; i < tweenMaxSearch; i++){
		if(tweens[i].toggle && tweens[i].trans==trans)
			return true;
	}
	return false;
}

public static bool isTweening( LTRect ltRect ){
	for( int i = 0; i < tweenMaxSearch; i++){
		if(tweens[i].toggle && tweens[i].ltRect==ltRect)
			return true;
	}
	return false;
}

//////public int play( GameObject gameObject, toFrame:int, columns:int, rows:int, Hashtable optional ){
	
//////}

/**
* Tween any particular value, it does not need to be tied to any particular type or GameObject
* 
* @method LeanTween.value
* @param {Function} callOnUpdate:Function The function that is called on every Update frame, this function needs to accept a float value ex: function updateValue( float val ){ }
* @param {float} float from The original value to start the tween from
* @param {float} float to The value to end the tween on
* @param {float} float time The time to complete the tween in
* @return {int} Returns an integer id that is used to distinguish this tween
*/
public static int value(string callOnUpdate, float from, float to, float time, Hashtable optional){
	return value( tweenEmpty, callOnUpdate, from, to, time, optional );
}

public static int value(GameObject gameObject, string callOnUpdate, float from, float to, float time){
	return value(gameObject, callOnUpdate, from, to, time, null); 
}

/**
* Tween any particular value, it does not need to be tied to any particular type or GameObject
* 
* @method LeanTween.value
* @param {GameObject} GameObject gameObject GameObject with which to tie the tweening with. This is only used when you need to cancel this tween, it does not actually perform any operations on this gameObject
* @param {Function} callOnUpdate:Function The function that is called on every Update frame, this function needs to accept a float value ex: function updateValue( float val ){ }
* @param {float} float from The original value to start the tween from
* @param {float} float to The value to end the tween on
* @param {float} float time The time to complete the tween in
* @param {Hashtable} time:Hashtable The time to complete the tween in
* @return {int} Returns an integer id that is used to distinguish this tween
*/
public static int value(GameObject gameObject,string callOnUpdate, float from, float to, float time, Hashtable optional){
	if(optional==null)
		optional = new Hashtable();
		
	optional["onUpdate"] = callOnUpdate;
	int id = pushNewTween( gameObject, new Vector3(to,0,0), time, TweenAction.CALLBACK, optional );
	tweens[id].from = new Vector3(from,0,0);
	return id;
}



/**
* Rotate a GameObject, to values are in passed in degrees
* 
* @method LeanTween.rotate
* @param {GameObject} GameObject gameObject Gameobject that you wish to rotate
* @param {Vector3} Vector3 to The final rotation with which to rotate to
* @param {float} float time The time to complete the tween in
* @return {int} Returns an integer id that is used to distinguish this tween
* @example <i>Javascript:</i><br>
* LeanTween.rotate(cube, Vector3(180,30,0), 1.5);
* <br><br>
* <i>C#: </i> <br>
* LeanTween.rotate(cube, Vector3(180f,30f,0f), 1.5f);<br>
*/
public static int rotate(GameObject gameObject, Vector3 to, float time){
	return rotate( gameObject, to, time, null );
}
/**
* Rotate a GameObject, to values that are in passed in degrees
* 
* @method LeanTween.rotate
* @param {GameObject} GameObject gameObject Gameobject that you wish to rotate
* @param {Vector3} Vector3 to The final rotation with which to rotate to
* @param {float} float time The time to complete the tween in
* @param {Hashtable} Hashtable optional Hashtable where you can pass <a href="#optional">optional items</a>.
* @return {int} Returns an integer id that is used to distinguish this tween
* @example <i>Javascript:</i><br>
* LeanTween.rotate(cube, Vector3(180,30,0), 1.5, {"ease":LeanTween.easeInOutQuad, onComplete":finishedTweening});
* <br><br>
* <i>C#: </i> <br>
* Hashtable optional = new Hashtable();<br>
* optional.Add("ease":LeanTweenType.easeInOutQuad);<br>
* optional.Add("onComplete":"finishedTweening");<br>
* LeanTween.rotate(cube, Vector3(180f,30f,0f), 1.5f, optional);<br>
*/
public static int rotate(GameObject gameObject, Vector3 to, float time, Hashtable optional){
	return pushNewTween( gameObject, to, time, TweenAction.ROTATE, optional );
}

/**
* Rotate a GameObject only on the X axis
* 
* @method LeanTween.rotateX
* @param {GameObject} GameObject gameObject Gameobject that you wish to rotate
* @param {float} float to The final x-axis rotation with which to rotate
* @param {float} float time The time to complete the rotation in
*/
public static int rotateX(GameObject gameObject, float to, float time){
	return rotateX( gameObject, to, time, null );
}
/**
* Rotate a GameObject only on the X axis
* 
* @method LeanTween.rotateX
* @param {GameObject} GameObject gameObject Gameobject that you wish to rotate
* @param {float} float to The final x-axis rotation with which to rotate
* @param {float} float time The time to complete the rotation in
* @param {Hashtable} Hashtable optional Hashtable where you can pass <a href="#optional">optional items</a>.
*/
public static int rotateX(GameObject gameObject, float to, float time, Hashtable optional){
	return pushNewTween( gameObject, new Vector3(to,0,0), time, TweenAction.ROTATE_X, optional );
}

/**
* Rotate a GameObject only on the Y axis
* 
* @method LeanTween.rotateY
* @param {GameObject} GameObject gameObject Gameobject that you wish to rotate
* @param {float} float to The final y-axis rotation with which to rotate
* @param {float} float time The time to complete the rotation in
*/
public static int rotateY(GameObject gameObject, float to, float time){
	return rotateY( gameObject, to, time, null );
}
/**
* Rotate a GameObject only on the Y axis
* 
* @method LeanTween.rotateY
* @param {GameObject} GameObject gameObject Gameobject that you wish to rotate
* @param {float} float to The final y-axis rotation with which to rotate
* @param {float} float time The time to complete the rotation in
* @param {Hashtable} Hashtable optional Hashtable where you can pass <a href="#optional">optional items</a>.
*/
public static int rotateY(GameObject gameObject, float to, float time, Hashtable optional){
	return pushNewTween( gameObject, new Vector3(to,0,0), time, TweenAction.ROTATE_Y, optional );
}

/**
* Rotate a GameObject only on the Z axis
* 
* @method LeanTween.rotateZ
* @param {GameObject} GameObject gameObject Gameobject that you wish to rotate
* @param {float} float to The final z-axis rotation with which to rotate
* @param {float} float time The time to complete the rotation in
*/
public static int rotateZ(GameObject gameObject, float to, float time){
	return rotateZ( gameObject, to, time, null );
}
/**
* Rotate a GameObject only on the Z axis
* 
* @method LeanTween.rotateZ
* @param {GameObject} GameObject gameObject Gameobject that you wish to rotate
* @param {float} float to The final z-axis rotation with which to rotate
* @param {float} float time The time to complete the rotation in
* @param {Hashtable} Hashtable optional Hashtable where you can pass <a href="#optional">optional items</a>.
*/
public static int rotateZ(GameObject gameObject, float to, float time, Hashtable optional){
	return pushNewTween( gameObject, new Vector3(to,0,0), time, TweenAction.ROTATE_Z, optional );
}

/**
* Rotate a GameObject in the objects local space (on the transforms localEulerAngles object)
* 
* @method LeanTween.rotateLocal
* @param {GameObject} GameObject gameObject Gameobject that you wish to rotate
* @param {Vector3} Vector3 to The final rotation with which to rotate to
* @param {float} float time The time to complete the rotation in
* @param {Hashtable} Hashtable optional Hashtable where you can pass <a href="#optional">optional items</a>.
*/
public static int rotateLocal(GameObject gameObject, Vector3 to, float time, Hashtable optional){
	return pushNewTween( gameObject, to, time, TweenAction.ROTATE_LOCAL, optional );
}

/**
* Move a GameObject along the x-axis
* 
* @method LeanTween.moveX
* @param {GameObject} GameObject gameObject Gameobject that you wish to move
* @param {float} float to The final position with which to move to
* @param {float} float time The time to complete the move in
* @param {Hashtable} Hashtable optional Hashtable where you can pass <a href="#optional">optional items</a>.
*/
public static int moveX(GameObject gameObject, float to, float time, Hashtable optional){
	return pushNewTween( gameObject, new Vector3(to,0,0), time, TweenAction.MOVE_X, optional );
}

/**
* Move a GameObject along the y-axis
* 
* @method LeanTween.moveY
* @param {GameObject} GameObject gameObject Gameobject that you wish to move
* @param {float} float to The final position with which to move to
* @param {float} float time The time to complete the move in
* @param {Hashtable} Hashtable optional Hashtable where you can pass <a href="#optional">optional items</a>.
*/
public static int moveY(GameObject gameObject, float to, float time, Hashtable optional){
	return pushNewTween( gameObject, new Vector3(to,0,0), time, TweenAction.MOVE_Y, optional );
}

/**
* Move a GameObject along the z-axis
* 
* @method LeanTween.moveZ
* @param {GameObject} GameObject gameObject Gameobject that you wish to move
* @param {float} float to The final position with which to move to
* @param {float} float time The time to complete the move in
* @param {Hashtable} Hashtable optional Hashtable where you can pass <a href="#optional">optional items</a>.
*/
public static int moveZ(GameObject gameObject, float to, float time){
	return moveZ( gameObject, to, time, null );
}
public static int moveZ(GameObject gameObject, float to, float time, Hashtable optional){
	return pushNewTween( gameObject, new Vector3(to,0,0), time, TweenAction.MOVE_Z, optional );
}

public static int move(GameObject gameObject, Vector3 to, float time){
	return move( gameObject, to, time, null );
}

/**
* Move a GameObject to a certain location
* 
* @method LeanTween.move
* @param {GameObject} GameObject gameObject Gameobject that you wish to move
* @param {Vector3} Vector3 to The final positin with which to move to
* @param {float} float time The time to complete the tween in
* @param {Hashtable} Hashtable optional Hashtable where you can pass <a href="#optional">optional items</a>.
* @return {int} Returns an integer id that is used to distinguish this tween
* @example
* <i>Javascript:</i><br>
* LeanTween.move(gameObject, Vector3(0,-3,5), 2.0, {"ease":LeanTween.easeOutQuad});<br><br>
* <i>C#:</i><br>
* Hashtable optional = new Hashtable();<br>
* optional.Add("ease":LeanTweenType.easeOutQuad);<br>
* LeanTween.move(gameObject, Vector3(0f,-3f,5f), 1.5f, optional);<br>
*/
public static int move(GameObject gameObject, Vector3 to, float time, Hashtable optional){
	return pushNewTween( gameObject, to, time, TweenAction.MOVE, optional );
}

/**
* Move a GUI Element to a certain location
* 
* @method LeanTween.move (GUI)
* @param {LTRect} LTRect ltRect LTRect object that you wish to move
* @param {Vector2} Vector2 to The final position with which to move to (pixel coordinates)
* @param {float} float time The time to complete the tween in
* @param {Hashtable} Hashtable optional Hashtable where you can pass <a href="#optional">optional items</a>.
* @return {int} Returns an integer id that is used to distinguish this tween
*/
public static int move(LTRect ltRect, Vector2 to, float time, Hashtable optional){
	init();
	if( optional == null )
		optional = new Hashtable();

	optional["rect"] = ltRect;
	return pushNewTween( tweenEmpty, to, time, TweenAction.GUI_MOVE, optional );
}

/**
* Move a GUI Element to a certain location
* 
* @method LeanTween.move (GUI)
* @param {LTRect} LTRect ltRect LTRect object that you wish to move
* @param {Vector2} Vector2 to The final position with which to move to (pixel coordinates)
* @param {float} float time The time to complete the tween in
* @return {int} Returns an integer id that is used to distinguish this tween
*/
public static int move(LTRect ltRect, Vector2 to, float time){
	return move( ltRect, to, time, null );
}

public static int moveLocal(GameObject gameObject, Vector3 to, float time){
	return moveLocal( gameObject, to, time, null );
}

/**
* Move a GameObject to a certain location relative to the parent transform. 
* 
* @method LeanTween.moveLocal
* @param {GameObject} GameObject gameObject Gameobject that you wish to rotate
* @param {Vector3} Vector3 to The final positin with which to move to
* @param {float} float time The time to complete the tween in
* @param {Hashtable} Hashtable optional Hashtable where you can pass <a href="#optional">optional items</a>.
* @return {int} Returns an integer id that is used to distinguish this tween
*/
public static int moveLocal(GameObject gameObject, Vector3 to, float time, Hashtable optional){
	return pushNewTween( gameObject, to, time, TweenAction.MOVE_LOCAL, optional );
}

public static int moveLocalX(GameObject gameObject, float to, float time, Hashtable optional){
	return pushNewTween( gameObject, new Vector3(to,0,0), time, TweenAction.MOVE_LOCAL_X, optional );
}

public static int moveLocalY(GameObject gameObject, float to, float time, Hashtable optional){
	return pushNewTween( gameObject, new Vector3(to,0,0), time, TweenAction.MOVE_LOCAL_Y, optional );
}

public static int moveLocalZ(GameObject gameObject, float to, float time, Hashtable optional){
	return pushNewTween( gameObject, new Vector3(to,0,0), time, TweenAction.MOVE_LOCAL_Z, optional );
}

public static int scale(GameObject gameObject, Vector3 to, float time){
	return scale( gameObject, to, time, null );
}

/**
* Scale a GameObject to a certain size
* 
* @method LeanTween.scale
* @param {GameObject} GameObject gameObject Gameobject that you wish to rotate
* @param {Vector3} Vector3 to The size with which to tween to
* @param {float} float time The time to complete the tween in
* @param {Hashtable} Hashtable optional Hashtable where you can pass <a href="#optional">optional items</a>.
* @return {int} Returns an integer id that is used to distinguish this tween
*/
public static int scale(GameObject gameObject, Vector3 to, float time, Hashtable optional){
	return pushNewTween( gameObject, to, time, TweenAction.SCALE, optional );
}

/**
* Scale a GUI Element to a certain width and height
* 
* @method LeanTween.scale (GUI)
* @param {LTRect} LTRect ltRect LTRect object that you wish to move
* @param {Vector2} Vector2 to The final width and height to scale to (pixel based)
* @param {float} float time The time to complete the tween in
* @param {Hashtable} Hashtable optional Hashtable where you can pass <a href="#optional">optional items</a>.
* @return {int} Returns an integer id that is used to distinguish this tween
*/
public static int scale(LTRect ltRect,Vector2 to, float time, Hashtable optional)
{
	init();
	if( optional == null )
		optional = new Hashtable();

	optional["rect"] = ltRect;
	return pushNewTween( tweenEmpty, to, time, TweenAction.GUI_SCALE, optional );
}

/**
* Scale a GUI Element to a certain width and height
* 
* @method LeanTween.scale (GUI)
* @param {LTRect} LTRect ltRect LTRect object that you wish to move
* @param {Vector2} Vector2 to The final width and height to scale to (pixel based)
* @param {float} float time The time to complete the tween in
* @return {int} Returns an integer id that is used to distinguish this tween
* @example
* <i>Example Javascript: </i><br>
* var bRect:LTRect = new LTRect( 0, 0, 100, 50 );<br>
* LeanTween.scale( bRect, Vector2(bRect.rect.width, bRect.rect.height) * 1.3, 0.25 );<br>
* function OnGUI(){<br>
* &nbsp; if(GUI.Button(bRect.rect, "Scale")){ }<br>
* }<br>
* <br>
* <i>Example C#: </ia> <br>
* LTRect bRect = new LTRect( 0f, 0f, 100f, 50f );<br>
* LeanTween.scale( bRect, new Vector2(150f,75f), 0.25f );<br>
* void OnGUI(){<br>
* &nbsp; if(GUI.Button(bRect.rect, "Scale")){ }<br>
* }<br>
*/
public static int scale(LTRect ltRect, Vector2 to, float time){
	return scale( ltRect, to, time, null );
}

public static int scaleX(GameObject gameObject, float to, float time){
	return scaleX( gameObject, to, time, null );
}
public static int scaleX(GameObject gameObject, float to, float time, Hashtable optional){
	return pushNewTween( gameObject, new Vector3(to,0,0), time, TweenAction.SCALE_X, optional );
}

public static int scaleY(GameObject gameObject, float to, float time){
	return scaleY( gameObject, to, time, null );
}
public static int scaleY(GameObject gameObject, float to, float time, Hashtable optional){
	return pushNewTween( gameObject, new Vector3(to,0,0), time, TweenAction.SCALE_Y, optional );
}

public static int scaleZ(GameObject gameObject, float to, float time){
	return scaleZ( gameObject, to, time, null );
}
public static int scaleZ(GameObject gameObject, float to, float time, Hashtable optional){
	return pushNewTween( gameObject, new Vector3(to,0,0), time, TweenAction.SCALE_Z, optional );
}

/**
* Call a function after a certain amount of time has passed
* 
* @method LeanTween.delayedCall
* @param {float} float delayTime The time with which to delay before calling the function
* @param {Function} callback:Function Function that is called after the certain amount of time.
* @return {int} Returns an integer id that is used to distinguish this tween
*/
public static int delayedCall( float delayTime, string callback){
	return delayedCall( tweenEmpty, delayTime, callback, null );
}

public static int delayedCall( float delayTime, string callback, Hashtable optional ){
	return delayedCall( tweenEmpty, delayTime, callback, optional );
}

/**
* Call a function after a certain amount of time has passed
* 
* @method LeanTween.delayedCall
* @param {GameObject} GameObject gameObject Gameobject that you wish to tie this delayed function call to
* @param {float} float delayTime The time with which to delay before calling the function
* @param {Function} callback:Function Function that is called after the certain amount of time.
* @return {int} Returns an integer id that is used to distinguish this tween
*/


/**
* Call a function after a certain amount of time has passed
* 
* @method LeanTween.delayedCall
* @param {GameObject} GameObject gameObject Gameobject that you wish to tie this delayed function call to
* @param {float} float delayTime The time with which to delay before calling the function
* @param {Function} callback:Function Function that is called after the certain amount of time.
* @param {Hashtable} Hashtable optional Hashtable where you can pass <a href="#optional">optional items</a>.
* @return {int} Returns an integer id that is used to distinguish this tween
*/


/**
* Call a function after a certain amount of time has passed
* 
* @method LeanTween.delayedCall
* @param {GameObject} GameObject gameObject Gameobject that you wish to call the Function on
* @param {float} float delayTime The time with which to delay before calling the function
* @param {String} callback:String Function that is called after the certain amount of time.
* @return {int} Returns an integer id that is used to distinguish this tween
*/
public static int delayedCall(GameObject gameObject, float delayTime, string callback)
{
	return delayedCall( gameObject, delayTime, callback, null );
}
/**
* Call a function after a certain amount of time has passed
* 
* @method LeanTween.delayedCall
* @param {GameObject} GameObject gameObject Gameobject that you wish to call the Function on
* @param {float} float delayTime The time with which to delay before calling the function
* @param {String} callback:String Function that is called after the certain amount of time.
* @param {Hashtable} Hashtable optional Hashtable where you can pass <a href="#optional">optional items</a>.
* @return {int} Returns an integer id that is used to distinguish this tween
*/
public static int delayedCall( GameObject gameObject, float delayTime, string callback, Hashtable optional){
	if(optional==null)
		optional = new Hashtable();
	optional["onComplete"] = callback;

	return pushNewTween( gameObject, Vector3.zero, delayTime, TweenAction.CALLBACK, optional );
}

/**
* Fade a gameobject's material to a certain alpha value. The material's shader needs to support alpha. <a href="http://owlchemylabs.com/content/">Owl labs has some excellent efficient shaders</a>.
* 
* @method LeanTween.alpha
* @param {GameObject} GameObject gameObject Gameobject that you wish to rotate
* @param {float} float to The time with which to delay before callin the function
* @param {float} float time The time with which to delay before calling the function
* @param {Hashtable} Hashtable optional Hashtable where you can pass <a href="#optional">optional items</a>.
* @return {int} Returns an integer id that is used to distinguish this tween
*/
public static int alpha(GameObject gameObject, float to, float time, Hashtable optional){
	return pushNewTween( gameObject, new Vector3(to,0,0), time, TweenAction.ALPHA, optional );
}

public static int alpha(GameObject gameObject, float to, float time){ 
	return alpha(gameObject,to,time,null); 
}

// Tweening Functions - Thanks to Robert Penner and GFX47

private static float tweenOnCurve( TweenDescr tweenDescr, float ratioPassed ){
	return tweenDescr.from.x + (tweenDescr.to.x - tweenDescr.from.x) * tweenDescr.animationCurve.Evaluate(ratioPassed);
}

private static Vector3 tweenOnCurveVector( TweenDescr tweenDescr, float ratioPassed ){
	return	new Vector3(tweenDescr.from.x + (tweenDescr.to.x-tweenDescr.from.x) * tweenDescr.animationCurve.Evaluate(ratioPassed),
						tweenDescr.from.y + (tweenDescr.to.y-tweenDescr.from.y) * tweenDescr.animationCurve.Evaluate(ratioPassed),
						tweenDescr.from.z + (tweenDescr.to.z-tweenDescr.from.z) * tweenDescr.animationCurve.Evaluate(ratioPassed) );
}

public static float easeOutQuadOpt( float start, float diff, float ratioPassed ){
	return -diff * ratioPassed * (ratioPassed - 2) + start;
}

public static float easeInQuadOpt( float start, float diff, float ratioPassed ){
	return diff * ratioPassed * ratioPassed + start;
}

public static float easeInOutQuadOpt( float start, float diff, float ratioPassed ){
	ratioPassed /= .5f;
	if (ratioPassed < 1) return diff / 2 * ratioPassed * ratioPassed + start;
	ratioPassed--;
	return -diff / 2 * (ratioPassed * (ratioPassed - 2) - 1) + start;
}

public static float linear(float start, float end, float val){
	return Mathf.Lerp(start, end, val);
}

public static float clerp(float start, float end, float val){
	float min = 0.0f;
	float max = 360.0f;
	float half = Mathf.Abs((max - min) / 2.0f);
	float retval = 0.0f;
	float diff = 0.0f;
	if ((end - start) < -half){
		diff = ((max - start) + end) * val;
		retval = start + diff;
	}else if ((end - start) > half){
		diff = -((max - end) + start) * val;
		retval = start + diff;
	}else retval = start + (end - start) * val;
	return retval;
}

public static float spring(float start, float end, float val){
	val = Mathf.Clamp01(val);
	val = (Mathf.Sin(val * Mathf.PI * (0.2f + 2.5f * val * val * val)) * Mathf.Pow(1f - val, 2.2f) + val) * (1f + (1.2f * (1f - val)));
	return start + (end - start) * val;
}

public static float easeInQuad(float start, float end, float val){
	end -= start;
	return end * val * val + start;
}

public static float easeOutQuad(float start, float end, float val){
	end -= start;
	return -end * val * (val - 2) + start;
}

public static float easeInOutQuad(float start, float end, float val){
	val /= .5f;
	end -= start;
	if (val < 1) return end / 2 * val * val + start;
	val--;
	return -end / 2 * (val * (val - 2) - 1) + start;
}

public static float easeInCubic(float start, float end, float val){
	end -= start;
	return end * val * val * val + start;
}

public static float easeOutCubic(float start, float end, float val){
	val--;
	end -= start;
	return end * (val * val * val + 1) + start;
}

public static float easeInOutCubic(float start, float end, float val){
	val /= .5f;
	end -= start;
	if (val < 1) return end / 2 * val * val * val + start;
	val -= 2;
	return end / 2 * (val * val * val + 2) + start;
}

public static float easeInQuart(float start, float end, float val){
	end -= start;
	return end * val * val * val * val + start;
}

public static float easeOutQuart(float start, float end, float val){
	val--;
	end -= start;
	return -end * (val * val * val * val - 1) + start;
}

public static float easeInOutQuart(float start, float end, float val){
	val /= .5f;
	end -= start;
	if (val < 1) return end / 2 * val * val * val * val + start;
	val -= 2;
	return -end / 2 * (val * val * val * val - 2) + start;
}

public static float easeInQuint(float start, float end, float val){
	end -= start;
	return end * val * val * val * val * val + start;
}

public static float easeOutQuint(float start, float end, float val){
	val--;
	end -= start;
	return end * (val * val * val * val * val + 1) + start;
}

public static float easeInOutQuint(float start, float end, float val){
	val /= .5f;
	end -= start;
	if (val < 1) return end / 2 * val * val * val * val * val + start;
	val -= 2;
	return end / 2 * (val * val * val * val * val + 2) + start;
}

public static float easeInSine(float start, float end, float val){
	end -= start;
	return -end * Mathf.Cos(val / 1 * (Mathf.PI / 2)) + end + start;
}

public static float easeOutSine(float start, float end, float val){
	end -= start;
	return end * Mathf.Sin(val / 1 * (Mathf.PI / 2)) + start;
}

public static float easeInOutSine(float start, float end, float val){
	end -= start;
	return -end / 2 * (Mathf.Cos(Mathf.PI * val / 1) - 1) + start;
}

public static float easeInExpo(float start, float end, float val){
	end -= start;
	return end * Mathf.Pow(2, 10 * (val / 1 - 1)) + start;
}

public static float easeOutExpo(float start, float end, float val){
	end -= start;
	return end * (-Mathf.Pow(2, -10 * val / 1) + 1) + start;
}

public static float easeInOutExpo(float start, float end, float val){
	val /= .5f;
	end -= start;
	if (val < 1) return end / 2 * Mathf.Pow(2, 10 * (val - 1)) + start;
	val--;
	return end / 2 * (-Mathf.Pow(2, -10 * val) + 2) + start;
}

public static float easeInCirc(float start, float end, float val){
	end -= start;
	return -end * (Mathf.Sqrt(1 - val * val) - 1) + start;
}

public static float easeOutCirc(float start, float end, float val){
	val--;
	end -= start;
	return end * Mathf.Sqrt(1 - val * val) + start;
}

public static float easeInOutCirc(float start, float end, float val){
	val /= .5f;
	end -= start;
	if (val < 1) return -end / 2 * (Mathf.Sqrt(1 - val * val) - 1) + start;
	val -= 2;
	return end / 2 * (Mathf.Sqrt(1 - val * val) + 1) + start;
}

/* GFX47 MOD START */
public static float easeInBounce(float start, float end, float val){
	end -= start;
	float d = 1f;
	return end - easeOutBounce(0, end, d-val) + start;
}
/* GFX47 MOD END */

/* GFX47 MOD START */
//public static function bounce(float start, float end, float val){
public static float easeOutBounce(float start, float end, float val){
	val /= 1f;
	end -= start;
	if (val < (1 / 2.75f)){
		return end * (7.5625f * val * val) + start;
	}else if (val < (2 / 2.75f)){
		val -= (1.5f / 2.75f);
		return end * (7.5625f * (val) * val + .75f) + start;
	}else if (val < (2.5 / 2.75)){
		val -= (2.25f / 2.75f);
		return end * (7.5625f * (val) * val + .9375f) + start;
	}else{
		val -= (2.625f / 2.75f);
		return end * (7.5625f * (val) * val + .984375f) + start;
	}
}
/* GFX47 MOD END */

/* GFX47 MOD START */
public static float easeInOutBounce(float start, float end, float val){
	end -= start;
	float d= 1f;
	if (val < d/2) return easeInBounce(0, end, val*2) * 0.5f + start;
	else return easeOutBounce(0, end, val*2-d) * 0.5f + end*0.5f + start;
}
/* GFX47 MOD END */

public static float easeInBack(float start, float end, float val){
	end -= start;
	val /= 1;
	float s= 1.70158f;
	return end * (val) * val * ((s + 1) * val - s) + start;
}

public static float easeOutBack(float start, float end, float val){
	float s= 1.70158f;
	end -= start;
	val = (val / 1) - 1;
	return end * ((val) * val * ((s + 1) * val + s) + 1) + start;
}

public static float easeInOutBack(float start, float end, float val){
	float s= 1.70158f;
	end -= start;
	val /= .5f;
	if ((val) < 1){
		s *= (1.525f);
		return end / 2 * (val * val * (((s) + 1) * val - s)) + start;
	}
	val -= 2;
	s *= (1.525f);
	return end / 2 * ((val) * val * (((s) + 1) * val + s) + 2) + start;
}

/* GFX47 MOD START */
public static float easeInElastic(float start, float end, float val){
	end -= start;
	
	float d = 1f;
	float p = d * .3f;
	float s= 0;
	float a = 0;
	
	if (val == 0) return start;
	val = val/d;
	if (val == 1) return start + end;
	
	if (a == 0f || a < Mathf.Abs(end)){
		a = end;
		s = p / 4;
		}else{
		s = p / (2 * Mathf.PI) * Mathf.Asin(end / a);
	}
	val = val-1;
	return -(a * Mathf.Pow(2, 10 * val) * Mathf.Sin((val * d - s) * (2 * Mathf.PI) / p)) + start;
}		
/* GFX47 MOD END */

/* GFX47 MOD START */
//public static function elastic(float start, float end, float val){
public static float easeOutElastic(float start, float end, float val){
/* GFX47 MOD END */
	//Thank you to rafael.marteleto for fixing this as a port over from Pedro's UnityTween
	end -= start;
	
	float d = 1f;
	float p= d * .3f;
	float s= 0;
	float a= 0;
	
	if (val == 0) return start;
	
	val = val / d;
	if (val == 1) return start + end;
	
	if (a == 0f || a < Mathf.Abs(end)){
		a = end;
		s = p / 4;
		}else{
		s = p / (2 * Mathf.PI) * Mathf.Asin(end / a);
	}
	
	return (a * Mathf.Pow(2, -10 * val) * Mathf.Sin((val * d - s) * (2 * Mathf.PI) / p) + end + start);
}		

/* GFX47 MOD START */
public static float easeInOutElastic(float start, float end, float val)
{
	end -= start;
	
	float d = 1f;
	float p= d * .3f;
	float s= 0;
	float a = 0;
	
	if (val == 0) return start;
	
	val = val / (d/2);
	if (val == 2) return start + end;
	
	if (a == 0f || a < Mathf.Abs(end)){
		a = end;
		s = p / 4;
		}else{
		s = p / (2 * Mathf.PI) * Mathf.Asin(end / a);
	}
	
	if (val < 1){
	 val = val-1;
	 return -0.5f * (a * Mathf.Pow(2, 10 * val) * Mathf.Sin((val * d - s) * (2 * Mathf.PI) / p)) + start;
	}
	val = val-1;
	return a * Mathf.Pow(2, -10 * val) * Mathf.Sin((val * d - s) * (2 * Mathf.PI) / p) * 0.5f + end + start;
}

}
