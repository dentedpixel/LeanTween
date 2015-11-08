using System;
using UnityEngine;


public interface ILTDescr
{
	bool toggle { get; set; }
	bool useEstimatedTime { get; set; }
	bool useFrames { get; set; }
	bool useManualTime { get; set; }
	bool hasInitiliazed { get; set; }
	bool hasPhysics { get; set; }
	bool onCompleteOnRepeat { get; set; }
	bool onCompleteOnStart { get; set; }
	float passed { get; set; }
	float delay { get; set; }
	float time { get; set; }
	float lastVal { get; set; }
	int loopCount { get; set; }
	uint counter { get; set; }
	float direction { get; set; }
	float directionLast { get; set; }
	float overshoot { get; set; }
	float period { get; set; }
	bool destroyOnComplete { get; set; }
	Transform trans { get; set; }
	Transform toTrans { get; set; }
	LTRect ltRect { get; set; }
	Vector3 from { get; set; }
	Vector3 to { get; set; }
	Vector3 diff { get; set; }
	Vector3 point { get; set; }
	Vector3 axis { get; set; }
	Quaternion origRotation { get; set; }
	LTBezierPath path { get; set; }
	LTSpline spline { get; set; }
	TweenAction type { get; set; }
	LeanTweenType tweenType { get; set; }
	AnimationCurve animationCurve { get; set; }
	LeanTweenType loopType { get; set; }
	bool hasUpdateCallback { get; set; }
	Action<float> onUpdateFloat { get; set; }
    Action<float,float> onUpdateFloatRatio { get; set; }
	Action<float,object> onUpdateFloatObject { get; set; }
	Action<Vector2> onUpdateVector2 { get; set; }
	Action<Vector3> onUpdateVector3 { get; set; }
	Action<Vector3,object> onUpdateVector3Object { get; set; }
	Action<Color> onUpdateColor { get; set; }
	Action onComplete { get; set; }
	Action<object> onCompleteObject { get; set; }
	object onCompleteParam { get; set; }
	object onUpdateParam { get; set; }
	Action onStart { get; set; }

	ILTDescr cancel(UnityEngine.GameObject gameObject);
	void cleanup();
	int id { get; }
	void init();
	ILTDescr pause();
	void reset();
	ILTDescr resume();
	ILTDescr setAudio(object audio);
	ILTDescr setAxis(UnityEngine.Vector3 axis);
	ILTDescr setDelay(float delay);
	ILTDescr setDestroyOnComplete(bool doesDestroy);
	ILTDescr setDiff(UnityEngine.Vector3 diff);
	ILTDescr setDirection(float direction);
	ILTDescr setEase(LeanTweenType easeType);
	ILTDescr setEase(UnityEngine.AnimationCurve easeCurve);
	ILTDescr setFrameRate(float frameRate);
	ILTDescr setFrom(float from);
	ILTDescr setFrom(UnityEngine.Vector3 from);
	ILTDescr setFromColor(UnityEngine.Color col);
	ILTDescr setHasInitialized(bool has);
	ILTDescr setId(uint id);
	ILTDescr setIgnoreTimeScale(bool useUnScaledTime);
	ILTDescr setLoopClamp();
	ILTDescr setLoopClamp(int loops);
	ILTDescr setLoopCount(int loopCount);
	ILTDescr setLoopOnce();
	ILTDescr setLoopPingPong();
	ILTDescr setLoopPingPong(int loops);
	ILTDescr setLoopType(LeanTweenType loopType);
	ILTDescr setOnComplete(Action onComplete);
	ILTDescr setOnComplete(Action<object> onComplete);
	ILTDescr setOnComplete(Action<object> onComplete, object onCompleteParam);
	ILTDescr setOnCompleteOnRepeat(bool isOn);
	ILTDescr setOnCompleteOnStart(bool isOn);
	ILTDescr setOnCompleteParam(object onCompleteParam);
	ILTDescr setOnStart(Action onStart);
	ILTDescr setOnUpdate(Action<float, object> onUpdate, object onUpdateParam = null);
	ILTDescr setOnUpdate(Action<float> onUpdate);
	ILTDescr setOnUpdate(Action<UnityEngine.Color> onUpdate);
	ILTDescr setOnUpdate(Action<UnityEngine.Vector2> onUpdate, object onUpdateParam = null);
	ILTDescr setOnUpdate(Action<UnityEngine.Vector3, object> onUpdate, object onUpdateParam = null);
	ILTDescr setOnUpdate(Action<UnityEngine.Vector3> onUpdate, object onUpdateParam = null);
	ILTDescr setOnUpdateColor(Action<UnityEngine.Color> onUpdate);
	ILTDescr setOnUpdateObject(Action<float, object> onUpdate);
	ILTDescr setOnUpdateParam(object onUpdateParam);
	ILTDescr setOnUpdateRatio(Action<float, float> onUpdate);
	ILTDescr setOnUpdateVector2(Action<UnityEngine.Vector2> onUpdate);
	ILTDescr setOnUpdateVector3(Action<UnityEngine.Vector3> onUpdate);
	ILTDescr setOrientToPath(bool doesOrient);
	ILTDescr setOrientToPath2d(bool doesOrient2d);
	ILTDescr setOvershoot(float overshoot);
	ILTDescr setPath(LTBezierPath path);
	ILTDescr setPeriod(float period);
	ILTDescr setPoint(UnityEngine.Vector3 point);
	ILTDescr setRect(LTRect rect);
	ILTDescr setRect(UnityEngine.Rect rect);
	ILTDescr setRect(UnityEngine.RectTransform rect);
	ILTDescr setRepeat(int repeat);
	ILTDescr setSprites(UnityEngine.Sprite[] sprites);
	ILTDescr setTime(float time);
	ILTDescr setTo(UnityEngine.Transform to);
	ILTDescr setTo(UnityEngine.Vector3 to);
	ILTDescr setUseEstimatedTime(bool useEstimatedTime);
	ILTDescr setUseFrames(bool useFrames);
	ILTDescr setUseManualTime(bool useManualTime);
	string ToString();
	int uniqueId { get; }
}

