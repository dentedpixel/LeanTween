using UnityEngine;
using System.Collections;

public class TestingEverything : MonoBehaviour {

	public GameObject cube1;
	public GameObject cube2;

	private bool eventGameObjectWasCalled = false, eventGeneralWasCalled = false;
	private LTDescr lt1;
	private LTDescr lt2;
	private LTDescr lt3;
	private LTDescr lt4;
	// Use this for initialization
	void Start () {
		
		LeanTest.expected = 7;
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

		lt1 = LeanTween.move( cube1, new Vector3(3f,2f,0.5f), 1.1f );
		lt2 = LeanTween.move( cube2, new Vector3(-3f,-2f,-0.5f), 1.1f );

		StartCoroutine( timeBasedTesting() );
	}

	IEnumerator timeBasedTesting(){

		yield return new WaitForEndOfFrame();
		yield return new WaitForEndOfFrame();

		lt1.cancel();
		LeanTween.cancel(cube2);

		yield return new WaitForEndOfFrame();

		LeanTest.debug("CANCEL TWEEN LTDESCR", LeanTween.isTweening(cube1)==false );
		LeanTest.debug("CANCEL TWEEN LEANTWEEN", LeanTween.isTweening(cube2)==false );
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
