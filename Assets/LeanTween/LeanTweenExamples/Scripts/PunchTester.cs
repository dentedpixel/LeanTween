using UnityEngine;
using System.Collections;

public class PunchTester : MonoBehaviour {

	// Use this for initialization
	void Start () {
	
	}

	void Update () 
    {        
        if (Input.GetKeyDown(KeyCode.S))
        {
            LeanTween.scale(this.gameObject, Vector3.one*3f, 1.0f).setEase(LeanTweenType.easeSpring);            
            print("scale punch!");
        }
 
        if (Input.GetKeyDown(KeyCode.R))
        {
            LeanTween.rotate(this.gameObject, Vector3.one, 1.0f).setEase(LeanTweenType.punch);
            print("rotate punch!");
        }
 
        if (Input.GetKeyDown(KeyCode.M))
        {
            // LeanTween.move(this.gameObject, new Vector3(0f,0f,1f), 1.0f).setEase(LeanTweenType.punch);
            print("move punch!");

            LeanTween.moveX( this.gameObject, 1f, 1f).setOnComplete( destroyOnComp ).setOnCompleteParam( this.gameObject );
        }

        if (Input.GetKeyDown(KeyCode.C))
        {
            LeanTween.color( this.gameObject, new Color(1f, 0f, 0f, 0.5f), 1f);
        }

        if (Input.GetKeyDown(KeyCode.E))
        {
            LeanTween.delayedCall(gameObject,0.3f, delayedMethod).setRepeat(4).setOnCompleteOnRepeat(true).setOnCompleteParam( "hi" );
        }

        if (Input.GetKeyDown(KeyCode.C))
        {
            Color to = new Color(Random.Range(0f,1f),0f,Random.Range(0f,1f),0.0f);
            GameObject l = GameObject.Find("LCharacter");
            LeanTween.color( l, to, 4.0f ).setRepeat(2).setLoopPingPong().setEase(LeanTweenType.easeOutBounce);
        }

        if (Input.GetKeyDown(KeyCode.V))
        {
            Color to = new Color(Random.Range(0f,1f),0f,Random.Range(0f,1f),0.0f);
            LeanTween.value( gameObject, updateColor, new Color(1.0f,0.0f,0.0f,1.0f), Color.blue, 4.0f );//.setRepeat(2).setLoopPingPong().setEase(LeanTweenType.easeOutBounce);
        }
	}

    void updateColor( Color c ){
        GameObject l = GameObject.Find("LCharacter");
        // Debug.Log("new col:"+c);
        l.renderer.material.color = c;
    }

    void delayedMethod( object myVal ){
        string castBack = myVal as string;
        Debug.Log("delayed call:"+Time.time +" myVal:"+castBack);
    }

    void destroyOnComp( object p ){
      GameObject g = (GameObject)p;
      Destroy( g );
    }
}
