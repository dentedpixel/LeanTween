using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class PathSplineEndlessCS : MonoBehaviour {
	public GameObject trackTrailRenderers;
	public GameObject car;
	public GameObject carInternal;

	private LTSpline track;
	private List<Vector3> trackPts = new List<Vector3>();
	private float zIter = 0f;
	private float carIter = 0f;
	private float carSpeed;
	private int trackMaxItems = 15;
	private float trailRendererDir = -1f;
	private int trackIter = 1;
	private float pushTrackAhead = 0f;

	// Use this for initialization
	void Start () {

		for(int i = 0; i < trackMaxItems; i++){
			addRandomTrackPoint();
		}
		refreshSpline();

		// moveTrailRendererAlongPath();

		// Animate in track ahead of the car
		LeanTween.value(gameObject, 0, 0.3f, 2f).setOnUpdate( ( float val )=>{
			pushTrackAhead = val;
		});
	}

	void moveTrailRendererAlongPath(){
		LeanTween.moveSpline( trackTrailRenderers, trackPts.ToArray(), 10f ).setOrientToPath(true).setOnComplete( ()=>{
			trailRendererDir = 0f - trailRendererDir; // Flip direction so every pass down the trail
			moveTrailRendererAlongPath();

		}).setDirection(trailRendererDir);
	}
	
	// Update is called once per frame
	void Update () {

		float zLastDist = (trackPts[ trackPts.Count - 1].z - transform.position.z);
		// Debug.Log("zLastDist:"+zLastDist+" carIter:"+carIter);
		if(zLastDist < 200f){
			Debug.Log("addRandomTrackPoint");
			addRandomTrackPoint();
			refreshSpline();
		}

		// Update avatar's position on correct track
		track.place( car.transform, carIter );
		carIter += carSpeed;

		// we'll place the trail renders always a bit in front of the car
		track.place( trackTrailRenderers.transform, carIter + pushTrackAhead );


		// Switch tracks on keyboard input
		float turn = Input.GetAxis("Horizontal");
		if(Input.anyKeyDown){
			if(turn<0f && trackIter>0){
				trackIter--;
			}else if(turn>0f && trackIter < 2){ // We have three track "rails" so stopping it from going above 3
				trackIter++;
			}
			// Move the internal local x of the car to simulate changing tracks
			LeanTween.moveLocalX(carInternal, (trackIter-1)*6f, 0.3f).setEase(LeanTweenType.easeOutBack);

		}
	}

	void addRandomTrackPoint(){
		Vector3 randomInFrontPosition = new Vector3( Random.Range(-20.0f,20.0f), 0f, zIter);

		// placing the box is just to visualize how the paths get created
		GameObject box = GameObject.CreatePrimitive(PrimitiveType.Cube);
		box.transform.position = randomInFrontPosition;

		trackPts.Add( randomInFrontPosition ); // Add a future node
		Debug.Log("trackPts.Count:"+trackPts.Count);
		if(trackPts.Count > trackMaxItems)
			trackPts.RemoveAt(0); // Remove the trailing node

		zIter += 40f;
	}

	void refreshSpline(){
		track = new LTSpline( trackPts.ToArray() );
		carIter = track.ratioAtPoint( car.transform.position );
		Debug.Log("distance:"+track.distance+" carIter:"+carIter);
		carSpeed = 5f / track.distance;
	}
		
}
