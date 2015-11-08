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

	public ILTDescr descr(int uniqueId)
	{
		return LeanTween.descr(uniqueId);
	}

	public ILTDescr description(int uniqueId)
	{
		return LeanTween.description(uniqueId);
	}

	public ILTDescr[] descriptions(GameObject gameObject = null)
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


	public ILTDescr options(ILTDescr seed)
	{
		return LeanTween.options(seed);
	}

	public ILTDescr options()
	{
		return LeanTween.options();
	}

	public GameObject tweenEmpty
	{
		get { return LeanTween.tweenEmpty; }
	}

	public ILTDescr alpha(GameObject gameObject, float to, float time)
	{
		return LeanTween.alpha(gameObject, to, time);
	}

	public ILTDescr alpha(LTRect ltRect, float to, float time)
	{
		return LeanTween.alpha(ltRect, to, time);
	}

	public ILTDescr alphaVertex(GameObject gameObject, float to, float time)
	{
		return LeanTween.alpha(gameObject, to, time);
	}

	public ILTDescr color(GameObject gameObject, Color to, float time)
	{
		return LeanTween.color(gameObject, to, time);
	}

	public ILTDescr delayedCall(float delayTime, Action callback)
	{
		return LeanTween.delayedCall(delayTime, callback);
	}

	public ILTDescr delayedCall(float delayTime, Action<object> callback)
	{
		return LeanTween.delayedCall(delayTime, callback);
	}

	public ILTDescr delayedCall(GameObject gameObject, float delayTime, Action callback)
	{
		return LeanTween.delayedCall(gameObject, delayTime, callback);
	}

	public ILTDescr delayedCall(GameObject gameObject, float delayTime, Action<object> callback)
	{
		return LeanTween.delayedCall(gameObject, delayTime, callback);
	}

	public ILTDescr destroyAfter(LTRect rect, float delayTime)
	{
		return LeanTween.destroyAfter(rect, delayTime);
	}

	public ILTDescr move(GameObject gameObject, Vector3 to, float time)
	{
		return LeanTween.move(gameObject, to, time);
	}

	public ILTDescr move(GameObject gameObject, Vector2 to, float time)
	{
		return LeanTween.move(gameObject, to, time);
	}

	public ILTDescr move(GameObject gameObject, Vector3[] to, float time)
	{
		return LeanTween.move(gameObject, to, time);
	}

	public ILTDescr move(GameObject gameObject, LTBezierPath to, float time)
	{
		return LeanTween.move(gameObject, to, time);
	}

	public ILTDescr move(GameObject gameObject, LTSpline to, float time)
	{
		return LeanTween.move(gameObject, to, time);
	}

	public ILTDescr moveSpline(GameObject gameObject, Vector3[] to, float time)
	{
		return LeanTween.moveSpline(gameObject, to, time);
	}

	public ILTDescr moveSplineLocal(GameObject gameObject, Vector3[] to, float time)
	{
		return LeanTween.moveSplineLocal(gameObject, to, time);
	}

	public ILTDescr move(LTRect ltRect, Vector2 to, float time)
	{
		return LeanTween.move(ltRect, to, time);
	}

	public ILTDescr moveMargin(LTRect ltRect, Vector2 to, float time)
	{
		return LeanTween.moveMargin(ltRect, to, time);
	}

	public ILTDescr moveX(GameObject gameObject, float to, float time)
	{
		return LeanTween.moveX(gameObject, to, time);
	}

	public ILTDescr moveY(GameObject gameObject, float to, float time)
	{
		return LeanTween.moveY(gameObject, to, time);
	}

	public ILTDescr moveZ(GameObject gameObject, float to, float time)
	{
		return LeanTween.moveZ(gameObject, to, time);
	}

	public ILTDescr moveLocal(GameObject gameObject, Vector3 to, float time)
	{
		return LeanTween.moveLocal(gameObject, to, time);
	}

	public ILTDescr moveLocal(GameObject gameObject, Vector3[] to, float time)
	{
		return LeanTween.moveLocal(gameObject, to, time);
	}

	public ILTDescr moveLocalX(GameObject gameObject, float to, float time)
	{
		return LeanTween.moveLocalX(gameObject, to, time);
	}

	public ILTDescr moveLocalY(GameObject gameObject, float to, float time)
	{
		return LeanTween.moveLocalY(gameObject, to, time);
	}

	public ILTDescr moveLocalZ(GameObject gameObject, float to, float time)
	{
		return LeanTween.moveLocalZ(gameObject, to, time);
	}

	public ILTDescr moveLocal(GameObject gameObject, LTBezierPath to, float time)
	{
		return LeanTween.moveLocal(gameObject, to, time);
	}

	public ILTDescr moveLocal(GameObject gameObject, LTSpline to, float time)
	{
		return LeanTween.moveLocal(gameObject, to, time);
	}

	public ILTDescr move(GameObject gameObject, Transform to, float time)
	{
		return LeanTween.move(gameObject, to, time);
	}

	public ILTDescr rotate(GameObject gameObject, Vector3 to, float time)
	{
		return LeanTween.rotate(gameObject, to, time);
	}

	public ILTDescr rotate(LTRect ltRect, float to, float time)
	{
		return LeanTween.rotate(ltRect, to, time);
	}

	public ILTDescr rotateLocal(GameObject gameObject, Vector3 to, float time)
	{
		return LeanTween.rotateLocal(gameObject, to, time);
	}

	public ILTDescr rotateX(GameObject gameObject, float to, float time)
	{
		return LeanTween.rotateX(gameObject, to, time);
	}

	public ILTDescr rotateY(GameObject gameObject, float to, float time)
	{
		return LeanTween.rotateY(gameObject, to, time);
	}

	public ILTDescr rotateZ(GameObject gameObject, float to, float time)
	{
		return LeanTween.rotateZ(gameObject, to, time);
	}

	public ILTDescr rotateAround(GameObject gameObject, Vector3 axis, float add, float time)
	{
		return LeanTween.rotateAround(gameObject, axis, add, time);
	}

	public ILTDescr rotateAroundLocal(GameObject gameObject, Vector3 axis, float add, float time)
	{
		return LeanTween.rotateAroundLocal(gameObject, axis, add, time);
	}

	public ILTDescr scale(GameObject gameObject, Vector3 to, float time)
	{
		return LeanTween.scale(gameObject, to, time);
	}

	public ILTDescr scale(LTRect ltRect, Vector2 to, float time)
	{
		return LeanTween.scale(ltRect, to, time);
	}

	public ILTDescr scaleX(GameObject gameObject, float to, float time)
	{
		return LeanTween.scaleX(gameObject, to, time);
	}

	public ILTDescr scaleY(GameObject gameObject, float to, float time)
	{
		return LeanTween.scaleY(gameObject, to, time);
	}

	public ILTDescr scaleZ(GameObject gameObject, float to, float time)
	{
		return LeanTween.scaleZ(gameObject, to, time);
	}

	public ILTDescr value(GameObject gameObject, float from, float to, float time)
	{
		return LeanTween.value(gameObject, from, to, time);
	}

	public ILTDescr value(GameObject gameObject, Vector2 from, Vector2 to, float time)
	{
		return LeanTween.value(gameObject, from, to, time);
	}

	public ILTDescr value(GameObject gameObject, Vector3 from, Vector3 to, float time)
	{
		return LeanTween.value(gameObject, from, to, time);
	}

	public ILTDescr value(GameObject gameObject, Color from, Color to, float time)
	{
		return LeanTween.value(gameObject, from, to, time);
	}

	public ILTDescr value(GameObject gameObject, Action<float> callOnUpdate, float from, float to, float time)
	{
		return LeanTween.value(gameObject, callOnUpdate, from, to, time);
	}

	public ILTDescr value(GameObject gameObject, Action<float, float> callOnUpdateRatio, float from, float to, float time)
	{
		return LeanTween.value(gameObject, callOnUpdateRatio, from, to, time);
	}

	public ILTDescr value(GameObject gameObject, Action<Color> callOnUpdate, Color from, Color to, float time)
	{
		return LeanTween.value(gameObject, callOnUpdate, from, to, time);
	}

	public ILTDescr value(GameObject gameObject, Action<Vector2> callOnUpdate, Vector2 from, Vector2 to, float time)
	{
		return LeanTween.value(gameObject, callOnUpdate, from, to, time);
	}

	public ILTDescr value(GameObject gameObject, Action<Vector3> callOnUpdate, Vector3 from, Vector3 to, float time)
	{
		return LeanTween.value(gameObject, callOnUpdate, from, to, time);
	}

	public ILTDescr value(GameObject gameObject, Action<float, object> callOnUpdate, float from, float to, float time)
	{
		return LeanTween.value(gameObject, callOnUpdate, from, to, time);
	}

	public ILTDescr delayedSound(AudioClip audio, Vector3 pos, float volume)
	{
		return LeanTween.delayedSound(audio, pos, volume);
	}

	public ILTDescr delayedSound(GameObject gameObject, AudioClip audio, Vector3 pos, float volume)
	{
		return LeanTween.delayedSound(gameObject, audio, pos, volume);
	}

	#if !UNITY_3_5 && !UNITY_4_0 && !UNITY_4_0_1 && !UNITY_4_1 && !UNITY_4_2 && !UNITY_4_3 && !UNITY_4_5
	public ILTDescr play(RectTransform rectTransform, Sprite[] sprites)
	{
		return LeanTween.play(rectTransform, sprites);
	}

	public ILTDescr textAlpha(RectTransform rectTransform, float to, float time)
	{
		return LeanTween.textAlpha(rectTransform, to, time);
	}

	public ILTDescr textColor(RectTransform rectTransform, Color to, float time)
	{
		return LeanTween.textColor(rectTransform, to, time);
	}

	public ILTDescr move(RectTransform rectTrans, Vector3 to, float time)
	{
		return LeanTween.move(rectTrans, to, time);
	}

	public ILTDescr moveX(RectTransform rectTrans, float to, float time)
	{
		return LeanTween.moveX(rectTrans, to, time);
	}

	public ILTDescr moveY(RectTransform rectTrans, float to, float time)
	{
		return LeanTween.moveY(rectTrans, to, time);
	}

	public ILTDescr moveZ(RectTransform rectTrans, float to, float time)
	{
		return LeanTween.moveZ(rectTrans, to, time);
	}

	public ILTDescr rotate(RectTransform rectTrans, float to, float time)
	{
		return LeanTween.rotate(rectTrans, to, time);
	}

	public ILTDescr rotateAround(RectTransform rectTrans, Vector3 axis, float to, float time)
	{
		return LeanTween.rotateAround(rectTrans, axis, to, time);
	}

	public ILTDescr rotateAroundLocal(RectTransform rectTrans, Vector3 axis, float to, float time)
	{
		return LeanTween.rotateAroundLocal(rectTrans, axis, to, time);
	}

	public ILTDescr scale(RectTransform rectTrans, Vector3 to, float time)
	{
		return LeanTween.scale(rectTrans, to, time);
	}

	public ILTDescr alpha(RectTransform rectTrans, float to, float time)
	{
		return LeanTween.alpha(rectTrans, to, time);
	}

	public ILTDescr color(RectTransform rectTrans, Color to, float time)
	{
		return LeanTween.color(rectTrans, to, time);
	}
	#endif
}

