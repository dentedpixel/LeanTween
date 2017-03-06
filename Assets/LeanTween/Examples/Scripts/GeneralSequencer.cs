using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GeneralSequencer : MonoBehaviour {

	public GameObject avatar1;

	public GameObject dustCloudPrefab;

	public float speedScale = 1f;

	public void Start(){

		// Jump up
		var seq = LeanTween.sequence();

		seq.add( LeanTween.moveY( avatar1, avatar1.transform.localPosition.y + 6f, 1f).setEaseOutQuad() );

		// Rotate 360
		seq.add( LeanTween.rotateAround( avatar1, Vector3.forward, 360f, 0.6f ).setEaseInBack() );

		// Return to ground
		seq.add( LeanTween.moveY( avatar1, avatar1.transform.localPosition.y, 1f).setEaseInQuad() );

		// Kick off spiraling clouds
		seq.add(() => {
			for(int i = 0; i < 50f; i++){
				GameObject cloud = Instantiate(dustCloudPrefab, avatar1.transform) as GameObject;
				cloud.transform.localPosition = new Vector3(Random.Range(-2f,2f),0f,0f);
				cloud.transform.eulerAngles = new Vector3(0f,0f,Random.Range(0,360f));

				var range = new Vector3(cloud.transform.localPosition.x, Random.Range(2f,4f), Random.Range(-10f,10f));
				LeanTween.moveLocal( cloud, range, 3f).setEaseOutCirc();

				LeanTween.rotateAround(cloud, Vector3.forward, 360f*2, 3f).setEaseOutCirc();

				LeanTween.alpha(cloud,0f,3f).setEaseOutCirc().setDestroyOnComplete(true);
			}
		});

		seq.setScale(speedScale);
	}
}
