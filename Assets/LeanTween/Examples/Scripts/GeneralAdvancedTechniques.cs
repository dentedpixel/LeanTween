using UnityEngine;
using System.Collections;

public class GeneralAdvancedTechniques : MonoBehaviour {

	public GameObject avatarRecursive;
	public GameObject avatar2dRecursive;
	public RectTransform wingPersonPanel;
	public RectTransform textField;

	// Use this for initialization
	void Start () {
		// Recurision - Set a objects value and have it recursively effect it's children
		LeanTween.alpha( avatarRecursive, 0f, 1f).setRecursive(true).setLoopPingPong();
		LeanTween.alpha( avatar2dRecursive, 0f, 1f).setRecursive(true).setLoopPingPong();
		LeanTween.alpha( wingPersonPanel, 0f, 1f).setRecursive(true).setLoopPingPong();

		// Destroy on Complete - 

		// Chaining tweens together

		// setOnCompleteOnRepeat


	}
	
}
