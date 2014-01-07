using UnityEngine;
using System.Collections;

public class ExampleCatmull : MonoBehaviour {

	public Transform[] trans;

	LTSpline cr;
	private GameObject ltLogo;

	void Start () {
		Vector3 diff = trans[1].position - trans[0].position;
		cr = new LTSpline( new Vector3[] {trans[0].position-diff, trans[0].position, trans[1].position, trans[2].position, trans[2].position+diff} );
		ltLogo = GameObject.Find("LeanTweenLogo");
	}
	
	private float iter;
	void Update () {
		Debug.Log("iter:"+iter);
		ltLogo.transform.position = cr.point( iter /*(Time.time*1000)%1000 * 1.0 / 1000.0 */);

		iter += Time.deltaTime*0.1f;
		if(iter>1.0f)
			iter = 0.0f;
	}

	void OnDrawGizmos(){
		if(cr!=null)
			cr.gizmoDraw( iter );
	}
}
