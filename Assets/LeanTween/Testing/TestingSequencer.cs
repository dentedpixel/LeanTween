using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TestingSequencer : MonoBehaviour {
	public GameObject cube1;

	public void Start(){


		var seq = LeanTween.sequence();
		seq.add(1f);
		seq.add(() => {
			Debug.Log("Hello world time:"+Time.time);
		});
		seq.add( LeanTween.move(cube1, Vector3.one * 10f, 1f).setOnComplete( ()=>{ Debug.Log("Tween finished time:"+Time.time); } ) );
		seq.add(() => {
			Debug.Log("we are done now  time:"+Time.time);
		});
	}
}
