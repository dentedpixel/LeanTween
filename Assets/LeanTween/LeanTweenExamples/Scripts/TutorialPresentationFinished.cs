using UnityEngine;
using System.Collections;

public class TutorialPresentationFinished : MonoBehaviour {

	public GameObject[] avatars;
	public AnimationCurve gameOverCurve;

	private LTRect gameOverButtonRect;

	// Use this for initialization
	void Start () {
		gameOverButtonRect = new LTRect(-Screen.width*0.5f, Screen.height*0.4f, Screen.width*0.2f, Screen.height*0.2f);

		for(int i = 0; i < avatars.Length; i++){
			LeanTween.moveY(avatars[i], avatars[i].transform.position.y+4f, 1f).setDelay(i*0.25f).setLoopPingPong().setRepeat(2).setEase(LeanTweenType.easeOutSine);
			LeanTween.rotate(avatars[i], avatars[i].transform.eulerAngles + new Vector3(45f,0f,0f), 1f).setLoopPingPong().setRepeat(2).setEase(LeanTweenType.easeInQuad);
		}

		LeanTween.delayedCall(gameObject, 5f, presentationOver);
	}

	void presentationOver(){
		LeanTween.move( gameOverButtonRect, new Vector2(Screen.width*0.4f,gameOverButtonRect.y), 0.5f).setEase(gameOverCurve);
	}

	void OnGUI(){
		if(GUI.Button(gameOverButtonRect.rect, "Play again?")){
			Application.LoadLevel( Application.loadedLevel );
		}
	}
	
}
