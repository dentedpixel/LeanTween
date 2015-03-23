using UnityEngine;
using System.Collections;

public class TempTestingCancel : MonoBehaviour {
    public bool isTweening = false;
    public bool tweenOverride = false;
    private LTDescr tween;
 
    // Use this for initialization
    void Start () {
        tween = LeanTween.move(gameObject, transform.position + Vector3.one*3f, Random.Range(2,2) ).setRepeat(-1).setLoopClamp ();
    }
 
    public void Update () {
        if(tween != null){
            isTweening = LeanTween.isTweening(gameObject);
            if(tweenOverride){
             
                // this next line works  
                //tween.cancel();
 
                // this one doesn't
                LeanTween.cancel(gameObject);
            }
        }
    }
}

public class TestingEverything : MonoBehaviour {

	public GameObject cube1;
	public GameObject cube2;
	public GameObject cube3;


	private bool eventGameObjectWasCalled = false, eventGeneralWasCalled = false;
	private LTDescr lt1;
	private LTDescr lt2;
	private LTDescr lt3;
	private LTDescr lt4;
	private LTDescr[] groupTweens;
	private GameObject[] groupGOs;
	private int groupTweensCnt;
	private int rotateRepeat;
	private int rotateRepeatAngle;

	void Start () {
		LeanTest.expected = 22;

		// add a listener
		LeanTween.addListener(cube1, 0, eventGameObjectCalled);

		LeanTest.debug("NOTHING TWEEENING AT BEGINNING", LeanTween.isTweening() == false );

		LeanTest.debug("OBJECT NOT TWEEENING AT BEGINNING", LeanTween.isTweening(cube1) == false );

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
		LeanTween.move( cube2, new Vector3(-3f,-2f,-0.5f), 1.1f );

		LeanTween.reset();

		// ping pong

		// rotateAround, Repeat, DestroyOnComplete
		rotateRepeat = rotateRepeatAngle = 0;
		LeanTween.rotateAround(cube3, Vector3.forward, 360f, 0.1f).setRepeat(3).setOnComplete(rotateRepeatFinished).setOnCompleteOnRepeat(true).setDestroyOnComplete(true);
		LeanTween.delayedCall(0.1f*8f, rotateRepeatAllFinished);

		// test all onUpdates and onCompletes are removed when tween is initialized

		StartCoroutine( timeBasedTesting() );
	}

	IEnumerator timeBasedTesting(){
		yield return new WaitForEndOfFrame();
		yield return new WaitForEndOfFrame();

		// Groups of tweens testing
		groupTweens = new LTDescr[ 300 ];
		groupGOs = new GameObject[ groupTweens.Length ];
		groupTweensCnt = 0;
		int descriptionMatchCount = 0;
		for(int i = 0; i < groupTweens.Length; i++){
			GameObject cube = GameObject.CreatePrimitive(PrimitiveType.Cube);
			Destroy( cube.GetComponent( typeof(BoxCollider) ) as Component );
			cube.transform.position = new Vector3(0,0,i*3);
			cube.name = "c"+i;
			groupGOs[i] = cube;
			groupTweens[i] = LeanTween.move(cube, transform.position + Vector3.one*3f, 0.6f ).setOnComplete(groupTweenFinished);

			if(LeanTween.description(groupTweens[i].id).trans==groupTweens[i].trans)
				descriptionMatchCount++;
		}
		LeanTween.delayedCall(0.82f, groupTweensFinished);

		LeanTest.debug("GROUP IDS MATCH", descriptionMatchCount==groupTweens.Length );
		LeanTest.debug("MAX SEARCH OPTIMIZED", LeanTween.maxSearch<=groupTweens.Length+5, "maxSearch:"+LeanTween.maxSearch );
		LeanTest.debug("SOMETHING IS TWEENING", LeanTween.isTweening() == true );

		// resume item before calling pause should continue item along it's way
		float previousXLT3 = cube3.transform.position.x;
		lt3 = LeanTween.moveX( cube3, 5.0f, 1.1f);
		lt3.resume();

		yield return new WaitForEndOfFrame();
		yield return new WaitForEndOfFrame();

		lt1.cancel();
		LeanTween.cancel(cube2);

		int tweenCount = 0;
		for(int i = 0; i < groupTweens.Length; i++){
			if(LeanTween.isTweening( groupGOs[i] ))
				tweenCount++;
			if(i%3==0)
				LeanTween.pause( groupGOs[i] );
			else if(i%3==1)
				groupTweens[i].pause();
			else
				LeanTween.pause( groupTweens[i].id );
		}
		LeanTest.debug("GROUP ISTWEENING", tweenCount==groupTweens.Length, "expected "+groupTweens.Length+" tweens but got "+tweenCount );

		LeanTest.debug("RESUME OUT OF ORDER", previousXLT3!=cube3.transform.position.x, "previousXLT3:"+previousXLT3+" cube3.transform.position.x:"+cube3.transform.position.x);

		yield return new WaitForEndOfFrame();

		tweenCount = 0;
		for(int i = 0; i < groupTweens.Length; i++){
			if(i%3==0)
				LeanTween.resume( groupGOs[i] );
			else if(i%3==1)
				groupTweens[i].resume();
			else
				LeanTween.resume( groupTweens[i].id );

			if(i%2==0 ? LeanTween.isTweening( groupTweens[i].id ) : LeanTween.isTweening( groupGOs[i] ) )
				tweenCount++;
		}
		LeanTest.debug("GROUP RESUME", tweenCount==groupTweens.Length );

		LeanTest.debug("CANCEL TWEEN LTDESCR", LeanTween.isTweening(cube1)==false );
		LeanTest.debug("CANCEL TWEEN LEANTWEEN", LeanTween.isTweening(cube2)==false );

		Time.timeScale = 0.25f;
		float start = Time.realtimeSinceStartup;
		LeanTween.moveX(cube1, -5f, 0.2f).setOnComplete( ()=>{
			float end = Time.realtimeSinceStartup;
			float diff = end - start;
			LeanTest.debug("SCALED TIMING diff:"+diff, Mathf.Abs(0.8f - diff) < 0.05f, "expected to complete in 0.8f but completed in "+diff );
			LeanTest.debug("SCALED ENDING POSITION", Mathf.Approximately(cube1.transform.position.x, -5f), "expected to end at -5f, but it ended at "+cube1.transform.position.x);
		});

		int ltCount = 0;
		GameObject[] allGos = FindObjectsOfType(typeof(GameObject)) as GameObject[];
        foreach (GameObject go in allGos) {
            if(go.name == "~LeanTween")
		     	ltCount++;
        }
		LeanTest.debug("RESET CORRECTLY CLEANS UP", ltCount==1 );
	}

	void rotateRepeatFinished(){
		if( Mathf.Abs(cube3.transform.eulerAngles.z)<0.0001f )
			rotateRepeatAngle++;
		rotateRepeat++;
	}

	void rotateRepeatAllFinished(){
		LeanTest.debug("ROTATE AROUND MULTIPLE", rotateRepeatAngle==3, "expected 3 times received "+rotateRepeatAngle+" times" );
		LeanTest.debug("ROTATE REPEAT", rotateRepeat==3 );
		LeanTest.debug("DESTROY ON COMPLETE", cube3==null, "cube3:"+cube3 );
	}

	void groupTweenFinished(){
		groupTweensCnt++;
	}

	void groupTweensFinished(){
		LeanTest.debug("GROUP FINISH", groupTweensCnt==groupTweens.Length, "expected "+groupTweens.Length+" tweens but got "+groupTweensCnt);
	}

	void eventGameObjectCalled( LTEvent e ){
		eventGameObjectWasCalled = true;
	}

	void eventGeneralCalled( LTEvent e ){
		eventGeneralWasCalled = true;
	}

}
