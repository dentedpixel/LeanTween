using System;
using UnityEngine;

public interface ILeanTween
{
	void removeTween( int i, int uniqueId);
	void removeTween( int i );
	Vector3[] add(Vector3[] a, Vector3 b);
	float closestRot( float from, float to );
	void cancelAll();
	void cancelAll(bool callComplete);
	void cancel( GameObject gameObject );
	void cancel( GameObject gameObject, bool callOnComplete );
	void cancel( GameObject gameObject, int uniqueId );
	void cancel( LTRect ltRect, int uniqueId );
	void cancel( int uniqueId );
	void cancel( int uniqueId, bool callOnComplete );
	LTDescr descr( int uniqueId );
	LTDescr description( int uniqueId );
	LTDescr[] descriptions(GameObject gameObject = null);
	void pause( int uniqueId );
	void pause( GameObject gameObject );
	void pauseAll();
	void resumeAll();
	void resume( int uniqueId );
	void resume( GameObject gameObject );
	bool isTweening( GameObject gameObject = null );
	bool isTweening( int uniqueId );
	bool isTweening( LTRect ltRect );
	void drawBezierPath(Vector3 a, Vector3 b, Vector3 c, Vector3 d, float arrowSize = 0.0f, Transform arrowTransform = null);
	LTDescr options(LTDescr seed);
	LTDescr options();
	GameObject tweenEmpty { get; }
	LTDescr alpha(GameObject gameObject, float to, float time);
	LTDescr alpha(LTRect ltRect, float to, float time);
	LTDescr alphaVertex(GameObject gameObject, float to, float time);
	LTDescr color(GameObject gameObject, Color to, float time);
	LTDescr delayedCall( float delayTime, Action callback);
	LTDescr delayedCall( float delayTime, Action<object> callback);
	LTDescr delayedCall( GameObject gameObject, float delayTime, Action callback);
	LTDescr delayedCall( GameObject gameObject, float delayTime, Action<object> callback);
	LTDescr destroyAfter( LTRect rect, float delayTime);
	LTDescr move(GameObject gameObject, Vector3 to, float time);
	LTDescr move(GameObject gameObject, Vector2 to, float time);
	LTDescr move(GameObject gameObject, Vector3[] to, float time);
	LTDescr move(GameObject gameObject, LTBezierPath to, float time);
	LTDescr move(GameObject gameObject, LTSpline to, float time);
	LTDescr moveSpline(GameObject gameObject, Vector3[] to, float time);
	LTDescr moveSplineLocal(GameObject gameObject, Vector3[] to, float time);
	LTDescr move(LTRect ltRect, Vector2 to, float time);
	LTDescr moveMargin(LTRect ltRect, Vector2 to, float time);
	LTDescr moveX(GameObject gameObject, float to, float time);
	LTDescr moveY(GameObject gameObject, float to, float time);
	LTDescr moveZ(GameObject gameObject, float to, float time);
	LTDescr moveLocal(GameObject gameObject, Vector3 to, float time);
	LTDescr moveLocal(GameObject gameObject, Vector3[] to, float time);
	LTDescr moveLocalX(GameObject gameObject, float to, float time);
	LTDescr moveLocalY(GameObject gameObject, float to, float time);
	LTDescr moveLocalZ(GameObject gameObject, float to, float time);
	LTDescr moveLocal(GameObject gameObject, LTBezierPath to, float time);
	LTDescr moveLocal(GameObject gameObject, LTSpline to, float time);
	LTDescr move(GameObject gameObject, Transform to, float time);
	LTDescr rotate(GameObject gameObject, Vector3 to, float time);
	LTDescr rotate(LTRect ltRect, float to, float time);
	LTDescr rotateLocal(GameObject gameObject, Vector3 to, float time);
	LTDescr rotateX(GameObject gameObject, float to, float time);
	LTDescr rotateY(GameObject gameObject, float to, float time);
	LTDescr rotateZ(GameObject gameObject, float to, float time);
	LTDescr rotateAround(GameObject gameObject, Vector3 axis, float add, float time);
	LTDescr rotateAroundLocal(GameObject gameObject, Vector3 axis, float add, float time);
	LTDescr scale(GameObject gameObject, Vector3 to, float time);
	LTDescr scale(LTRect ltRect, Vector2 to, float time);
	LTDescr scaleX(GameObject gameObject, float to, float time);
	LTDescr scaleY(GameObject gameObject, float to, float time);
	LTDescr scaleZ(GameObject gameObject, float to, float time);
	LTDescr value(GameObject gameObject, float from, float to, float time);
	LTDescr value(GameObject gameObject, Vector2 from, Vector2 to, float time);
	LTDescr value(GameObject gameObject, Vector3 from, Vector3 to, float time);
	LTDescr value(GameObject gameObject, Color from, Color to, float time);
	LTDescr value(GameObject gameObject, Action<float> callOnUpdate, float from, float to, float time);
	LTDescr value(GameObject gameObject, Action<float, float> callOnUpdateRatio, float from, float to, float time);
	LTDescr value(GameObject gameObject, Action<Color> callOnUpdate, Color from, Color to, float time);
	LTDescr value(GameObject gameObject, Action<Vector2> callOnUpdate, Vector2 from, Vector2 to, float time);
	LTDescr value(GameObject gameObject, Action<Vector3> callOnUpdate, Vector3 from, Vector3 to, float time);
	LTDescr value(GameObject gameObject, Action<float,object> callOnUpdate, float from, float to, float time);
	LTDescr delayedSound( AudioClip audio, Vector3 pos, float volume );
	LTDescr delayedSound( GameObject gameObject, AudioClip audio, Vector3 pos, float volume );

		
	#if !UNITY_3_5 && !UNITY_4_0 && !UNITY_4_0_1 && !UNITY_4_1 && !UNITY_4_2 && !UNITY_4_3 && !UNITY_4_5
	LTDescr play(RectTransform rectTransform, UnityEngine.Sprite[] sprites);
	LTDescr textAlpha(RectTransform rectTransform, float to, float time);
	LTDescr textColor(RectTransform rectTransform, Color to, float time);
	LTDescr move(RectTransform rectTrans, Vector3 to, float time);
	LTDescr moveX(RectTransform rectTrans, float to, float time);
	LTDescr moveY(RectTransform rectTrans, float to, float time);
	LTDescr moveZ(RectTransform rectTrans, float to, float time);
	LTDescr rotate(RectTransform rectTrans, float to, float time);
	LTDescr rotateAround(RectTransform rectTrans, Vector3 axis, float to, float time);
	LTDescr rotateAroundLocal(RectTransform rectTrans, Vector3 axis, float to, float time);
	LTDescr scale(RectTransform rectTrans, Vector3 to, float time);
	LTDescr alpha(RectTransform rectTrans, float to, float time);
	LTDescr color(RectTransform rectTrans, Color to, float time);
	#endif
}

