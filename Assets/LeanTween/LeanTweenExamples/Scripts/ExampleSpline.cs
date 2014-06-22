using UnityEngine;
using System.Collections;

public class ExampleSpline : MonoBehaviour {

	public Transform[] trans;

	LTSpline cr;
	private GameObject ltLogo;
	private GameObject ltLogo2;

	void Start () {
		cr = new LTSpline( new Vector3[] {trans[0].position, trans[1].position, trans[2].position, trans[3].position, trans[4].position} );
		ltLogo = GameObject.Find("LeanTweenLogo1");
		ltLogo2 = GameObject.Find("LeanTweenLogo2");

		// LeanTween.moveSpline( ltLogo2, new Vector3[] {trans[0].position, trans[1].position, trans[2].position, trans[3].position, trans[4].position}, 1f).setEase(LeanTweenType.easeInOutQuad).setLoopPingPong().setOrientToPath(true);

		LTDescr zoomInPath_LT = LeanTween.moveSpline(ltLogo2, new Vector3[]{Vector3.zero, Vector3.zero, new Vector3(1,1,1), new Vector3(2,1,1), new Vector3(2,1,1)}, 1.5f);
		zoomInPath_LT.setUseEstimatedTime(true);
	}
	
	private float iter;
	void Update () {
		ltLogo.transform.position = cr.point( iter /*(Time.time*1000)%1000 * 1.0 / 1000.0 */);

		iter += Time.deltaTime*0.1f;
		if(iter>1.0f)
			iter = 0.0f;
	}

	void OnDrawGizmos(){
		if(cr!=null)
			cr.gizmoDraw();
	}
}
