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
#pragma strict 
#pragma downcast


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
/**
* @property {integer} punch
*/
public enum LeanTweenType{
	notUsed, linear, easeOutQuad, easeInQuad, easeInOutQuad, easeInCubic, easeOutCubic, easeInOutCubic, easeInQuart, easeOutQuart, easeInOutQuart, 
	easeInQuint, easeOutQuint, easeInOutQuint, easeInSine, easeOutSine, easeInOutSine, easeInExpo, easeOutExpo, easeInOutExpo, easeInCirc, easeOutCirc, easeInOutCirc, 
	easeInBounce, easeOutBounce, easeInOutBounce, easeInBack, easeOutBack, easeInOutBack, easeInElastic, easeOutElastic, easeInOutElastic, punch
}

class TweenDescr{
	var toggle:boolean;
	var trans:Transform;
	var ltRect:LTRect;
	var from:Vector3;
	var to:Vector3;
	var diff:Vector3;
	var time:float;
	var useEstimatedTime:boolean;
	var useFrames:boolean;
	var passed:float;
	var type:TweenAction;
	var optional:Hashtable;
	var delay:float;
	var tweenFunc:Function;
	var tweenType:LeanTweenType;
	var animationCurve:AnimationCurve;
	var id:int;
	
	public function ToString(){
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
* @param {float} (alpha:float) Alpha (optional parameter, in case you are using the alpha functions and wish to start at an alpha different than 1.0)
* @param {float} (rotation:float) Rotation (optional parameter, in case you are using the rotate function and wish to start at a rotation different than 0.0)
*/

class LTRect{
	/**
	* Pass this value to the GUI Methods
	* 
	* @property rect
	* @type {Rect} rect:Rect Rect object that controls the positioning and size
	*/
	public var _rect:Rect;
	public var alpha:float;
	public var rotation:float;
	public var pivot:Vector2;

	public var rotateEnabled:boolean;
	public var rotateFinished:boolean;
	public var alphaEnabled:boolean;

	public function LTRect(x:float, y:float, width:float, height:float){
		_rect = Rect(x,y,width,height);
		this.alpha = 1.0;
		this.rotation = 0.0;
		this.rotateEnabled = this.alphaEnabled = false;
	}

	public function LTRect(x:float, y:float, width:float, height:float, alpha:float){
		_rect = Rect(x,y,width,height);
		this.alpha = alpha;
		this.rotation = 0.0;
		this.rotateEnabled = this.alphaEnabled = false;
	}

	public function LTRect(x:float, y:float, width:float, height:float, alpha:float, rotation:float){
		_rect = Rect(x,y,width,height);
		this.alpha = alpha;
		this.rotation = rotation;
		this.rotateEnabled = this.alphaEnabled = false;
		if(rotation!=0.0){
			this.rotateEnabled = true;
			resetForRotation();
		}
	}

	function resetForRotation(){
		if(pivot==Vector2.zero){
			pivot = Vector2(_rect.x+_rect.width*0.5, _rect.y+_rect.height*0.5);
			_rect.x += -pivot.x;
			_rect.y += -pivot.y;
		}
	}

	function get rect():Rect{
		if(rotateEnabled){
			if(rotateFinished){
				rotateFinished = false;
				rotateEnabled = false;
				_rect.x += pivot.x;
				_rect.y += pivot.y;
				pivot = Vector2.zero;
				GUI.matrix = Matrix4x4.identity; 
			}else{
				var trsMatrix:Matrix4x4 = Matrix4x4.identity; 
				trsMatrix.SetTRS(pivot, Quaternion.Euler(0,0,rotation), Vector3.one);
				GUI.matrix = trsMatrix;
			}
		}else if(alphaEnabled){
			GUI.color.a = alpha;
		}
		return _rect;
	}

	function set rect( value ){
		_rect = value;
	}
}

private enum TweenAction{
	MOVE_X,
	MOVE_Y,
	MOVE_Z,
	MOVE_LOCAL_X,
	MOVE_LOCAL_Y,
	MOVE_LOCAL_Z,
	SCALE_X,
	SCALE_Y,
	SCALE_Z,
	ROTATE_X,
	ROTATE_Y,
	ROTATE_Z,
	ALPHA,
	ALPHA_VERTEX,
	CALLBACK,
	MOVE,
	MOVE_LOCAL,
	ROTATE,
	ROTATE_LOCAL,
	SCALE,
	GUI_MOVE,
	GUI_SCALE,
	GUI_ALPHA,
	GUI_ROTATE
}

/**
* LeanTween is an efficient tweening engine for Unity3d<br><br>
* <strong id='optional'>Optional Parameters</strong> are passed in a hash table variable that is accepted at the end of every tweening function.<br>
* Values you can pass:<br>
* <strong>delay</strong>: time (or frames if you are using "useFrames") before the tween starts<br>
* <strong>ease</strong>: Function that desribes the easing you want to be used, you can pass your own or use many of the included tweens. ex: <i>{"ease":LeanTween.easeOutQuad}</i><br> 
* <strong>onComplete</strong>: Function to call at the end of the tween ex: <i>{"onComplete":functionToCallOnComplete}</i> or <i>{"onComplete":functionToCallOnComplete,"onCompleteParam":hashTableToPassToOnComplete}</i><br>
* <strong>onUpdate</strong>: Function to call on every update ex: <i>{"onUpdate":functionToCallOnUpdate}</i> or <i>{"onUpdate":functionToCallOnUpdate,"onUpdateParam":hashTableToPassToOnUpdate}</i><br>
* <strong>useEstimatedTime</strong>: This is useful if the Time.timeScale is set to zero (such as when the game is paused) or some other value and you still want the tween to move at a normal pace ex: <i>{"useEstimatedTime":true}</i><br>
* <strong>useFrames</strong>: Instead of time passed for both the delay and time value, the amount of frames that have passed is used <i>ex: {"useFrames":true}</i><br>
* <strong>onCompleteTarget</strong>: In C# if you are passing a String to the "onComplete" parameter, this variable allows you to define target to call the function than the game object you are tweening.<br>
* <strong>onUpdateTarget</strong>: The same as onCompleteTarget, but for the onUpdate function.<br>
*
* @class LeanTween
*/

public class LeanTween extends MonoBehaviour {

public static var throwErrors:boolean = true;
private static var tweens:TweenDescr[];
private static var tweenMaxSearch:int = 0;
private static var maxTweens:int = 400;
private static var frameRendered:int = -1;
private static var tweenEmpty:GameObject;
private static var dtEstimated:float;
private static var dt:float;
private static var dtActual:float;
private static var tween:TweenDescr;
private static var i:int;
private static var j:int;
private static var punch:AnimationCurve = new AnimationCurve( Keyframe(0, 0 ), Keyframe(0.112586, 0.9976035 ), Keyframe(0.3120486, -0.1720615 ), Keyframe(0.4316337, 0.07030682 ), Keyframe(0.5524869, -0.03141804 ), Keyframe(0.6549395, 0.003909959 ), Keyframe(0.770987, -0.009817753 ), Keyframe(0.8838775, 0.001939224 ), Keyframe(1, 0 ) );
private static var emptyHash:Hashtable = new Hashtable();

public static function init(){
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
public static function init(maxSimultaneousTweens:int){
	if(!tweens){
		maxTweens = maxSimultaneousTweens;
		tweens = new TweenDescr[maxTweens];
		tweenEmpty = new GameObject();
		tweenEmpty.name = "~LeanTween";
		tweenEmpty.AddComponent(LeanTween);
		tweenEmpty.isStatic = true;
		tweenEmpty.DontDestroyOnLoad( tweenEmpty );
		for(i = 0; i < maxTweens; i++){
			tweens[i] = new TweenDescr();
		}
	}
}

public function Update(){
	LeanTween.update();
}

private static var trans:Transform;
private static var mesh:Mesh;
private static var vertices:Vector3[];
private static var colors:Color32[];
private static var timeTotal:float;
private static var tweenAction:int;
private static var optionalItems:Hashtable;
private static var tweenFunc:Function;
private static var animationCurve:AnimationCurve;
private static var ratioPassed:float;
private static var val:float;
private static var fromVect:Vector3;
private static var toVect:Vector3;
private static var newVect:Vector3;
private static var isTweenFinished:boolean;
private static var target:GameObject;
private static var customTarget:GameObject;

public static function update() {
	if(frameRendered != Time.frameCount){ // make sure update is only called once per frame
		init();
		dtEstimated = Application.targetFrameRate > 0 ? 1.0 / Application.targetFrameRate : 1.0 / 60.0;
		dtActual = Time.deltaTime*Time.timeScale;
		// if(tweenMaxSearch>1500)
		// 	Debug.Log("tweenMaxSearch:"+tweenMaxSearch +" maxTweens:"+maxTweens);
		for(i = 0; i < tweenMaxSearch && i < maxTweens; i++){
			
			//Debug.Log("tweens["+i+"].toggle:"+tweens[i].toggle);
			if(tweens[i].toggle){
				tween = tweens[i];
				trans = tween.trans as Transform;
				timeTotal = tween.time;
				tweenAction = tween.type;
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
					switch(tweenAction){
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
						case TweenAction.ALPHA_VERTEX:
							tween.from.x = trans.GetComponent(MeshFilter).mesh.colors32[0].a;
							break;
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
							tween.from = Vector3(tween.ltRect.rect.x, tween.ltRect.rect.y, 0.0); break;
						case TweenAction.GUI_SCALE:
							tween.from = Vector3(tween.ltRect.rect.width, tween.ltRect.rect.height, 0.0); break;
						case TweenAction.GUI_ALPHA:
							tween.from.x = tween.ltRect.alpha; break;
						case TweenAction.GUI_ROTATE:
							if(tween.ltRect.rotateEnabled==false){
								tween.ltRect.rotateEnabled = true;
								tween.ltRect.resetForRotation();
							}
							
							tween.from.x = tween.ltRect.rotation; break;
					}
					tween.diff.x = tween.to.x - tween.from.x;
					tween.diff.y = tween.to.y - tween.from.y;
					tween.diff.z = tween.to.z - tween.from.z;
				}
				if(tween.delay<=0){
					// Move Values
					ratioPassed = tween.passed / timeTotal;
					if(ratioPassed>1.0)
						ratioPassed = 1.0;
					
					if(tweenAction>=TweenAction.MOVE_X && tweenAction<=TweenAction.CALLBACK){
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
									val = easeInOutElastic(tween.from.x, tween.to.x, ratioPassed); break;
								case LeanTweenType.punch:
									tween.animationCurve = LeanTween.punch;
									tween.to.x = tween.from.x + tween.to.x;
									val = tweenOnCurve(tween, ratioPassed); break;
								default:
									val = tweenFunc(tween.from.x, tween.to.x, ratioPassed);								
							}
						
						}
						// Debug.Log("from:"+tween.from.x+" to:"+tween.to.x+" val:"+val+" ratioPassed:"+ratioPassed);
						if(tweenAction==TweenAction.MOVE_X){
							trans.position.x = val;
						}else if(tweenAction==TweenAction.MOVE_Y){
							trans.position.y = val;
						}else if(tweenAction==TweenAction.MOVE_Z){
							trans.position.z = val;
						}if(tweenAction==TweenAction.MOVE_LOCAL_X){
							trans.localPosition.x = val;
						}else if(tweenAction==TweenAction.MOVE_LOCAL_Y){
							trans.localPosition.y = val;
						}else if(tweenAction==TweenAction.MOVE_LOCAL_Z){
							trans.localPosition.z = val;
						}else if(tweenAction==TweenAction.SCALE_X){
							trans.localScale.x = val;
						}else if(tweenAction==TweenAction.SCALE_Y){
							trans.localScale.y = val;
						}else if(tweenAction==TweenAction.SCALE_Z){
							trans.localScale.z = val;
						}else if(tweenAction==TweenAction.ROTATE_X){
					    	trans.eulerAngles.x = val;
					    }else if(tweenAction==TweenAction.ROTATE_Y){
					    	trans.eulerAngles.y = val;
					    }else if(tweenAction==TweenAction.ROTATE_Z){
					    	trans.eulerAngles.z = val;
					    }else if(tweenAction==TweenAction.ALPHA){
							trans.gameObject.renderer.material.color.a = val;
						}else if(tweenAction==TweenAction.ALPHA_VERTEX){
							mesh = trans.GetComponent(MeshFilter).mesh;
							vertices = mesh.vertices;
							colors = new Color32[vertices.Length];
							var c:Color32 = mesh.colors32[0];
							c.a = val;
							for (var k = 0; k < vertices.Length; k++) {
								colors[k] = c;
							}
							mesh.colors32 = colors;
						}
						
					}else if(tweenAction>=TweenAction.MOVE){
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
										newVect = Vector3(easeOutQuadOpt(tween.from.x, tween.diff.x, ratioPassed), easeOutQuadOpt(tween.from.y, tween.diff.y, ratioPassed), easeOutQuadOpt(tween.from.z, tween.diff.z, ratioPassed)); break;
									case LeanTweenType.easeInQuad:
										newVect = Vector3(easeInQuadOpt(tween.from.x, tween.diff.x, ratioPassed), easeInQuadOpt(tween.from.y, tween.diff.y, ratioPassed), easeInQuadOpt(tween.from.z, tween.diff.z, ratioPassed)); break;
									case LeanTweenType.easeInOutQuad:
										newVect = Vector3(easeInOutQuadOpt(tween.from.x, tween.diff.x, ratioPassed), easeInOutQuadOpt(tween.from.y, tween.diff.y, ratioPassed), easeInOutQuadOpt(tween.from.z, tween.diff.z, ratioPassed)); break;
									case LeanTweenType.easeInCubic:
										newVect = Vector3(easeInCubic(tween.from.x, tween.to.x, ratioPassed), easeInCubic(tween.from.y, tween.to.y, ratioPassed), easeInCubic(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeOutCubic:
										newVect = Vector3(easeOutCubic(tween.from.x, tween.to.x, ratioPassed), easeOutCubic(tween.from.y, tween.to.y, ratioPassed), easeOutCubic(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeInOutCubic:
										newVect = Vector3(easeInOutCubic(tween.from.x, tween.to.x, ratioPassed), easeInOutCubic(tween.from.y, tween.to.y, ratioPassed), easeInOutCubic(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeInQuart:
										newVect = Vector3(easeInQuart(tween.from.x, tween.to.x, ratioPassed), easeInQuart(tween.from.y, tween.to.y, ratioPassed), easeInQuart(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeOutQuart:
										newVect = Vector3(easeOutQuart(tween.from.x, tween.to.x, ratioPassed), easeOutQuart(tween.from.y, tween.to.y, ratioPassed), easeOutQuart(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeInOutQuart:
										newVect = Vector3(easeInOutQuart(tween.from.x, tween.to.x, ratioPassed), easeInOutQuart(tween.from.y, tween.to.y, ratioPassed), easeInOutQuart(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeInQuint:
										newVect = Vector3(easeInQuint(tween.from.x, tween.to.x, ratioPassed), easeInQuint(tween.from.y, tween.to.y, ratioPassed), easeInQuint(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeOutQuint:
										newVect = Vector3(easeOutQuint(tween.from.x, tween.to.x, ratioPassed), easeOutQuint(tween.from.y, tween.to.y, ratioPassed), easeOutQuint(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeInOutQuint:
										newVect = Vector3(easeInOutQuint(tween.from.x, tween.to.x, ratioPassed), easeInOutQuint(tween.from.y, tween.to.y, ratioPassed), easeInOutQuint(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeInSine:
										newVect = Vector3(easeInSine(tween.from.x, tween.to.x, ratioPassed), easeInSine(tween.from.y, tween.to.y, ratioPassed), easeInSine(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeOutSine:
										newVect = Vector3(easeOutSine(tween.from.x, tween.to.x, ratioPassed), easeOutSine(tween.from.y, tween.to.y, ratioPassed), easeOutSine(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeInOutSine:
										newVect = Vector3(easeInOutSine(tween.from.x, tween.to.x, ratioPassed), easeInOutSine(tween.from.y, tween.to.y, ratioPassed), easeInOutSine(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeInExpo:
										newVect = Vector3(easeInExpo(tween.from.x, tween.to.x, ratioPassed), easeInExpo(tween.from.y, tween.to.y, ratioPassed), easeInExpo(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeOutExpo:
										newVect = Vector3(easeOutExpo(tween.from.x, tween.to.x, ratioPassed), easeOutExpo(tween.from.y, tween.to.y, ratioPassed), easeOutExpo(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeInOutExpo:
										newVect = Vector3(easeInOutExpo(tween.from.x, tween.to.x, ratioPassed), easeInOutExpo(tween.from.y, tween.to.y, ratioPassed), easeInOutExpo(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeInCirc:
										newVect = Vector3(easeInCirc(tween.from.x, tween.to.x, ratioPassed), easeInCirc(tween.from.y, tween.to.y, ratioPassed), easeInCirc(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeOutCirc:
										newVect = Vector3(easeOutCirc(tween.from.x, tween.to.x, ratioPassed), easeOutCirc(tween.from.y, tween.to.y, ratioPassed), easeOutCirc(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeInOutCirc:
										newVect = Vector3(easeInOutCirc(tween.from.x, tween.to.x, ratioPassed), easeInOutCirc(tween.from.y, tween.to.y, ratioPassed), easeInOutCirc(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeInBounce:
										newVect = Vector3(easeInBounce(tween.from.x, tween.to.x, ratioPassed), easeInBounce(tween.from.y, tween.to.y, ratioPassed), easeInBounce(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeOutBounce:
										newVect = Vector3(easeOutBounce(tween.from.x, tween.to.x, ratioPassed), easeOutBounce(tween.from.y, tween.to.y, ratioPassed), easeOutBounce(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeInOutBounce:
										newVect = Vector3(easeInOutBounce(tween.from.x, tween.to.x, ratioPassed), easeInOutBounce(tween.from.y, tween.to.y, ratioPassed), easeInOutBounce(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeInBack:
										newVect = Vector3(easeInBack(tween.from.x, tween.to.x, ratioPassed), easeInBack(tween.from.y, tween.to.y, ratioPassed), easeInBack(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeOutBack:
										newVect = Vector3(easeOutBack(tween.from.x, tween.to.x, ratioPassed), easeOutBack(tween.from.y, tween.to.y, ratioPassed), easeOutBack(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeInOutBack:
										newVect = Vector3(easeInOutBack(tween.from.x, tween.to.x, ratioPassed), easeInOutBack(tween.from.y, tween.to.y, ratioPassed), easeInOutBack(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeInElastic:
										newVect = Vector3(easeInElastic(tween.from.x, tween.to.x, ratioPassed), easeInElastic(tween.from.y, tween.to.y, ratioPassed), easeInElastic(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeOutElastic:
										newVect = Vector3(easeOutElastic(tween.from.x, tween.to.x, ratioPassed), easeOutElastic(tween.from.y, tween.to.y, ratioPassed), easeOutElastic(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.easeInOutElastic:
										newVect = Vector3(easeInOutElastic(tween.from.x, tween.to.x, ratioPassed), easeInOutElastic(tween.from.y, tween.to.y, ratioPassed), easeInOutElastic(tween.from.z, tween.to.z, ratioPassed)); break;
									case LeanTweenType.punch:
										tween.animationCurve = LeanTween.punch;
										tween.to.x = tween.from.x + tween.to.x;
										tween.to.y = tween.from.y + tween.to.y;
										tween.to.z = tween.from.z + tween.to.z;
										if(tweenAction==TweenAction.ROTATE || tweenAction==TweenAction.ROTATE_LOCAL){
											tween.to.x = closestRot(tween.from.x, tween.to.x);
											tween.to.y = closestRot(tween.from.y, tween.to.y);
											tween.to.z = closestRot(tween.from.z, tween.to.z);
										}
										newVect = tweenOnCurveVector(tween, ratioPassed); break;
								}
							}else{
								fromVect = tween.from;
								toVect = tween.to;
								newVect.x = tweenFunc(fromVect.x, toVect.x, ratioPassed);
								newVect.y = tweenFunc(fromVect.y, toVect.y, ratioPassed);
								newVect.z = tweenFunc(fromVect.z, toVect.z, ratioPassed);
							}
						}
						 
						if(tweenAction==TweenAction.MOVE){
							trans.position = newVect;
					    }else if(tweenAction==TweenAction.MOVE_LOCAL){
							trans.localPosition = newVect;
					    }else if(tweenAction==TweenAction.ROTATE){
					    	trans.eulerAngles = newVect;
					    }else if(tweenAction==TweenAction.ROTATE_LOCAL){
					    	trans.localEulerAngles = newVect;
					    }else if(tweenAction==TweenAction.SCALE){
					    	trans.localScale = newVect;
					    }else if(tweenAction==TweenAction.GUI_MOVE){
					    	tween.ltRect._rect.x = newVect.x;
					    	tween.ltRect._rect.y = newVect.y;
					    }else if(tweenAction==TweenAction.GUI_SCALE){
					    	tween.ltRect._rect.width = newVect.x;
					    	tween.ltRect._rect.height = newVect.y;
					    }else if(tweenAction==TweenAction.GUI_ALPHA){
					    	tween.ltRect.alpha = newVect.x;
					    }else if(tweenAction==TweenAction.GUI_ROTATE){
					    	tween.ltRect.rotation = newVect.x;
					    }
					}

					if(tween.optional!=null){
						var onUpdate = optionalItems["onUpdate"];
						if(onUpdate!=null){
							var updateParam:Hashtable = optionalItems["onUpdateParam"];
							if(onUpdate.GetType() == String){
								var onUpdateS:String = onUpdate as String;
								if (optionalItems["onUpdateTarget"]!=null){
									customTarget = optionalItems["onUpdateTarget"];
									customTarget.BroadcastMessage( onUpdateS, val );
								}else{
									trans.gameObject.BroadcastMessage( onUpdateS, val );
								}
							}else{
								var onUpdateF:Function = onUpdate as Function;
								if(updateParam!=null) onUpdateF( val, updateParam );
								else onUpdateF(val);
							}
						}
					}
				}
				
				if(isTweenFinished){
					if(tweenAction==TweenAction.GUI_ROTATE){
						tween.ltRect.rotateFinished = true;
					}
					var callback:Function;
					var callbackS:String;
					var callbackParam;
					if(tween.optional!=null && tween.trans!=null){
						if(optionalItems["onComplete"]!=null){
							if(optionalItems["onComplete"].GetType()==String){
								callbackS = optionalItems["onComplete"] as String;
							}else{
								callback = optionalItems["onComplete"] as Function;
							}
						}
						callbackParam = optionalItems["onCompleteParam"];
					}
					removeTween(i);
					if(callback!=null){
						if(callbackParam) callback( callbackParam );
						else callback();
					}else if(callbackS!=null){
						if (optionalItems["onCompleteTarget"]!=null){
							customTarget = optionalItems["onCompleteTarget"];
							if(callbackParam!=null) customTarget.BroadcastMessage( callbackS, callbackParam );
							else customTarget.BroadcastMessage( callbackS );
						}else{
							if(callbackParam!=null) trans.gameObject.BroadcastMessage( callbackS, callbackParam );
							else trans.gameObject.BroadcastMessage( callbackS );
						}
					}
				}else if(tween.delay<=0){
					tween.passed += dt;
				}else{
					tween.delay -= dt;
					if(tween.delay<0){
						tween.passed = 0.0;//-tween.delay
						tween.delay = 0.0;
					}
				}
			}
		}

		frameRendered = Time.frameCount;
	}
}

private static function removeTween( i:int ){
	tweens[i].toggle = false;
	startSearch = i;
	//Debug.Log("start search reset:"+startSearch + " i:"+i+" tweenMaxSearch:"+tweenMaxSearch);
	if(i+1>=tweenMaxSearch){
		//Debug.Log("reset to zero");
		startSearch = 0;
		tweenMaxSearch--;
	}
}

private static var startSearch:int = 0;
private static var lastMax:int = 0;

private static function pushNewTween( gameObject:GameObject, to:Vector3, time:float, TweenAction:TweenAction, optional:Hashtable ):int{
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
			var errorMsg:String = "LeanTween - You have run out of available spaces for tweening. To avoid this error increase the number of spaces to available for tweening when you initialize the LeanTween class ex: LeanTween.init( "+(maxTweens*2)+" );";
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
	tween.passed = 0.0;
	tween.type = TweenAction;
	tween.optional = optional;
	tween.delay = 0.0;
	tween.id = i;
	tween.useEstimatedTime = false;
	tween.useFrames = false;
	tween.animationCurve = null;
	tween.tweenType = LeanTweenType.linear;

	if(optional!=null && optional!=emptyHash){
		var ease = optional["ease"];
		var optionsNotUsed = 0;
		if(ease!=null){
			tween.tweenType = LeanTweenType.notUsed;
			if( ease.GetType() == LeanTweenType ){
				tween.tweenType = ease;
			}else if(ease.GetType() == AnimationCurve){
				tween.animationCurve = optional["ease"] as AnimationCurve;
			}else{
				tween.tweenFunc = optional["ease"] as Function;
				if(tween.tweenFunc==LeanTween.easeOutQuad){
					tween.tweenType = LeanTweenType.easeOutQuad;
				}else if(tween.tweenFunc==LeanTween.easeInQuad){
					tween.tweenType = LeanTweenType.easeInQuad;
				}else if(tween.tweenFunc==LeanTween.easeInOutQuad){
					tween.tweenType = LeanTweenType.easeInOutQuad;
				}
			}
			optionsNotUsed++;
		}
		if(optional["rect"]!=null){
			tween.ltRect = optional["rect"];
			optionsNotUsed++;
		}
		if(optional["delay"]!=null){
			tween.delay = optional["delay"];
			optionsNotUsed++;
		}
		if(optional["useEstimatedTime"]!=null){
			tween.useEstimatedTime = optional["useEstimatedTime"];
			optionsNotUsed++;
		}
		if(optional["useFrames"]!=null){
			tween.useFrames = optional["useFrames"];
			optionsNotUsed++;
		}
		if(optional.Count <= optionsNotUsed)
			tween.optional = null;  // nothing else is used with the extra piece, so set to null
	}
	//Debug.Log("pushing new tween["+i+"]:"+tweens[i]);
	
	return tweens[i].id;
}

public static function h( arr:Object[] ):Hashtable{
	if(arr.Length%2==1){
		var errorMsg:String = "LeanTween - You have attempted to create a Hashtable with an odd number of values.";
		if(throwErrors) Debug.LogError( errorMsg ); else Debug.Log( errorMsg );
		return null;
	}
	var hash:Hashtable = new Hashtable();
	for(i = 0; i < arr.Length; i += 2){
		hash.Add(arr[i] as String, arr[i+1]);
	}

	return hash;
}

public static function closestRot( from:float, to:float ):float{
	var minusWhole:float = 0 - (360 - to);
	var plusWhole:float = 360 + to;
	var toDiffAbs:float = Mathf.Abs( to-from );
	var minusDiff:float = Mathf.Abs(minusWhole-from);
	var plusDiff:float = Mathf.Abs(plusWhole-from);
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
* @param {GameObject} gameObject:GameObject whose tweens you want to cancel
*/
public static function cancel( gameObject:GameObject ){
	var trans:Transform = gameObject.transform;
	for(var i:int = 0; i < tweenMaxSearch; i++){
		if(tweens[i].trans===trans)
			removeTween(i);
	}
}

/**
* Cancel a specific tween for a gameObject
* 
* @method LeanTween.cancel
* @param {GameObject} gameObject:GameObject GameObject whose tweens you want to cancel
* @param {int} id:int Id of the tween you want to cancel ex: var id:int = LeanTween.MoveX(gameObject, 5, 1.0);
*/
public static function cancel( gameObject:GameObject, id:int ){
	var trans:Transform = gameObject.transform;
	for(var i:int = 0; i < tweenMaxSearch; i++){
		if(tweens[i].trans===trans && tweens[i].id == id)
			removeTween(i);
	}
}

public static function isTweening( gameObject:GameObject ):boolean{
	var trans:Transform = gameObject.transform;
	for(i = 0; i < tweenMaxSearch; i++){
		if(tweens[i].toggle && tweens[i].trans===trans)
			return true;
	}
	return false;
}

public static function isTweening( ltRect:LTRect ):boolean{
	for(i = 0; i < tweenMaxSearch; i++){
		if(tweens[i].toggle && tweens[i].ltRect===ltRect)
			return true;
	}
	return false;
}

/**
* Tween any particular value, it does not need to be tied to any particular type or GameObject
* 
* @method LeanTween.value
* @param {Function} callOnUpdate:Function The function that is called on every Update frame, this function needs to accept a float value ex: function updateValue( val:float ){ }
* @param {float} from:float The original value to start the tween from
* @param {float} to:float The value to end the tween on
* @param {float} time:float The time to complete the tween in
* @return {int} Returns an integer id that is used to distinguish this tween
*/
public static function value(callOnUpdate:Function, from:float, to:float, time:float, optional:Hashtable):int{
	return value( tweenEmpty, callOnUpdate, from, to, time, optional );
}
public static function value(callOnUpdate:Function, from:float, to:float, time:float, optional:Object[]):int{
	return value( tweenEmpty, callOnUpdate, from, to, time, h(optional) );
}
public static function value(gameObject:GameObject, callOnUpdate:String, from:float, to:float, time:float, optional:Hashtable):int{
	if(optional==null || optional==emptyHash)
		optional = new Hashtable();
		
	optional["onUpdate"] = callOnUpdate;
	var id:int = pushNewTween( gameObject, Vector3(to,0,0), time, TweenAction.CALLBACK, optional );
	tweens[id].from = new Vector3(from,0,0);
	return id;
}
public static function value(gameObject:GameObject, callOnUpdate:String, from:float, to:float, time:float, optional:Object[]):int{
	return value(gameObject, callOnUpdate, from, to, time, h(optional)); 
}

public static function value(gameObject:GameObject, callOnUpdate:Function, from:float, to:float, time:float):int{
	return value(gameObject, callOnUpdate, from, to, time, emptyHash); 
}

/**
* Tween any particular value, it does not need to be tied to any particular type or GameObject
* 
* @method LeanTween.value
* @param {GameObject} gameObject:GameObject GameObject with which to tie the tweening with. This is only used when you need to cancel this tween, it does not actually perform any operations on this gameObject
* @param {Function} callOnUpdate:Function The function that is called on every Update frame, this function needs to accept a float value ex: function updateValue( val:float ){ }
* @param {float} from:float The original value to start the tween from
* @param {float} to:float The value to end the tween on
* @param {float} time:float The time to complete the tween in
* @param {Hashtable} time:Hashtable The time to complete the tween in
* @return {int} Returns an integer id that is used to distinguish this tween
*/
public static function value(gameObject:GameObject, callOnUpdate:Function, from:float, to:float, time:float, optional:Hashtable):int{
	if(optional==null || optional==emptyHash)
		optional = new Hashtable();
		
	optional["onUpdate"] = callOnUpdate;
	var id:int = pushNewTween( gameObject, Vector3(to,0,0), time, TweenAction.CALLBACK, optional );
	tweens[id].from = new Vector3(from,0,0);
	return id;
}

public static function value(gameObject:GameObject, callOnUpdate:Function, from:float, to:float, time:float, optional:Object[]):int{
	return value(gameObject, callOnUpdate, from, to, time, h(optional)); 
}

/**
* Rotate a GameObject, to values are in passed in degrees
* 
* @method LeanTween.rotate
* @param {GameObject} gameObject:GameObject Gameobject that you wish to rotate
* @param {Vector3} to:Vector3 The final rotation with which to rotate to
* @param {float} time:float The time to complete the tween in
* @return {int} Returns an integer id that is used to distinguish this tween
* @example <i>Javascript:</i><br>
* LeanTween.rotate(cube, Vector3(180,30,0), 1.5);
* <br><br>
* <i>C#: </i> <br>
* LeanTween.rotate(cube, Vector3(180f,30f,0f), 1.5f);<br>
*/
public static function rotate(gameObject:GameObject, to:Vector3, time:float):int{
	return rotate( gameObject, to, time, emptyHash );
}

/**
* Rotate a GameObject, to values that are in passed in degrees
* 
* @method LeanTween.rotate
* @param {GameObject} gameObject:GameObject Gameobject that you wish to rotate
* @param {Vector3} to:Vector3 The final rotation with which to rotate to
* @param {float} time:float The time to complete the tween in
* @param {Hashtable} optional:Hashtable Hashtable where you can pass <a href="#optional">optional items</a>.
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
public static function rotate(gameObject:GameObject, to:Vector3, time:float, optional:Hashtable):int{
	return pushNewTween( gameObject, to, time, TweenAction.ROTATE, optional );
}

public static function rotate(gameObject:GameObject, to:Vector3, time:float, optional:Object[]):int{
	return rotate( gameObject, to, time, h( optional ) );
}

public static function rotate(ltRect:LTRect, to:float, time:float, optional:Hashtable):int{
	init();
	if( optional == null )
		optional = new Hashtable();

	optional["rect"] = ltRect;
	return pushNewTween( tweenEmpty, Vector3(to,0,0), time, TweenAction.GUI_ROTATE, optional );
}

/**
* Rotate a GUI element (using an LTRect object), to a value that is in degrees
* 
* @method LeanTween.rotate
* @param {LTRect} ltRect:LTRect LTRect that you wish to rotate
* @param {float} to:float The final rotation with which to rotate to
* @param {float} time:float The time to complete the tween in
* @param {Array} optional:Array Object Array where you can pass <a href="#optional">optional items</a>.
* @return {int} Returns an integer id that is used to distinguish this tween
* @example <i>Javascript:</i><br>
* if(GUI.Button(buttonRect.rect, "Rotate"))<br>
*	LeanTween.rotate( buttonRect4, 150.0, 1.0, ["ease",LeanTween.easeOutElastic]);<br>
* GUI.matrix = Matrix4x4.identity;<br>
* <br><br>
* <i>C#: </i> <br>
* if(GUI.Button(buttonRect.rect, "Rotate"))<br>
*	LeanTween.rotate( buttonRect4, 150.0, 1.0, new object[]{"ease",LeanTween.easeOutElastic});<br>
* GUI.matrix = Matrix4x4.identity;<br>
*/
public static function rotate(ltRect:LTRect, to:float, time:float, optional:Object[]):int{
	return rotate( ltRect, to, time, h(optional) );
}

/**
* Rotate a GameObject only on the X axis
* 
* @method LeanTween.rotateX
* @param {GameObject} gameObject:GameObject Gameobject that you wish to rotate
* @param {float} to:float The final x-axis rotation with which to rotate
* @param {float} time:float The time to complete the rotation in
*/
public static function rotateX(gameObject:GameObject, to:float, time:float):int{
	return rotateX( gameObject, to, time, emptyHash );
}
/**
* Rotate a GameObject only on the X axis
* 
* @method LeanTween.rotateX
* @param {GameObject} gameObject:GameObject Gameobject that you wish to rotate
* @param {float} to:float The final x-axis rotation with which to rotate
* @param {float} time:float The time to complete the rotation in
* @param {Hashtable} optional:Hashtable Hashtable where you can pass <a href="#optional">optional items</a>.
*/
public static function rotateX(gameObject:GameObject, to:float, time:float, optional:Hashtable):int{
	return pushNewTween( gameObject, Vector3(to,0,0), time, TweenAction.ROTATE_X, optional );
}

public static function rotateX(gameObject:GameObject, to:float, time:float, optional:Object[]):int{
	return rotateX( gameObject, to, time, h(optional) );
}

/**
* Rotate a GameObject only on the Y axis
* 
* @method LeanTween.rotateY
* @param {GameObject} gameObject:GameObject Gameobject that you wish to rotate
* @param {float} to:float The final y-axis rotation with which to rotate
* @param {float} time:float The time to complete the rotation in
*/
public static function rotateY(gameObject:GameObject, to:float, time:float):int{
	return rotateY( gameObject, to, time, emptyHash );
}
/**
* Rotate a GameObject only on the Y axis
* 
* @method LeanTween.rotateY
* @param {GameObject} gameObject:GameObject Gameobject that you wish to rotate
* @param {float} to:float The final y-axis rotation with which to rotate
* @param {float} time:float The time to complete the rotation in
* @param {Hashtable} optional:Hashtable Hashtable where you can pass <a href="#optional">optional items</a>.
*/
public static function rotateY(gameObject:GameObject, to:float, time:float, optional:Hashtable):int{
	return pushNewTween( gameObject, Vector3(to,0,0), time, TweenAction.ROTATE_Y, optional );
}

public static function rotateY(gameObject:GameObject, to:float, time:float, optional:Object[]):int{
	return rotateY( gameObject, to, time, h(optional) );
}

/**
* Rotate a GameObject only on the Z axis
* 
* @method LeanTween.rotateZ
* @param {GameObject} gameObject:GameObject Gameobject that you wish to rotate
* @param {float} to:float The final z-axis rotation with which to rotate
* @param {float} time:float The time to complete the rotation in
*/
public static function rotateZ(gameObject:GameObject, to:float, time:float):int{
	return rotateZ( gameObject, to, time, emptyHash );
}
/**
* Rotate a GameObject only on the Z axis
* 
* @method LeanTween.rotateZ
* @param {GameObject} gameObject:GameObject Gameobject that you wish to rotate
* @param {float} to:float The final z-axis rotation with which to rotate
* @param {float} time:float The time to complete the rotation in
* @param {Hashtable} optional:Hashtable Hashtable where you can pass <a href="#optional">optional items</a>.
*/
public static function rotateZ(gameObject:GameObject, to:float, time:float, optional:Hashtable):int{
	return pushNewTween( gameObject, Vector3(to,0,0), time, TweenAction.ROTATE_Z, optional );
}

public static function rotateZ(gameObject:GameObject, to:float, time:float, optional:Object[]):int{
	return rotateZ( gameObject, to, time, h(optional) );
}
/**
* Rotate a GameObject in the objects local space (on the transforms localEulerAngles object)
* 
* @method LeanTween.rotateLocal
* @param {GameObject} gameObject:GameObject Gameobject that you wish to rotate
* @param {Vector3} to:Vector3 The final rotation with which to rotate to
* @param {float} time:float The time to complete the rotation in
* @param {Hashtable} optional:Hashtable Hashtable where you can pass <a href="#optional">optional items</a>.
*/
public static function rotateLocal(gameObject:GameObject, to:Vector3, time:float, optional:Hashtable):int{
	return pushNewTween( gameObject, to, time, TweenAction.ROTATE_LOCAL, optional );
}

public static function rotateLocal(gameObject:GameObject, to:Vector3, time:float, optional:Object[]):int{
	return rotateLocal( gameObject, to, time, h(optional) );
}

/**
* Move a GameObject along the x-axis
* 
* @method LeanTween.moveX
* @param {GameObject} gameObject:GameObject Gameobject that you wish to move
* @param {float} to:float The final position with which to move to
* @param {float} time:float The time to complete the move in
* @param {Hashtable} optional:Hashtable Hashtable where you can pass <a href="#optional">optional items</a>.
*/
public static function moveX(gameObject:GameObject, to:float, time:float, optional:Hashtable):int{
	return pushNewTween( gameObject, Vector3(to,0,0), time, TweenAction.MOVE_X, optional );
}
public static function moveX(gameObject:GameObject, to:float, time:float, optional:Object[]):int{
	return moveX( gameObject, to, time, h(optional) );
}

/**
* Move a GameObject along the y-axis
* 
* @method LeanTween.moveY
* @param {GameObject} gameObject:GameObject Gameobject that you wish to move
* @param {float} to:float The final position with which to move to
* @param {float} time:float The time to complete the move in
* @param {Hashtable} optional:Hashtable Hashtable where you can pass <a href="#optional">optional items</a>.
*/
public static function moveY(gameObject:GameObject, to:float, time:float, optional:Hashtable):int{
	return pushNewTween( gameObject, Vector3(to,0,0), time, TweenAction.MOVE_Y, optional );
}
public static function moveY(gameObject:GameObject, to:float, time:float, optional:Object[]):int{
	return moveY( gameObject, to, time, h(optional) );
}

/**
* Move a GameObject along the z-axis
* 
* @method LeanTween.moveZ
* @param {GameObject} gameObject:GameObject Gameobject that you wish to move
* @param {float} to:float The final position with which to move to
* @param {float} time:float The time to complete the move in
* @param {Hashtable} optional:Hashtable Hashtable where you can pass <a href="#optional">optional items</a>.
*/
public static function moveZ(gameObject:GameObject, to:float, time:float):int{
	return moveZ( gameObject, to, time, emptyHash );
}
public static function moveZ(gameObject:GameObject, to:float, time:float, optional:Hashtable):int{
	return pushNewTween( gameObject, Vector3(to,0,0), time, TweenAction.MOVE_Z, optional );
}
public static function moveZ(gameObject:GameObject, to:float, time:float, optional:Object[]):int{
	return moveZ( gameObject, to, time, h(optional) );
}

public static function move(gameObject:GameObject, to:Vector3, time:float):int{
	return move( gameObject, to, time, emptyHash );
}

/**
* Move a GameObject to a certain location
* 
* @method LeanTween.move
* @param {GameObject} gameObject:GameObject Gameobject that you wish to move
* @param {Vector3} to:Vector3 The final positin with which to move to
* @param {float} time:float The time to complete the tween in
* @param {Hashtable} optional:Hashtable Hashtable where you can pass <a href="#optional">optional items</a>.
* @return {int} Returns an integer id that is used to distinguish this tween
* @example
* <i>Javascript:</i><br>
* LeanTween.move(gameObject, Vector3(0,-3,5), 2.0, {"ease":LeanTween.easeOutQuad});<br><br>
* <i>C#:</i><br>
* Hashtable optional = new Hashtable();<br>
* optional.Add("ease":LeanTweenType.easeOutQuad);<br>
* LeanTween.move(gameObject, Vector3(0f,-3f,5f), 1.5f, optional);<br>
*/
public static function move(gameObject:GameObject, to:Vector3, time:float, optional:Hashtable):int{
	return pushNewTween( gameObject, to, time, TweenAction.MOVE, optional );
}

public static function move(gameObject:GameObject, to:Vector3, time:float, optional:Object[]):int{
	return move( gameObject, to, time, LeanTween.h( optional ) );
}


/**
* Move a GUI Element to a certain location
* 
* @method LeanTween.move (GUI)
* @param {LTRect} ltRect:LTRect LTRect object that you wish to move
* @param {Vector2} to:Vector2 The final position with which to move to (pixel coordinates)
* @param {float} time:float The time to complete the tween in
* @param {Hashtable} optional:Hashtable Hashtable where you can pass <a href="#optional">optional items</a>.
* @return {int} Returns an integer id that is used to distinguish this tween
*/
public static function move(ltRect:LTRect, to:Vector2, time:float, optional:Hashtable):int{
	init();
	if( optional == null )
		optional = new Hashtable();

	optional["rect"] = ltRect;
	return pushNewTween( tweenEmpty, to, time, TweenAction.GUI_MOVE, optional );
}

public static function move(ltRect:LTRect, to:Vector2, time:float, optional:Object[]):int{
	return move( ltRect, to, time, h(optional) );
}

/**
* Move a GUI Element to a certain location
* 
* @method LeanTween.move (GUI)
* @param {LTRect} ltRect:LTRect LTRect object that you wish to move
* @param {Vector2} to:Vector2 The final position with which to move to (pixel coordinates)
* @param {float} time:float The time to complete the tween in
* @return {int} Returns an integer id that is used to distinguish this tween
*/
public static function move(ltRect:LTRect, to:Vector2, time:float):int{
	return move( ltRect, to, time, emptyHash );
}

public static function moveLocal(gameObject:GameObject, to:Vector3, time:float):int{
	return moveLocal( gameObject, to, time, emptyHash );
}

/**
* Move a GameObject to a certain location relative to the parent transform. 
* 
* @method LeanTween.moveLocal
* @param {GameObject} gameObject:GameObject Gameobject that you wish to rotate
* @param {Vector3} to:Vector3 The final positin with which to move to
* @param {float} time:float The time to complete the tween in
* @param {Hashtable} optional:Hashtable Hashtable where you can pass <a href="#optional">optional items</a>.
* @return {int} Returns an integer id that is used to distinguish this tween
*/
public static function moveLocal(gameObject:GameObject, to:Vector3, time:float, optional:Hashtable):int{
	return pushNewTween( gameObject, to, time, TweenAction.MOVE_LOCAL, optional );
}
public static function moveLocal(gameObject:GameObject, to:Vector3, time:float, optional:Object[]):int{
	return moveLocal( gameObject, to, time, h(optional) );
}

public static function moveLocalX(gameObject:GameObject, to:float, time:float, optional:Hashtable):int{
	return pushNewTween( gameObject, Vector3(to,0,0), time, TweenAction.MOVE_LOCAL_X, optional );
}
public static function moveLocalX(gameObject:GameObject, to:float, time:float, optional:Object[]):int{
	return moveLocalX( gameObject, to, time, h(optional) );
}

public static function moveLocalY(gameObject:GameObject, to:float, time:float, optional:Hashtable):int{
	return pushNewTween( gameObject, Vector3(to,0,0), time, TweenAction.MOVE_LOCAL_Y, optional );
}
public static function moveLocalY(gameObject:GameObject, to:float, time:float, optional:Object[]):int{
	return moveLocalY( gameObject, to, time, h(optional) );
}

public static function moveLocalZ(gameObject:GameObject, to:float, time:float, optional:Hashtable):int{
	return pushNewTween( gameObject, Vector3(to,0,0), time, TweenAction.MOVE_LOCAL_Z, optional );
}
public static function moveLocalZ(gameObject:GameObject, to:float, time:float, optional:Object[]):int{
	return moveLocalZ( gameObject, to, time, h(optional) );
}

public static function scale(gameObject:GameObject, to:Vector3, time:float):int{
	return scale( gameObject, to, time, emptyHash );
}

/**
* Scale a GameObject to a certain size
* 
* @method LeanTween.scale
* @param {GameObject} gameObject:GameObject Gameobject that you wish to rotate
* @param {Vector3} to:Vector3 The size with which to tween to
* @param {float} time:float The time to complete the tween in
* @param {Hashtable} optional:Hashtable Hashtable where you can pass <a href="#optional">optional items</a>.
* @return {int} Returns an integer id that is used to distinguish this tween
*/
public static function scale(gameObject:GameObject, to:Vector3, time:float, optional:Hashtable):int{
	return pushNewTween( gameObject, to, time, TweenAction.SCALE, optional );
}

public static function scale(gameObject:GameObject, to:Vector3, time:float, optional:Object[]):int{
	return scale( gameObject, to, time, h(optional) );
}

/**
* Scale a GUI Element to a certain width and height
* 
* @method LeanTween.scale (GUI)
* @param {LTRect} ltRect:LTRect LTRect object that you wish to move
* @param {Vector2} to:Vector2 The final width and height to scale to (pixel based)
* @param {float} time:float The time to complete the tween in
* @param {Hashtable} optional:Hashtable Hashtable where you can pass <a href="#optional">optional items</a>.
* @return {int} Returns an integer id that is used to distinguish this tween
*/
public static function scale(ltRect:LTRect, to:Vector2, time:float, optional:Hashtable):int{
	init();
	if( optional == null )
		optional = new Hashtable();

	optional["rect"] = ltRect;
	return pushNewTween( tweenEmpty, to, time, TweenAction.GUI_SCALE, optional );
}

public static function scale(ltRect:LTRect, to:Vector2, time:float, optional:Object[]):int{
	return scale( ltRect, to, time, h(optional) );
}

/**
* Scale a GUI Element to a certain width and height
* 
* @method LeanTween.scale (GUI)
* @param {LTRect} ltRect:LTRect LTRect object that you wish to move
* @param {Vector2} to:Vector2 The final width and height to scale to (pixel based)
* @param {float} time:float The time to complete the tween in
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
public static function scale(ltRect:LTRect, to:Vector2, time:float):int{
	return scale( ltRect, to, time, emptyHash );
}

public static function alpha(ltRect:LTRect, to:float, time:float, optional:Hashtable):int{
	init();
	if( optional == null )
		optional = new Hashtable();

	ltRect.alphaEnabled = true;
	optional["rect"] = ltRect;
	return pushNewTween( tweenEmpty, Vector3(to,0,0), time, TweenAction.GUI_ALPHA, optional );
}
public static function alpha(ltRect:LTRect, to:float, time:float, optional:Object[]):int{
	return alpha( ltRect, to, time, h(optional) );
}

public static function scaleX(gameObject:GameObject, to:float, time:float):int{
	return scaleX( gameObject, to, time, emptyHash );
}
public static function scaleX(gameObject:GameObject, to:float, time:float, optional:Hashtable):int{
	return pushNewTween( gameObject, Vector3(to,0,0), time, TweenAction.SCALE_X, optional );
}
public static function scaleX(gameObject:GameObject, to:float, time:float, optional:Object[]):int{
	return scaleX( gameObject, to, time, h(optional) );
}

public static function scaleY(gameObject:GameObject, to:float, time:float):int{
	return scaleY( gameObject, to, time, emptyHash );
}
public static function scaleY(gameObject:GameObject, to:float, time:float, optional:Hashtable):int{
	return pushNewTween( gameObject, Vector3(to,0,0), time, TweenAction.SCALE_Y, optional );
}
public static function scaleY(gameObject:GameObject, to:float, time:float, optional:Object[]):int{
	return scaleY( gameObject, to, time, h(optional) );
}

public static function scaleZ(gameObject:GameObject, to:float, time:float):int{
	return scaleZ( gameObject, to, time, emptyHash );
}
public static function scaleZ(gameObject:GameObject, to:float, time:float, optional:Hashtable):int{
	return pushNewTween( gameObject, Vector3(to,0,0), time, TweenAction.SCALE_Z, optional );
}
public static function scaleZ(gameObject:GameObject, to:float, time:float, optional:Object[]):int{
	return scaleZ( gameObject, to, time, h(optional) );
}

/**
* Call a function after a certain amount of time has passed
* 
* @method LeanTween.delayedCall
* @param {float} delayTime:float The time with which to delay before calling the function
* @param {Function} callback:Function Function that is called after the certain amount of time.
* @return {int} Returns an integer id that is used to distinguish this tween
*/
public static function delayedCall( delayTime:float, callback:Function):int{
	return delayedCall( tweenEmpty, delayTime, callback, emptyHash );
}

public static function delayedCall( delayTime:float, callback:Function, optional:Hashtable ):int{
	return delayedCall( tweenEmpty, delayTime, callback, optional );
}
public static function delayedCall( delayTime:float, callback:Function, optional:Object[] ):int{
	return delayedCall( tweenEmpty, delayTime, callback, h(optional) );
}

/**
* Call a function after a certain amount of time has passed
* 
* @method LeanTween.delayedCall
* @param {GameObject} gameObject:GameObject Gameobject that you wish to tie this delayed function call to
* @param {float} delayTime:float The time with which to delay before calling the function
* @param {Function} callback:Function Function that is called after the certain amount of time.
* @return {int} Returns an integer id that is used to distinguish this tween
*/
public static function delayedCall( gameObject:GameObject, delayTime:float, callback:Function ):int{
	return delayedCall( gameObject, delayTime, callback, emptyHash );
}

/**
* Call a function after a certain amount of time has passed
* 
* @method LeanTween.delayedCall
* @param {GameObject} gameObject:GameObject Gameobject that you wish to tie this delayed function call to
* @param {float} delayTime:float The time with which to delay before calling the function
* @param {Function} callback:Function Function that is called after the certain amount of time.
* @param {Hashtable} optional:Hashtable Hashtable where you can pass <a href="#optional">optional items</a>.
* @return {int} Returns an integer id that is used to distinguish this tween
*/
public static function delayedCall( gameObject:GameObject, delayTime:float, callback:Function, optional:Hashtable ):int{
	if(optional==null || optional==emptyHash)
		optional = new Hashtable();
		
	optional["onComplete"] = callback;
	return pushNewTween( gameObject, Vector3.zero, delayTime, TweenAction.CALLBACK, optional );
}

/**
* Call a function after a certain amount of time has passed
* 
* @method LeanTween.delayedCall
* @param {GameObject} gameObject:GameObject Gameobject that you wish to call the Function on
* @param {float} delayTime:float The time with which to delay before calling the function
* @param {String} callback:String Function that is called after the certain amount of time.
* @return {int} Returns an integer id that is used to distinguish this tween
*/
public static function delayedCall( gameObject:GameObject, delayTime:float, callback:String):int{
	return delayedCall( gameObject, delayTime, callback, emptyHash );
}
/**
* Call a function after a certain amount of time has passed
* 
* @method LeanTween.delayedCall
* @param {GameObject} gameObject:GameObject Gameobject that you wish to call the Function on
* @param {float} delayTime:float The time with which to delay before calling the function
* @param {String} callback:String Function that is called after the certain amount of time.
* @param {Hashtable} optional:Hashtable Hashtable where you can pass <a href="#optional">optional items</a>.
* @return {int} Returns an integer id that is used to distinguish this tween
*/
public static function delayedCall( gameObject:GameObject, delayTime:float, callback:String, optional:Hashtable):int{
	if(optional==null || optional==emptyHash)
		optional = new Hashtable();
	optional["onComplete"] = callback;

	return pushNewTween( gameObject, Vector3.zero, delayTime, TweenAction.CALLBACK, optional );
}

public static function delayedCall( gameObject:GameObject, delayTime:float, callback:String, optional:Object[]):int{
	return delayedCall( gameObject, delayTime, callback, h(optional) );
}

/**
* Fade a gameobject's material to a certain alpha value. The material's shader needs to support alpha. <a href="http://owlchemylabs.com/content/">Owl labs has some excellent efficient shaders</a>.
* 
* @method LeanTween.alpha
* @param {GameObject} gameObject:GameObject Gameobject that you wish to rotate
* @param {float} to:float The time with which to delay before callin the function
* @param {float} time:float The time with which to delay before calling the function
* @param {Hashtable} optional:Hashtable Hashtable where you can pass <a href="#optional">optional items</a>.
* @return {int} Returns an integer id that is used to distinguish this tween
*/
public static function alpha(gameObject:GameObject, to:float, time:float, optional:Hashtable):int{
	return pushNewTween( gameObject, Vector3(to,0,0), time, TweenAction.ALPHA, optional );
}

public static function alpha(gameObject:GameObject, to:float, time:float, optional:Object[]):int{
	return alpha(gameObject, to, time, h(optional)); 
}

public static function alpha(gameObject:GameObject, to:float, time:float):int{ 
	return alpha(gameObject, to, time, emptyHash); 
}

/**
* This works by tweening the vertex colors directly.<br>
<br>
Vertex-based coloring is useful because you avoid making a copy of your
object's material for each instance that needs a different color.<br>
<br>
A shader that supports vertex colors is required for it to work
(for example the shaders in Mobile/Particles/)
* 
* @method LeanTween.alphaVertex
* @param {GameObject} gameObject:GameObject Gameobject that you wish to rotate
* @param {float} to:float The time with which to delay before callin the function
* @param {float} time:float The time with which to delay before calling the function
* @param {Hashtable} optional:Hashtable Hashtable where you can pass <a href="#optional">optional items</a>.
* @return {int} Returns an integer id that is used to distinguish this tween
*/
public static function alphaVertex(gameObject:GameObject, to:float, time:float, optional:Hashtable):int{
	return pushNewTween( gameObject, Vector3(to,0,0), time, TweenAction.ALPHA_VERTEX, optional );
}

public static function alphaVertex(gameObject:GameObject, to:float, time:float):int{
	return alphaVertex(gameObject,to,time,null);
}

// Tweening Functions - Thanks to Robert Penner and GFX47

private static function tweenOnCurve( tweenDescr:TweenDescr, ratioPassed:float ):float{
	return tweenDescr.from.x + (tweenDescr.to.x - tweenDescr.from.x) * tweenDescr.animationCurve.Evaluate(ratioPassed);
}

private static function tweenOnCurveVector( tweenDescr:TweenDescr, ratioPassed:float ):Vector3{
	return	new Vector3(tweenDescr.from.x + (tweenDescr.to.x-tweenDescr.from.x) * tweenDescr.animationCurve.Evaluate(ratioPassed),
						tweenDescr.from.y + (tweenDescr.to.y-tweenDescr.from.y) * tweenDescr.animationCurve.Evaluate(ratioPassed),
						tweenDescr.from.z + (tweenDescr.to.z-tweenDescr.from.z) * tweenDescr.animationCurve.Evaluate(ratioPassed) );
}

public static function easeOutQuadOpt( start:float, diff:float, ratioPassed:float ):float{
	return -diff * ratioPassed * (ratioPassed - 2) + start;
}

public static function easeInQuadOpt( start:float, diff:float, ratioPassed:float ):float{
	return diff * ratioPassed * ratioPassed + start;
}

public static function easeInOutQuadOpt( start:float, diff:float, ratioPassed:float ):float{
	ratioPassed /= .5f;
	if (ratioPassed < 1) return diff / 2 * ratioPassed * ratioPassed + start;
	ratioPassed--;
	return -diff / 2 * (ratioPassed * (ratioPassed - 2) - 1) + start;
}

public static function linear(start:float, end:float, val:float):float{
	return Mathf.Lerp(start, end, val);
}

public static function clerp(start:float, end:float, val:float):float{
	var min:float = 0.0f;
	var max:float = 360.0f;
	var half:float = Mathf.Abs((max - min) / 2.0f);
	var retval:float = 0.0f;
	var diff:float = 0.0f;
	if ((end - start) < -half){
		diff = ((max - start) + end) * val;
		retval = start + diff;
	}else if ((end - start) > half){
		diff = -((max - end) + start) * val;
		retval = start + diff;
	}else retval = start + (end - start) * val;
	return retval;
}

public static function spring(start:float, end:float, val:float):float{
	val = Mathf.Clamp01(val);
	val = (Mathf.Sin(val * Mathf.PI * (0.2f + 2.5f * val * val * val)) * Mathf.Pow(1f - val, 2.2f) + val) * (1f + (1.2f * (1f - val)));
	return start + (end - start) * val;
}

public static function easeInQuad(start:float, end:float, val:float):float{
	end -= start;
	return end * val * val + start;
}

public static function easeOutQuad(start:float, end:float, val:float):float{
	end -= start;
	return -end * val * (val - 2) + start;
}

public static function easeInOutQuad(start:float, end:float, val:float):float{
	val /= .5f;
	end -= start;
	if (val < 1) return end / 2 * val * val + start;
	val--;
	return -end / 2 * (val * (val - 2) - 1) + start;
}

public static function easeInCubic(start:float, end:float, val:float):float{
	end -= start;
	return end * val * val * val + start;
}

public static function easeOutCubic(start:float, end:float, val:float):float{
	val--;
	end -= start;
	return end * (val * val * val + 1) + start;
}

public static function easeInOutCubic(start:float, end:float, val:float):float{
	val /= .5f;
	end -= start;
	if (val < 1) return end / 2 * val * val * val + start;
	val -= 2;
	return end / 2 * (val * val * val + 2) + start;
}

public static function easeInQuart(start:float, end:float, val:float):float{
	end -= start;
	return end * val * val * val * val + start;
}

public static function easeOutQuart(start:float, end:float, val:float):float{
	val--;
	end -= start;
	return -end * (val * val * val * val - 1) + start;
}

public static function easeInOutQuart(start:float, end:float, val:float):float{
	val /= .5f;
	end -= start;
	if (val < 1) return end / 2 * val * val * val * val + start;
	val -= 2;
	return -end / 2 * (val * val * val * val - 2) + start;
}

public static function easeInQuint(start:float, end:float, val:float):float{
	end -= start;
	return end * val * val * val * val * val + start;
}

public static function easeOutQuint(start:float, end:float, val:float):float{
	val--;
	end -= start;
	return end * (val * val * val * val * val + 1) + start;
}

public static function easeInOutQuint(start:float, end:float, val:float):float{
	val /= .5f;
	end -= start;
	if (val < 1) return end / 2 * val * val * val * val * val + start;
	val -= 2;
	return end / 2 * (val * val * val * val * val + 2) + start;
}

public static function easeInSine(start:float, end:float, val:float):float{
	end -= start;
	return -end * Mathf.Cos(val / 1 * (Mathf.PI / 2)) + end + start;
}

public static function easeOutSine(start:float, end:float, val:float):float{
	end -= start;
	return end * Mathf.Sin(val / 1 * (Mathf.PI / 2)) + start;
}

public static function easeInOutSine(start:float, end:float, val:float):float{
	end -= start;
	return -end / 2 * (Mathf.Cos(Mathf.PI * val / 1) - 1) + start;
}

public static function easeInExpo(start:float, end:float, val:float):float{
	end -= start;
	return end * Mathf.Pow(2, 10 * (val / 1 - 1)) + start;
}

public static function easeOutExpo(start:float, end:float, val:float):float{
	end -= start;
	return end * (-Mathf.Pow(2, -10 * val / 1) + 1) + start;
}

public static function easeInOutExpo(start:float, end:float, val:float):float{
	val /= .5f;
	end -= start;
	if (val < 1) return end / 2 * Mathf.Pow(2, 10 * (val - 1)) + start;
	val--;
	return end / 2 * (-Mathf.Pow(2, -10 * val) + 2) + start;
}

public static function easeInCirc(start:float, end:float, val:float):float{
	end -= start;
	return -end * (Mathf.Sqrt(1 - val * val) - 1) + start;
}

public static function easeOutCirc(start:float, end:float, val:float):float{
	val--;
	end -= start;
	return end * Mathf.Sqrt(1 - val * val) + start;
}

public static function easeInOutCirc(start:float, end:float, val:float):float{
	val /= .5f;
	end -= start;
	if (val < 1) return -end / 2 * (Mathf.Sqrt(1 - val * val) - 1) + start;
	val -= 2;
	return end / 2 * (Mathf.Sqrt(1 - val * val) + 1) + start;
}

/* GFX47 MOD START */
public static function easeInBounce(start:float, end:float, val:float):float{
	end -= start;
	var d:float = 1f;
	return end - easeOutBounce(0, end, d-val) + start;
}
/* GFX47 MOD END */

/* GFX47 MOD START */
//public static function bounce(start:float, end:float, val:float):float{
public static function easeOutBounce(start:float, end:float, val:float):float{
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
public static function easeInOutBounce(start:float, end:float, val:float):float{
	end -= start;
	var d:float = 1f;
	if (val < d/2) return easeInBounce(0, end, val*2) * 0.5f + start;
	else return easeOutBounce(0, end, val*2-d) * 0.5f + end*0.5f + start;
}
/* GFX47 MOD END */

public static function easeInBack(start:float, end:float, val:float):float{
	end -= start;
	val /= 1;
	var s:float = 1.70158f;
	return end * (val) * val * ((s + 1) * val - s) + start;
}

public static function easeOutBack(start:float, end:float, val:float):float{
	var s:float = 1.70158f;
	end -= start;
	val = (val / 1) - 1;
	return end * ((val) * val * ((s + 1) * val + s) + 1) + start;
}

public static function easeInOutBack(start:float, end:float, val:float):float{
	var s:float = 1.70158f;
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
public static function easeInElastic(start:float, end:float, val:float):float{
	end -= start;
	
	var d:float = 1f;
	var p:float = d * .3f;
	var s:float = 0;
	var a:float = 0;
	
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
//public static function elastic(start:float, end:float, val:float):float{
public static function easeOutElastic(start:float, end:float, val:float):float{
/* GFX47 MOD END */
	//Thank you to rafael.marteleto for fixing this as a port over from Pedro's UnityTween
	end -= start;
	
	var d:float = 1f;
	var p:float = d * .3f;
	var s:float = 0;
	var a:float = 0;
	
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
public static function easeInOutElastic(start:float, end:float, val:float):float{
	end -= start;
	
	var d:float = 1f;
	var p:float = d * .3f;
	var s:float = 0;
	var a:float = 0;
	
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
