using UnityEngine;
using System.Collections;

public class PathSplineTrackCS : MonoBehaviour {

	public Transform[] trackOnePoints;
	public Transform[] trackTwoPoints;
	public Transform[] trackThreePoints;

	private GameObject avatar1;
	private LTSpline[] tracks;
	private int trackIter = 1;
	private float trackPosition; // ratio 0,1 of the avatars position on the track

	// Use this for initialization
	void Start () {
		// Find avatar
		avatar1 = GameObject.Find("Avatar1");

		tracks = new LTSpline[ 3 ];
		// remember the first and last points are used to determine the angle that the path starts at. In most cases you can just use duplicate values of the first and last points, but in this case we want to use to use other points so we will have a smooth intro and exit of the track
		tracks[0] = new LTSpline( new Vector3[] {trackOnePoints[0].position, trackOnePoints[1].position, trackOnePoints[2].position, trackOnePoints[3].position, trackOnePoints[4].position, trackOnePoints[5].position, trackOnePoints[6].position} );
		tracks[1] = new LTSpline( new Vector3[] {trackTwoPoints[0].position, trackTwoPoints[1].position, trackTwoPoints[2].position, trackTwoPoints[3].position, trackTwoPoints[4].position, trackTwoPoints[5].position, trackTwoPoints[6].position} );
		tracks[2] = new LTSpline( new Vector3[] {trackThreePoints[0].position, trackThreePoints[1].position, trackThreePoints[2].position, trackThreePoints[3].position, trackThreePoints[4].position, trackThreePoints[5].position, trackThreePoints[6].position} );

	}
	
	// Update is called once per frame
	void Update () {
		// Switch tracks
		float turn = 0-Input.GetAxis("Horizontal");
		if(Input.anyKeyDown){
			if(turn<0f && trackIter>0){
				trackIter--;
			}else if(turn>0f && trackIter < tracks.Length-1){
				trackIter++;
			}
		}

		// Update avatar's position on correct track
		tracks[ trackIter ].place( avatar1.transform, trackPosition );

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
