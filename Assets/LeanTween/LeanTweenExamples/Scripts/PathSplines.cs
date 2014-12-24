using UnityEngine;
using System.Collections;

public class PathSplines : MonoBehaviour {

	public Transform[] trans;
	public Texture2D spriteTexture;

	LTSpline cr;
	private GameObject dude1;
	private GameObject dude2;

	void Start () {
		cr = new LTSpline( new Vector3[] {trans[0].position, trans[1].position, trans[2].position, trans[3].position, trans[4].position, trans[5].position} );
		dude1 = GameObject.Find("dude1");
		dude2 = GameObject.Find("dude2");

		// Tween automatically
		LTDescr zoomInPath_LT = LeanTween.moveSplineLocal(dude1, new Vector3[]{Vector3.zero, Vector3.zero, new Vector3(10,10,10), new Vector3(20,10,10), new Vector3(20,10,10)}, 4.0f).setOrientToPath2d(true).setRepeat(-1);
		zoomInPath_LT.setUseEstimatedTime(true);
	}
	
	private float iter;
	void Update () {
		// Or Update Manually
		cr.place( dude2.transform, iter );

		iter += Time.deltaTime*0.3f;
		if(iter>1.0f)
			iter = 0.0f;
	}

	void OnDrawGizmos(){
		if(cr!=null)
			cr.gizmoDraw(); // To Visualize the path, use this method
	}
}
