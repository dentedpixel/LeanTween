using System.Collections;
using System.Collections.Generic;
using UnityEngine;

/**
* Internal Representation of a Sequence<br>
* <br>
* &nbsp;&nbsp;<h4>Example:</h4> 
* var seq = LeanTween.sequence();<br>
* seq.add(1f); <span style="color:gray">// delay everything one second</span><br>
* seq.add( () => { <span style="color:gray">// fire an event before start</span><br>
* &nbsp;Debug.Log("I have started");<br>
* });<br>
* seq.add( LeanTween.move(cube1, Vector3.one * 10f, 1f) ); <span style="color:gray">// do a tween</span><br>
* seq.add( (object obj) => { <span style="color:gray">// fire event after tween</span><br>
* &nbsp;var dict = obj as Dictionary<string,string>;<br>
* &nbsp;Debug.Log("We are done now obj value:"+dict["hi"]);<br>
* }, new Dictionary<string,string>(){ {"hi","sup"} } );<br>
* @class LTSeq
* @constructor
*/
public class LTSeq {

	public LTSeq previous;

	public LTDescr tween;

	public float totalDelay;

	public float timeScale;

	public void reset(){
		previous = null;
		tween = null;
		totalDelay = 0f;
	}

	private LTSeq addOn(){
		var newSeq = new LTSeq();
		newSeq.previous = this;
		return newSeq;
	}

	private void addPreviousDelays(){
		if (previous != null)
			totalDelay += previous.totalDelay;
	}

	/**
	* Add a time delay to the sequence
	* @method add (delay)
	* @param {float} delay:float amount of time to add to the sequence
	* @return {LTSeq} LTDescr an object that distinguishes the tween
	* var seq = LeanTween.sequence();<br>
	* seq.add(1f); // delay everything one second<br>
	* seq.add( LeanTween.move(cube1, Vector3.one * 10f, 1f) ); // do a tween<br>
	*/
	public LTSeq add( float delay ){
		addPreviousDelays();
		
		totalDelay += delay;

		return addOn();
	}

	/**
	* Add a time delay to the sequence
	* @method add (method)
	* @param {System.Action} callback:System.Action method you want to be called
	* @return {LTSeq} LTSeq an object that you can add tweens, methods and time on to
	* @example
	* var seq = LeanTween.sequence();<br>
	* seq.add( () => { // fire an event before start<br>
	* &nbsp;Debug.Log("I have started");<br>
	* });<br>
	* seq.add( LeanTween.move(cube1, Vector3.one * 10f, 1f) ); // do a tween<br>
	* seq.add( () => { // fire event after tween<br>
	* &nbsp;Debug.Log("We are done now");<br>
	* });;<br>
	*/
	public LTSeq add( System.Action callback ){
		add(LeanTween.delayedCall(0f, callback));

		return addOn();
	}

	/**
	* Add a time delay to the sequence
	* @method add (method(object))
	* @param {System.Action} callback:System.Action method you want to be called
	* @return {LTSeq} LTSeq an object that you can add tweens, methods and time on to
	* @example
	* var seq = LeanTween.sequence();<br>
	* seq.add( () => { // fire an event before start<br>
	* &nbsp;Debug.Log("I have started");<br>
	* });<br>
	* seq.add( LeanTween.move(cube1, Vector3.one * 10f, 1f) ); // do a tween<br>
	* seq.add((object obj) => { // fire event after tween
	* &nbsp;var dict = obj as Dictionary<string,string>;
	* &nbsp;Debug.Log("We are done now obj value:"+dict["hi"]);
	* &nbsp;}, new Dictionary<string,string>(){ {"hi","sup"} } );
	*/
	public LTSeq add( System.Action<object> callback, object obj ){
		add(LeanTween.delayedCall(0f, callback).setOnCompleteParam(obj));

		return addOn();
	}

	public LTSeq add( GameObject gameObject, System.Action callback ){
		add(LeanTween.delayedCall(gameObject, 0f, callback));

		return addOn();
	}

	public LTSeq add( GameObject gameObject, System.Action<object> callback, object obj ){
		add(LeanTween.delayedCall(gameObject, 0f, callback).setOnCompleteParam(obj));

		return addOn();
	}

	/**
	* Retrieve a sequencer object where you can easily chain together tweens and methods one after another
	* 
	* @method add (tween)
	* @return {LTSeq} LTSeq an object that you can add tweens, methods and time on to
	* @example
	* var seq = LeanTween.sequence();<br>
	* seq.add( LeanTween.move(cube1, Vector3.one * 10f, 1f) ); // do a move tween<br>
	* seq.add( LeanTween.rotateAround( avatar1, Vector3.forward, 360f, 1f ) ); // then do a rotate tween<br>
	*/
	public LTSeq add( LTDescr tween ){
		this.tween = tween;

		addPreviousDelays();

		float delay = tween.delay + totalDelay;
		tween.setDelay( delay );

		totalDelay = delay + tween.time;
		return addOn();
	}

	public LTSeq addFrame( int frameCount ){

		return addOn();
	}

	public LTSeq subtract( float delay ){

		return addOn();
	}

	public LTSeq setScale( float timeScale ){
		
		setScaleRecursive(this, timeScale);

		return addOn();
	}

	private void setScaleRecursive( LTSeq seq, float timeScale ){
		this.timeScale = timeScale;

		Debug.Log("seq.tween:" + seq.tween.type + " seq.totalDelay:" + seq.totalDelay+" seq.previous:"+seq.previous);
		seq.totalDelay *= timeScale;
		if (seq.tween != null) {
			seq.tween.setTime(seq.tween.time * timeScale);
			seq.tween.setDelay(seq.totalDelay);
		}

		if(seq.previous!=null)
			setScaleRecursive(seq.previous, timeScale);
	}
}
