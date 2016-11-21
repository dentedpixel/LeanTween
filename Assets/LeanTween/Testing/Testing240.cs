using UnityEngine;
using System.Collections;

public class Testing240 : MonoBehaviour {

    public GameObject cube1;
    public GameObject cube2;
    public RectTransform rect1;

	public GameObject sprite2;

	// Use this for initialization
	void Start () {
        LTDescr lt1 = LeanTween.moveY(cube1, cube1.transform.position.y - 15.0f, 10f).setEase(LeanTweenType.easeInQuad).setDestroyOnComplete(false).setOnComplete(()=>{
            Debug.Log("Done");
        });

        LeanTween.rotateAround(cube1, Vector3.forward, 360.0f, 10f).setRepeat(-1);

        LeanTween.value(gameObject, new Vector3(1f,1f,1f), new Vector3(10f,10f,10f), 1f).setOnUpdate( ( Vector3 val )=>{
//            Debug.Log("val:"+val);
        });

        LeanTween.value(gameObject, ScaleGroundColor, new Color(1f, 0f, 0f, 0.2f), Color.blue, 2f).setEaseInOutBounce();

        LeanTween.scale(cube2, Vector3.one * 2f, 1f).setEasePunch().setScale(5f);

        LeanTween.scale(rect1, Vector3.one * 2f, 1f).setEasePunch().setScale(-1f);

		LeanTween.moveSplineLocal(sprite2,new Vector3[]{ new Vector3(0f,0f,0f), new Vector3(0f,0f,0f), new Vector3(2f,1f,0f), new Vector3(5f,1.5f,0f), new Vector3(5f,1.5f,0f) },4f)
			.setOrientToPath2d(true);
	}

    public static void ScaleGroundColor(Color to)
    {
//        Debug.Log("Color col:"+to);
        RenderSettings.ambientGroundColor = to;
    }
	
	// Update is called once per frame
	void Update () {
	
	}
}
