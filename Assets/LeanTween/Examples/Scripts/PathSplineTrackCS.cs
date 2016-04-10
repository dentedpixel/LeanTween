using UnityEngine;
using System.Collections;

// This project demonstrates how you can use the spline behaviour for a multi-track game (like an endless runner style)

public class PathSplineTrackCS : MonoBehaviour {

	public GameObject[] trackTrailRenderers;

	public Transform[] trackOnePoints;
	public Transform[] trackTwoPoints;
	public Transform[] trackThreePoints;

	private GameObject car;
	private LTSpline[] tracks;
	private int trackIter = 1;
	private float trackPosition; // ratio 0,1 of the avatars position on the track

	// Use this for initialization
	void Start () {
		// Find avatar
		car = GameObject.Find("Car");

		tracks = new LTSpline[ 3 ];

		// Make the tracks from the provided transforms
		tracks[0] = new LTSpline( new Vector3[] {trackOnePoints[0].position, trackOnePoints[1].position, trackOnePoints[2].position, trackOnePoints[3].position, trackOnePoints[4].position, trackOnePoints[5].position, trackOnePoints[6].position} );
		tracks[1] = new LTSpline( new Vector3[] {trackTwoPoints[0].position, trackTwoPoints[1].position, trackTwoPoints[2].position, trackTwoPoints[3].position, trackTwoPoints[4].position, trackTwoPoints[5].position, trackTwoPoints[6].position} );
		tracks[2] = new LTSpline( new Vector3[] {trackThreePoints[0].position, trackThreePoints[1].position, trackThreePoints[2].position, trackThreePoints[3].position, trackThreePoints[4].position, trackThreePoints[5].position, trackThreePoints[6].position} );


		// Optional technique to show the trails in game
		for(int i = 0; i < trackTrailRenderers.Length; i++){
			LTSpline track = tracks[i];
			LeanTween.moveSpline( trackTrailRenderers[i], track, 2f ).setRepeat(-1);
		}
	}
	
	// Update is called once per frame
	void Update () {
		// Switch tracks on keyboard input
		float turn = 0-Input.GetAxis("Horizontal");
		if(Input.anyKeyDown){
			if(turn<0f && trackIter>0){
				trackIter--;
			}else if(turn>0f && trackIter < tracks.Length-1){
				trackIter++;
			}
		}

		// Update avatar's position on correct track
		tracks[ trackIter ].place( car.transform, trackPosition );

		// (Optional) Draw the tracks
		// LeanTween.splineDraw( trackOnePoints, Color.white);
		// tracks[0].sceneDraw( trackOnePoints, Color.white);

		trackPosition += Time.deltaTime * 0.03f;
	}

	// Use this for visualizing what the track looks like in the editor (for a full suite of spline tools check out the LeanTween Editor)
	void OnDrawGizmos(){
		LeanTween.splineGizmo( trackOnePoints, Color.red);
		LeanTween.splineGizmo( trackTwoPoints, Color.green);
		LeanTween.splineGizmo( trackThreePoints, Color.blue);
	}
}
