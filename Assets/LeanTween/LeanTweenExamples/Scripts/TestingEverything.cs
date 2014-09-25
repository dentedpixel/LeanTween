using UnityEngine;
using System.Collections;

public class TestingEverything : MonoBehaviour {

	public GameObject cube1;
	public GameObject cube2;

	private bool eventGameObjectWasCalled = false, eventGeneralWasCalled = false;
	// Use this for initialization
	void Start () {
		
		LeanTest.expected = 5;
		// add a listener
		LeanTween.addListener(cube1, 0, eventGameObjectCalled);

		// dispatch event that is received
		LeanTween.dispatchEvent(0);
		LeanTest.debug("EVENT GAMEOBJECT RECEIVED", eventGameObjectWasCalled );

		// do not remove listener
		LeanTest.debug("EVENT GAMEOBJECT NOT REMOVED", LeanTween.removeListener(cube2, 0, eventGameObjectCalled)==false );
		// remove listener
		LeanTest.debug("EVENT GAMEOBJECT REMOVED", LeanTween.removeListener(cube1, 0, eventGameObjectCalled) );

		// add a listener
		LeanTween.addListener(1, eventGeneralCalled);
		
		// dispatch event that is received
		LeanTween.dispatchEvent(1);
		LeanTest.debug("EVENT ALL RECEIVED", eventGeneralWasCalled );

		// remove listener
		LeanTest.debug("EVENT ALL REMOVED", LeanTween.removeListener( 1, eventGeneralCalled) );



		StartCoroutine( timeBasedTesting() );
	}

	IEnumerator timeBasedTesting(){

		yield return new WaitForSeconds(1);
	}

	void eventGameObjectCalled( LTEvent e ){
		eventGameObjectWasCalled = true;
	}

	void eventGeneralCalled( LTEvent e ){
		eventGeneralWasCalled = true;
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
