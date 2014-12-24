using UnityEngine;
using System.Collections;

public class PathSpline2d : MonoBehaviour {

	public Transform[] trans;
	public Texture2D spriteTexture;

	LTSpline cr;
	private GameObject sprite1;
	private GameObject sprite2;

	void Start () {
		cr = new LTSpline( new Vector3[] {trans[0].position, trans[1].position, trans[2].position, trans[3].position, trans[4].position} );
		sprite1 = GameObject.Find("sprite1");
		createSprite( sprite1, new Vector2(0f,0f) );
		sprite2 = GameObject.Find("sprite2");
		createSprite( sprite2, new Vector2(0.5f,0.5f) );

		// Tween automatically
		LTDescr zoomInPath_LT = LeanTween.moveSpline(sprite2, new Vector3[]{Vector3.zero, Vector3.zero, new Vector3(10,10,10), new Vector3(20,10,10), new Vector3(20,10,10)}, 6.5f).setOrientToPath2d(true).setRepeat(-1);
		zoomInPath_LT.setUseEstimatedTime(true);
	}
	
	private float iter;
	void Update () {
		// Or Update Manually
		cr.place2d( sprite1.transform, iter );

		iter += Time.deltaTime*0.07f;
		if(iter>1.0f)
			iter = 0.0f;
	}

	void OnDrawGizmos(){
		if(cr!=null)
			cr.gizmoDraw(); // To Visualize the path, use this method
	}

	void createSprite( GameObject go, Vector2 point ){ // Need to create sprites manually so it can be backwards compatible to older Unity versions
		#if !(UNITY_3_5 || UNITY_4_0 || UNITY_4_0_1 || UNITY_4_1 || UNITY_4_2)
			go.AddComponent<SpriteRenderer>();
			go.GetComponent<SpriteRenderer>().sprite = Sprite.Create( spriteTexture, new Rect(0.0f,0.0f,spriteTexture.width,spriteTexture.height), point, 100);
		#endif
	}
}
