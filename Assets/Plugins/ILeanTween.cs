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
	ILTDescr descr( int uniqueId );
	ILTDescr description( int uniqueId );
	ILTDescr[] descriptions(GameObject gameObject = null);
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
	ILTDescr options(ILTDescr seed);
	ILTDescr options();
	GameObject tweenEmpty { get; }
	ILTDescr alpha(GameObject gameObject, float to, float time);
	ILTDescr alpha(LTRect ltRect, float to, float time);
	ILTDescr alphaVertex(GameObject gameObject, float to, float time);
	ILTDescr color(GameObject gameObject, Color to, float time);
	ILTDescr delayedCall( float delayTime, Action callback);
	ILTDescr delayedCall( float delayTime, Action<object> callback);
	ILTDescr delayedCall( GameObject gameObject, float delayTime, Action callback);
	ILTDescr delayedCall( GameObject gameObject, float delayTime, Action<object> callback);
	ILTDescr destroyAfter( LTRect rect, float delayTime);
	ILTDescr move(GameObject gameObject, Vector3 to, float time);
	ILTDescr move(GameObject gameObject, Vector2 to, float time);
	ILTDescr move(GameObject gameObject, Vector3[] to, float time);
	ILTDescr move(GameObject gameObject, LTBezierPath to, float time);
	ILTDescr move(GameObject gameObject, LTSpline to, float time);
	ILTDescr moveSpline(GameObject gameObject, Vector3[] to, float time);
	ILTDescr moveSplineLocal(GameObject gameObject, Vector3[] to, float time);
	ILTDescr move(LTRect ltRect, Vector2 to, float time);
	ILTDescr moveMargin(LTRect ltRect, Vector2 to, float time);
	ILTDescr moveX(GameObject gameObject, float to, float time);
	ILTDescr moveY(GameObject gameObject, float to, float time);
	ILTDescr moveZ(GameObject gameObject, float to, float time);
	ILTDescr moveLocal(GameObject gameObject, Vector3 to, float time);
	ILTDescr moveLocal(GameObject gameObject, Vector3[] to, float time);
	ILTDescr moveLocalX(GameObject gameObject, float to, float time);
	ILTDescr moveLocalY(GameObject gameObject, float to, float time);
	ILTDescr moveLocalZ(GameObject gameObject, float to, float time);
	ILTDescr moveLocal(GameObject gameObject, LTBezierPath to, float time);
	ILTDescr moveLocal(GameObject gameObject, LTSpline to, float time);
	ILTDescr move(GameObject gameObject, Transform to, float time);
	ILTDescr rotate(GameObject gameObject, Vector3 to, float time);
	ILTDescr rotate(LTRect ltRect, float to, float time);
	ILTDescr rotateLocal(GameObject gameObject, Vector3 to, float time);
	ILTDescr rotateX(GameObject gameObject, float to, float time);
	ILTDescr rotateY(GameObject gameObject, float to, float time);
	ILTDescr rotateZ(GameObject gameObject, float to, float time);
	ILTDescr rotateAround(GameObject gameObject, Vector3 axis, float add, float time);
	ILTDescr rotateAroundLocal(GameObject gameObject, Vector3 axis, float add, float time);
	ILTDescr scale(GameObject gameObject, Vector3 to, float time);
	ILTDescr scale(LTRect ltRect, Vector2 to, float time);
	ILTDescr scaleX(GameObject gameObject, float to, float time);
	ILTDescr scaleY(GameObject gameObject, float to, float time);
	ILTDescr scaleZ(GameObject gameObject, float to, float time);
	ILTDescr value(GameObject gameObject, float from, float to, float time);
	ILTDescr value(GameObject gameObject, Vector2 from, Vector2 to, float time);
	ILTDescr value(GameObject gameObject, Vector3 from, Vector3 to, float time);
	ILTDescr value(GameObject gameObject, Color from, Color to, float time);
	ILTDescr value(GameObject gameObject, Action<float> callOnUpdate, float from, float to, float time);
	ILTDescr value(GameObject gameObject, Action<float, float> callOnUpdateRatio, float from, float to, float time);
	ILTDescr value(GameObject gameObject, Action<Color> callOnUpdate, Color from, Color to, float time);
	ILTDescr value(GameObject gameObject, Action<Vector2> callOnUpdate, Vector2 from, Vector2 to, float time);
	ILTDescr value(GameObject gameObject, Action<Vector3> callOnUpdate, Vector3 from, Vector3 to, float time);
	ILTDescr value(GameObject gameObject, Action<float,object> callOnUpdate, float from, float to, float time);
	ILTDescr delayedSound( AudioClip audio, Vector3 pos, float volume );
	ILTDescr delayedSound( GameObject gameObject, AudioClip audio, Vector3 pos, float volume );

		
	#if !UNITY_3_5 && !UNITY_4_0 && !UNITY_4_0_1 && !UNITY_4_1 && !UNITY_4_2 && !UNITY_4_3 && !UNITY_4_5
	ILTDescr play(RectTransform rectTransform, UnityEngine.Sprite[] sprites);
	ILTDescr textAlpha(RectTransform rectTransform, float to, float time);
	ILTDescr textColor(RectTransform rectTransform, Color to, float time);
	ILTDescr move(RectTransform rectTrans, Vector3 to, float time);
	ILTDescr moveX(RectTransform rectTrans, float to, float time);
	ILTDescr moveY(RectTransform rectTrans, float to, float time);
	ILTDescr moveZ(RectTransform rectTrans, float to, float time);
	ILTDescr rotate(RectTransform rectTrans, float to, float time);
	ILTDescr rotateAround(RectTransform rectTrans, Vector3 axis, float to, float time);
	ILTDescr rotateAroundLocal(RectTransform rectTrans, Vector3 axis, float to, float time);
	ILTDescr scale(RectTransform rectTrans, Vector3 to, float time);
	ILTDescr alpha(RectTransform rectTrans, float to, float time);
	ILTDescr color(RectTransform rectTrans, Color to, float time);
	#endif
}

