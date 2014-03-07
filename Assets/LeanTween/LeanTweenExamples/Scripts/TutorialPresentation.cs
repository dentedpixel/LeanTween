using UnityEngine;
using System.Collections;

public class TutorialPresentation : MonoBehaviour {

	public GameObject[] avatars;
	public AnimationCurve gameOverEase;

	private LTRect gameOverButton;

	// Use this for initialization
	void Start () {
		gameOverButton = new LTRect(-Screen.width*0.5f, Screen.height*0.4f, Screen.width*0.2f, Screen.height*0.2f);

		for(int i = 0; i < avatars.Length; i++){
			LeanTween.moveY( avatars[i], avatars[i].transform.position.y + 4f, 1f).setDelay(0.25f*i).setEase(LeanTweenType.easeOutCirc).setLoopPingPong().setRepeat(2);
			LeanTween.rotate( avatars[i], avatars[i].transform.eulerAngles + new Vector3(45f, 0f, 0f), 1f).setLoopPingPong().setRepeat(2);
		}

		LeanTween.delayedCall(gameObject, 3f, gameOverScreen);

		LeanTween.value(gameObject, changeValue,  5f, 8f, 1f);
	}

	void changeValue( float val ){

	}

	void IAMDone( string[] arr ){
		Debug.Log("yay");
	}

	void OnGUI(){
		if(GUI.Button(gameOverButton.rect, "Restart?")){
			Application.LoadLevel( Application.loadedLevel );
		}
	}

	void gameOverScreen(){
		Debug.Log("game over");
		LeanTween.move(gameOverButton, new Vector2(Screen.width*0.4f, gameOverButton.y), 1f).setEase(gameOverEase);
	}
	
}
