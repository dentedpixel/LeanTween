using System;
using UnityEngine;

public class LeanTweenImpl : ILeanTween
{

	public void removeTween(int i, int uniqueId)
	{
		LeanTween.removeTween(i, uniqueId);
	}

	public void removeTween(int i)
	{
		LeanTween.removeTween(i);
	}

	public Vector3[] add(Vector3[] a, Vector3 b)
	{
		return LeanTween.add(a, b);
	}

	public float closestRot(float from, float to)
	{
		return LeanTween.closestRot(from, to);
	}

	public void cancelAll()
	{
		LeanTween.cancelAll();
	}

	public void cancelAll(bool callComplete)
	{
		LeanTween.cancelAll(callComplete);
	}

	public void cancel(GameObject gameObject)
	{
		LeanTween.cancel(gameObject);
	}

	public void cancel(GameObject gameObject, bool callOnComplete)
	{
		LeanTween.cancel(gameObject, callOnComplete);
	}

	public void cancel(GameObject gameObject, int uniqueId)
	{
		LeanTween.cancel(gameObject, uniqueId);
	}

	public void cancel(LTRect ltRect, int uniqueId)
	{
		LeanTween.cancel(ltRect, uniqueId);
	}

	public void cancel(int uniqueId)
	{
		LeanTween.cancel(uniqueId);
	}

	public void cancel(int uniqueId, bool callOnComplete)
	{
		LeanTween.cancel(uniqueId, callOnComplete);
	}

	public LTDescr descr(int uniqueId)
	{
		return LeanTween.descr(uniqueId);
	}

	public LTDescr description(int uniqueId)
	{
		return LeanTween.description(uniqueId);
	}

	public LTDescr[] descriptions(GameObject gameObject = null)
	{
		return LeanTween.descriptions(gameObject);
	}

	public void pause(int uniqueId)
	{
		LeanTween.pause(uniqueId);
	}

	public void pause(GameObject gameObject)
	{
		LeanTween.pause(gameObject);
	}

	public void pauseAll()
	{
		LeanTween.pauseAll();
	}

	public void resumeAll()
	{
		LeanTween.resumeAll();
	}

	public void resume(int uniqueId)
	{
		LeanTween.resume(uniqueId);
	}

	public void resume(GameObject gameObject)
	{
		LeanTween.resume(gameObject);
	}

	public bool isTweening(GameObject gameObject = null)
	{
		return LeanTween.isTweening(gameObject);
	}

	public bool isTweening(int uniqueId)
	{
		return LeanTween.isTweening(uniqueId);
	}

	public bool isTweening(LTRect ltRect)
	{
		return LeanTween.isTweening(ltRect);
	}

	public void drawBezierPath(Vector3 a, Vector3 b, Vector3 c, Vector3 d, float arrowSize = 0.0f, Transform arrowTransform = null)
	{
		LeanTween.drawBezierPath(a, b, c, d, arrowSize, arrowTransform);
	}


	public LTDescr options(LTDescr seed)
	{
		return LeanTween.options(seed);
	}

	public LTDescr options()
	{
		return LeanTween.options();
	}

	public GameObject tweenEmpty
	{
		get { return LeanTween.tweenEmpty; }
	}

	public LTDescr alpha(GameObject gameObject, float to, float time)
	{
		return LeanTween.alpha(gameObject, to, time);
	}

	public LTDescr alpha(LTRect ltRect, float to, float time)
	{
		return LeanTween.alpha(ltRect, to, time);
	}

	public LTDescr alphaVertex(GameObject gameObject, float to, float time)
	{
		return LeanTween.alpha(gameObject, to, time);
	}

	public LTDescr color(GameObject gameObject, Color to, float time)
	{
		return LeanTween.color(gameObject, to, time);
	}

	public LTDescr delayedCall(float delayTime, Action callback)
	{
		return LeanTween.delayedCall(delayTime, callback);
	}

	public LTDescr delayedCall(float delayTime, Action<object> callback)
	{
		return LeanTween.delayedCall(delayTime, callback);
	}

	public LTDescr delayedCall(GameObject gameObject, float delayTime, Action callback)
	{
		return LeanTween.delayedCall(gameObject, delayTime, callback);
	}

	public LTDescr delayedCall(GameObject gameObject, float delayTime, Action<object> callback)
	{
		return LeanTween.delayedCall(gameObject, delayTime, callback);
	}

	public LTDescr destroyAfter(LTRect rect, float delayTime)
	{
		return LeanTween.destroyAfter(rect, delayTime);
	}

	public LTDescr move(GameObject gameObject, Vector3 to, float time)
	{
		return LeanTween.move(gameObject, to, time);
	}

	public LTDescr move(GameObject gameObject, Vector2 to, float time)
	{
		return LeanTween.move(gameObject, to, time);
	}

	public LTDescr move(GameObject gameObject, Vector3[] to, float time)
	{
		return LeanTween.move(gameObject, to, time);
	}

	public LTDescr move(GameObject gameObject, LTBezierPath to, float time)
	{
		return LeanTween.move(gameObject, to, time);
	}

	public LTDescr move(GameObject gameObject, LTSpline to, float time)
	{
		return LeanTween.move(gameObject, to, time);
	}

	public LTDescr moveSpline(GameObject gameObject, Vector3[] to, float time)
	{
		return LeanTween.moveSpline(gameObject, to, time);
	}

	public LTDescr moveSplineLocal(GameObject gameObject, Vector3[] to, float time)
	{
		return LeanTween.moveSplineLocal(gameObject, to, time);
	}

	public LTDescr move(LTRect ltRect, Vector2 to, float time)
	{
		return LeanTween.move(ltRect, to, time);
	}

	public LTDescr moveMargin(LTRect ltRect, Vector2 to, float time)
	{
		return LeanTween.moveMargin(ltRect, to, time);
	}

	public LTDescr moveX(GameObject gameObject, float to, float time)
	{
		return LeanTween.moveX(gameObject, to, time);
	}

	public LTDescr moveY(GameObject gameObject, float to, float time)
	{
		return LeanTween.moveY(gameObject, to, time);
	}

	public LTDescr moveZ(GameObject gameObject, float to, float time)
	{
		return LeanTween.moveZ(gameObject, to, time);
	}

	public LTDescr moveLocal(GameObject gameObject, Vector3 to, float time)
	{
		return LeanTween.moveLocal(gameObject, to, time);
	}

	public LTDescr moveLocal(GameObject gameObject, Vector3[] to, float time)
	{
		return LeanTween.moveLocal(gameObject, to, time);
	}

	public LTDescr moveLocalX(GameObject gameObject, float to, float time)
	{
		return LeanTween.moveLocalX(gameObject, to, time);
	}

	public LTDescr moveLocalY(GameObject gameObject, float to, float time)
	{
		return LeanTween.moveLocalY(gameObject, to, time);
	}

	public LTDescr moveLocalZ(GameObject gameObject, float to, float time)
	{
		return LeanTween.moveLocalZ(gameObject, to, time);
	}

	public LTDescr moveLocal(GameObject gameObject, LTBezierPath to, float time)
	{
		return LeanTween.moveLocal(gameObject, to, time);
	}

	public LTDescr moveLocal(GameObject gameObject, LTSpline to, float time)
	{
		return LeanTween.moveLocal(gameObject, to, time);
	}

	public LTDescr move(GameObject gameObject, Transform to, float time)
	{
		return LeanTween.move(gameObject, to, time);
	}

	public LTDescr rotate(GameObject gameObject, Vector3 to, float time)
	{
		return LeanTween.rotate(gameObject, to, time);
	}

	public LTDescr rotate(LTRect ltRect, float to, float time)
	{
		return LeanTween.rotate(ltRect, to, time);
	}

	public LTDescr rotateLocal(GameObject gameObject, Vector3 to, float time)
	{
		return LeanTween.rotateLocal(gameObject, to, time);
	}

	public LTDescr rotateX(GameObject gameObject, float to, float time)
	{
		return LeanTween.rotateX(gameObject, to, time);
	}

	public LTDescr rotateY(GameObject gameObject, float to, float time)
	{
		return LeanTween.rotateY(gameObject, to, time);
	}

	public LTDescr rotateZ(GameObject gameObject, float to, float time)
	{
		return LeanTween.rotateZ(gameObject, to, time);
	}

	public LTDescr rotateAround(GameObject gameObject, Vector3 axis, float add, float time)
	{
		return LeanTween.rotateAround(gameObject, axis, add, time);
	}

	public LTDescr rotateAroundLocal(GameObject gameObject, Vector3 axis, float add, float time)
	{
		return LeanTween.rotateAroundLocal(gameObject, axis, add, time);
	}

	public LTDescr scale(GameObject gameObject, Vector3 to, float time)
	{
		return LeanTween.scale(gameObject, to, time);
	}

	public LTDescr scale(LTRect ltRect, Vector2 to, float time)
	{
		return LeanTween.scale(ltRect, to, time);
	}

	public LTDescr scaleX(GameObject gameObject, float to, float time)
	{
		return LeanTween.scaleX(gameObject, to, time);
	}

	public LTDescr scaleY(GameObject gameObject, float to, float time)
	{
		return LeanTween.scaleY(gameObject, to, time);
	}

	public LTDescr scaleZ(GameObject gameObject, float to, float time)
	{
		return LeanTween.scaleZ(gameObject, to, time);
	}

	public LTDescr value(GameObject gameObject, float from, float to, float time)
	{
		return LeanTween.value(gameObject, from, to, time);
	}

	public LTDescr value(GameObject gameObject, Vector2 from, Vector2 to, float time)
	{
		return LeanTween.value(gameObject, from, to, time);
	}

	public LTDescr value(GameObject gameObject, Vector3 from, Vector3 to, float time)
	{
		return LeanTween.value(gameObject, from, to, time);
	}

	public LTDescr value(GameObject gameObject, Color from, Color to, float time)
	{
		return LeanTween.value(gameObject, from, to, time);
	}

	public LTDescr value(GameObject gameObject, Action<float> callOnUpdate, float from, float to, float time)
	{
		return LeanTween.value(gameObject, callOnUpdate, from, to, time);
	}

	public LTDescr value(GameObject gameObject, Action<float, float> callOnUpdateRatio, float from, float to, float time)
	{
		return LeanTween.value(gameObject, callOnUpdateRatio, from, to, time);
	}

	public LTDescr value(GameObject gameObject, Action<Color> callOnUpdate, Color from, Color to, float time)
	{
		return LeanTween.value(gameObject, callOnUpdate, from, to, time);
	}

	public LTDescr value(GameObject gameObject, Action<Vector2> callOnUpdate, Vector2 from, Vector2 to, float time)
	{
		return LeanTween.value(gameObject, callOnUpdate, from, to, time);
	}

	public LTDescr value(GameObject gameObject, Action<Vector3> callOnUpdate, Vector3 from, Vector3 to, float time)
	{
		return LeanTween.value(gameObject, callOnUpdate, from, to, time);
	}

	public LTDescr value(GameObject gameObject, Action<float, object> callOnUpdate, float from, float to, float time)
	{
		return LeanTween.value(gameObject, callOnUpdate, from, to, time);
	}

	public LTDescr delayedSound(AudioClip audio, Vector3 pos, float volume)
	{
		return LeanTween.delayedSound(audio, pos, volume);
	}

	public LTDescr delayedSound(GameObject gameObject, AudioClip audio, Vector3 pos, float volume)
	{
		return LeanTween.delayedSound(gameObject, audio, pos, volume);
	}

	#if !UNITY_3_5 && !UNITY_4_0 && !UNITY_4_0_1 && !UNITY_4_1 && !UNITY_4_2 && !UNITY_4_3 && !UNITY_4_5
	public LTDescr play(RectTransform rectTransform, Sprite[] sprites)
	{
		return LeanTween.play(rectTransform, sprites);
	}

	public LTDescr textAlpha(RectTransform rectTransform, float to, float time)
	{
		return LeanTween.textAlpha(rectTransform, to, time);
	}

	public LTDescr textColor(RectTransform rectTransform, Color to, float time)
	{
		return LeanTween.textColor(rectTransform, to, time);
	}

	public LTDescr move(RectTransform rectTrans, Vector3 to, float time)
	{
		return LeanTween.move(rectTrans, to, time);
	}

	public LTDescr moveX(RectTransform rectTrans, float to, float time)
	{
		return LeanTween.moveX(rectTrans, to, time);
	}

	public LTDescr moveY(RectTransform rectTrans, float to, float time)
	{
		return LeanTween.moveY(rectTrans, to, time);
	}

	public LTDescr moveZ(RectTransform rectTrans, float to, float time)
	{
		return LeanTween.moveZ(rectTrans, to, time);
	}

	public LTDescr rotate(RectTransform rectTrans, float to, float time)
	{
		return LeanTween.rotate(rectTrans, to, time);
	}

	public LTDescr rotateAround(RectTransform rectTrans, Vector3 axis, float to, float time)
	{
		return LeanTween.rotateAround(rectTrans, axis, to, time);
	}

	public LTDescr rotateAroundLocal(RectTransform rectTrans, Vector3 axis, float to, float time)
	{
		return LeanTween.rotateAroundLocal(rectTrans, axis, to, time);
	}

	public LTDescr scale(RectTransform rectTrans, Vector3 to, float time)
	{
		return LeanTween.scale(rectTrans, to, time);
	}

	public LTDescr alpha(RectTransform rectTrans, float to, float time)
	{
		return LeanTween.alpha(rectTrans, to, time);
	}

	public LTDescr color(RectTransform rectTrans, Color to, float time)
	{
		return LeanTween.color(rectTrans, to, time);
	}
	#endif
}

