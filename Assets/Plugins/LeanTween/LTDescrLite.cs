using UnityEngine;
using System;
using System.Collections;
using System.Collections.Generic;

public class LTDescrLite {
	public bool toggle;
	public float ratioPassed;
	public float passed;
	public float delay;
	public float time;
	public float speed;
	private uint _id;
	public int loopCount;
	public uint counter;
	public float direction;
	public Transform trans;
	public Vector3 to;
	public bool hasInitiliazed;
	public Vector3 diff;
	public Vector3 from;

	public TweenAction type;
	public LeanTweenType tweenType;
	public LeanTweenType loopType;

	public EaseTypeDelegate easeMethod;
	public ActionMethodDelegate easeInternal;
	public delegate Vector3 EaseTypeDelegate();
	public delegate void ActionMethodDelegate();

	#if !UNITY_3_5 && !UNITY_4_0 && !UNITY_4_0_1 && !UNITY_4_1 && !UNITY_4_2
	public SpriteRenderer spriteRen { get; set; }
	#endif

	#if LEANTWEEN_1
	public Hashtable optional;
	#endif
	#if !UNITY_3_5 && !UNITY_4_0 && !UNITY_4_0_1 && !UNITY_4_1 && !UNITY_4_2 && !UNITY_4_3 && !UNITY_4_5
	public RectTransform rectTransform;
	public UnityEngine.UI.Text uiText;
	public UnityEngine.UI.Image uiImage;
	public UnityEngine.Sprite[] sprites;
	#endif

	public LTDescrOptional optional = new LTDescrOptional();

	private static uint global_counter = 0;

	public static float dt;
	private static bool isTweenFinished;
	private static bool usesNormalDt = true;

	public LTDescrLite setTo( Vector3 to ){
		this.to = to;
		return this;
	}

	public LTDescrLite setEaseInOutQuad(){
		this.easeMethod = easeInOutQuadInternal;
		this.tweenType = LeanTweenType.easeInOutQuad;
		return this;
	}

	public LTDescrLite setLoopType( LeanTweenType loopType ){
		this.loopType = loopType;
		return this;
	}

	public LTDescrLite setRepeat( int repeat ){
		this.loopCount = repeat;
		if((repeat>1 && this.loopType == LeanTweenType.once) || (repeat < 0 && this.loopType == LeanTweenType.once)){
			this.loopType = LeanTweenType.clamp;
		}
//		if(this.type==TweenAction.CALLBACK || this.type==TweenAction.CALLBACK_COLOR){
//			this.setOnCompleteOnRepeat(true);
//		}
		return this;
	}

	public LTDescrLite setDelay( float delay ){
		this.delay = delay;

		return this;
	}

	public override string ToString(){
		return (trans!=null ? "gameObject:"+trans.gameObject : "gameObject:null")+" toggle:"+toggle+" passed:"+passed+" time:"+time+" delay:"+delay+" direction:"+direction+" from:"+from+" to:"+to+" type:"+type+" ease:"+tweenType+" id:"+_id+" hasInitiliazed:"+hasInitiliazed;
	}

	private void moveInternal(){
//		val = ratioPassed;
//		val /= .5f;
//
//		if (val < 1f) {
//			val = val * val;
//			trans.position = new Vector3( this.diff.x * val + this.from.x, this.diff.y * val + this.from.y, this.diff.z * val + this.from.z);
//			return;
//		}
//		val = (val-1f) * (val - 3f) - 1f;
//		trans.position = new Vector3( -this.diff.x * val + this.from.x, -this.diff.y * val + this.from.y, -this.diff.z * val + this.from.z);
		trans.position = easeMethod();
//				Debug.Log("trans.position x:"+trans.position.x+" y:"+trans.position.y+" z:"+trans.position.z);
		//		Debug.Log("diffDiv2 x:"+this.diffDiv2.x+" y:"+this.diffDiv2.y+" z:"+this.diffDiv2.z);
	}

	public static float val;

	private Vector3 easeInOutQuadInternal(){
		val = ratioPassed;
		val /= .5f;

		if (val < 1f) {
			val = val * val;
			return new Vector3( this.diff.x * val + this.from.x, this.diff.y * val + this.from.y, this.diff.z * val + this.from.z);
		}
		val = (val-1f) * (val - 3f) - 1f;
		return new Vector3( -this.diff.x * val + this.from.x, -this.diff.y * val + this.from.y, -this.diff.z * val + this.from.z);

	}
	public void reset(){
		this.toggle = true;
		this.direction = 1f;
		this.hasInitiliazed = false;
	}

	public LTDescrLite setId( uint id ){
		this._id = id;
		this.counter = global_counter;
		// Debug.Log("Global counter:"+global_counter);
		return this;
	}

	public void init(){
		this.hasInitiliazed = true;

		if(this.type==TweenAction.MOVE){
			this.from = trans.position;
			this.easeInternal = moveInternal;

			this.diff = this.to - this.from;
			if(this.tweenType==LeanTweenType.easeInOutQuad){
				this.diff = this.diff * 0.5f;
			}
		}
	}

	public bool update2(){
		isTweenFinished = false;

		if(usesNormalDt){
			dt = LeanTween.dtActual;
		}
//		else if( this.useEstimatedTime ){
//			dt = LeanTween.dtEstimated;
//		}else if( this.useFrames ){
//			dt = 1;
//		}else if( this.useManualTime ){
//			dt = LeanTween.dtManual;
//		}else if(this.direction==0f){
//			dt = 0f;
//		}

		// check to see if delay has shrunk enough
//		if(dt!=0f){
			if(this.delay<=0f){
				// initialize if has not done so yet
				if(!this.hasInitiliazed)
					this.init();

//				Debug.Log("this;"+this);
				this.passed += dt*this.direction;
				if(this.direction>0f){
					isTweenFinished = this.passed>=this.time;
				}else{
					isTweenFinished = this.passed<=0f;
				}
				this.ratioPassed = isTweenFinished ? Mathf.Clamp01(this.passed / this.time) : this.passed / this.time; // need to clamp when finished so it will finish at the exact spot and not overshoot
//				Debug.Log("ratioPassed:"+ratioPassed+" isTweenFinished:"+isTweenFinished);
				this.easeInternal();

//				if(this.hasUpdateCallback){
//					if(this.onUpdateFloat!=null){
//						this.onUpdateFloat(val);
//					}
//					if (this.onUpdateFloatRatio != null){
//						this.onUpdateFloatRatio(val,ratioPassed);
//					}else if(this.onUpdateFloatObject!=null){
//						this.onUpdateFloatObject(val, this.onUpdateParam);
//					}else if(this.onUpdateVector3Object!=null){
//						this.onUpdateVector3Object(newVect, this.onUpdateParam);
//					}else if(this.onUpdateVector3!=null){
//						this.onUpdateVector3(newVect);
//					}else if(this.onUpdateVector2!=null){
//						this.onUpdateVector2(new Vector2(newVect.x,newVect.y));
//					}
//				}

				if(isTweenFinished){
					this.loopCount--;
					this.direction = 0f - this.direction;
				}
			}else{
				this.delay -= dt;
				// Debug.Log("dt:"+dt+" tween:"+i+" tween:"+tween);
				//			if(this.delay<0f){
				//				this.passed = 0.0f;//-tween.delay
				//				this.delay = 0.0f;
				//			}
			}
//		}

		return isTweenFinished;
	}
}
