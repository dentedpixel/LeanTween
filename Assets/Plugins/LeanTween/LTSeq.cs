using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LTSeq {

	public LTSeq last;

	public LTSeq next;

	public LTDescr tween;

	public float totalDelay;

	public void reset(){
		last = null;
		tween = null;
		totalDelay = 0f;
	}

	private void addPreviousDelays(){
		if (last != null)
			totalDelay += last.totalDelay;
	}

	public LTSeq add( float delay ){
		addPreviousDelays();
		
		totalDelay += delay;

		return this;
	}

	public LTSeq add( System.Action callback ){
		add(LeanTween.delayedCall(0f, callback));

		return this;
	}

	public LTSeq add( System.Action<object> callback ){
		add(LeanTween.delayedCall(0f, callback));

		return this;
	}

	public LTSeq add( GameObject gameObject, System.Action callback ){

		add(LeanTween.delayedCall(gameObject, 0f, callback));

		return this;
	}

	public LTSeq add( GameObject gameObject, System.Action<object> callback ){
		add(LeanTween.delayedCall(gameObject, 0f, callback));

		return this;
	}

	public LTSeq add( LTDescr tween ){
		this.tween = tween;

		addPreviousDelays();

		float delay = tween.delay + totalDelay;
		tween.setDelay( delay );

		totalDelay = delay + tween.time;
		return this;
	}

	public LTSeq addFrame( int frameCount ){

		return this;
	}

	public LTSeq subtract( float delay ){

		return this;
	}
}
