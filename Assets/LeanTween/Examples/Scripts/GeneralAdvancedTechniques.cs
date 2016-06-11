using UnityEngine;
using System.Collections;

public class GeneralAdvancedTechniques : MonoBehaviour {

	public GameObject avatarRecursive;
	public GameObject avatar2dRecursive;
	public RectTransform wingPersonPanel;
	public RectTransform textField;

	public GameObject avatarMove;
	public Transform[] movePts;

	// Use this for initialization
	void Start () {
		// Recurision - Set a objects value and have it recursively effect it's children
		LeanTween.alpha( avatarRecursive, 0f, 1f).setRecursive(true).setLoopPingPong();
		LeanTween.alpha( avatar2dRecursive, 0f, 1f).setRecursive(true).setLoopPingPong();
		LeanTween.alpha( wingPersonPanel, 0f, 1f).setRecursive(true).setLoopPingPong();

		// Destroy on Complete - 

		// Chaining tweens together

		// setOnCompleteOnRepeat


		// Move to path of transforms that are moving themselves
		LeanTween.value( avatarMove, 0f, (float)movePts.Length-1, 5f).setOnUpdate((float val)=>{
			int first = (int)Mathf.Floor(val);
			int next = first < movePts.Length-1 ? first + 1 : first;
			float diff = val - (float)first;
			// Debug.Log("val:"+val+" first:"+first+" next:"+next);
			Vector3 diffPos = (movePts[next].position-movePts[first].position);
			avatarMove.transform.position = movePts[first].position + diffPos*diff;
		}).setEase(LeanTweenType.easeInOutExpo).setRepeat(-1);

		// move the pts
		for(int i = 0; i < movePts.Length; i++)
			LeanTween.moveY( movePts[i].gameObject, movePts[i].position.y + 1.5f, 1f).setDelay(((float)i)*0.2f).setLoopPingPong();

	}
	
}
