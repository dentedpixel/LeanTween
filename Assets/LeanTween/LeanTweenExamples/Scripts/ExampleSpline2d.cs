using UnityEngine;
using System.Collections;

public class ExampleSpline2d : MonoBehaviour {

	public Transform[] trans;
	public Texture2D spriteTexture;

	LTSpline cr;
	private GameObject sprite1;
	private GameObject sprite2;

	void Start () {
		cr = new LTSpline( new Vector3[] {trans[0].position, trans[1].position, trans[2].position, trans[3].position, trans[4].position} );
		sprite1 = GameObject.Find("sprite1");
		sprite2 = GameObject.Find("sprite2");
		#if !(UNITY_3_5 || UNITY_4_0 || UNITY_4_0_1 || UNITY_4_1 || UNITY_4_2)
			sprite1.AddComponent<SpriteRenderer>();
			sprite1.GetComponent<SpriteRenderer>().sprite = Sprite.Create( spriteTexture, new Rect(0.0f,0.0f,100.0f,100.0f), new Vector2(50.0f,50.0f), 10.0f);
			sprite2.AddComponent<SpriteRenderer>();
			sprite2.GetComponent<SpriteRenderer>().sprite = Sprite.Create( spriteTexture, new Rect(0.0f,0.0f,100.0f,100.0f), new Vector2(0.0f,0.0f), 10.0f);
		#endif
		// LeanTween.moveSpline( ltLogo2, new Vector3[] {trans[0].position, trans[1].position, trans[2].position, trans[3].position, trans[4].position}, 1f).setEase(LeanTweenType.easeInOutQuad).setLoopPingPong().setOrientToPath(true);

		LTDescr zoomInPath_LT = LeanTween.moveSpline(sprite2, new Vector3[]{Vector3.zero, Vector3.zero, new Vector3(1,1,1), new Vector3(2,1,1), new Vector3(2,1,1)}, 1.5f).setOrientToPath2d(true);
		zoomInPath_LT.setUseEstimatedTime(true);
	}
	
	private float iter;
	void Update () {
		cr.place2d( sprite1.transform, iter );

		iter += Time.deltaTime*0.1f;
		if(iter>1.0f)
			iter = 0.0f;
	}

	void OnDrawGizmos(){
		if(cr!=null)
			cr.gizmoDraw();
	}
}
