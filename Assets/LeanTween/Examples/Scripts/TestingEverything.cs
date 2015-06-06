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
	public GameObject cube4;


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
		LeanTest.timeout = 30f;
		LeanTest.expected = 25;

		LeanTween.init(6 + 1200);
		// add a listener
		LeanTween.addListener(cube1, 0, eventGameObjectCalled);

		LeanTest.expect(LeanTween.isTweening() == false, "NOTHING TWEEENING AT BEGINNING" );

		LeanTest.expect(LeanTween.isTweening(cube1) == false, "OBJECT NOT TWEEENING AT BEGINNING" );

		// dispatch event that is received
		LeanTween.dispatchEvent(0);
		LeanTest.expect( eventGameObjectWasCalled, "EVENT GAMEOBJECT RECEIVED" );

		// do not remove listener
		LeanTest.expect(LeanTween.removeListener(cube2, 0, eventGameObjectCalled)==false, "EVENT GAMEOBJECT NOT REMOVED" );
		// remove listener
		LeanTest.expect(LeanTween.removeListener(cube1, 0, eventGameObjectCalled), "EVENT GAMEOBJECT REMOVED" );

		// add a listener
		LeanTween.addListener(1, eventGeneralCalled);
		
		// dispatch event that is received
		LeanTween.dispatchEvent(1);
		LeanTest.expect( eventGeneralWasCalled, "EVENT ALL RECEIVED" );

		// remove listener
		LeanTest.expect( LeanTween.removeListener( 1, eventGeneralCalled), "EVENT ALL REMOVED" );

		lt1 = LeanTween.move( cube1, new Vector3(3f,2f,0.5f), 1.1f );
		LeanTween.move( cube2, new Vector3(-3f,-2f,-0.5f), 1.1f );

		LeanTween.reset();

		// ping pong

		// rotateAround, Repeat, DestroyOnComplete
		

		// test all onUpdates and onCompletes are removed when tween is initialized

		// Test LTBezierPath has correct halfway point

		LTSpline cr = new LTSpline( new Vector3[] {new Vector3(-1f,0f,0f), new Vector3(0f,0f,0f), new Vector3(4f,0f,0f), new Vector3(20f,0f,0f), new Vector3(30f,0f,0f)} );
		cr.place( cube4.transform, 0.5f );
		// Debug.Log("pos:"+cube4.transform.position);
		LeanTest.expect( (Vector3.Distance( cube4.transform.position, new Vector3(10f,0f,0f) ) <= 0.7f), "SPLINE POSITIONING", "position is:"+cube4.transform.position+" but should be:(10f,0f,0f)");
		LeanTween.color(cube4, Color.green, 0.01f);

		StartCoroutine( timeBasedTesting() );
	}

	IEnumerator timeBasedTesting(){
		yield return new WaitForEndOfFrame();

		Time.timeScale = 4f;

		// Groups of tweens testing
		groupTweens = new LTDescr[ 1200 ];
		groupGOs = new GameObject[ groupTweens.Length ];
		groupTweensCnt = 0;
		int descriptionMatchCount = 0;
		for(int i = 0; i < groupTweens.Length; i++){
			GameObject cube = GameObject.CreatePrimitive(PrimitiveType.Cube);
			Destroy( cube.GetComponent( typeof(BoxCollider) ) as Component );
			cube.transform.position = new Vector3(0,0,i*3);
			cube.name = "c"+i;
			groupGOs[i] = cube;
		}

		yield return new WaitForEndOfFrame();

		bool hasGroupTweensCheckStarted = false;
		for(int i = 0; i < groupTweens.Length; i++){
			groupTweens[i] = LeanTween.move(groupGOs[i], transform.position + Vector3.one*3f, 3f ).setOnComplete( ()=>{
				if(hasGroupTweensCheckStarted==false){
					hasGroupTweensCheckStarted = true;
					LeanTween.delayedCall(gameObject, 0.1f, groupTweensFinished);
				}
				groupTweensCnt++;
			});

			if(LeanTween.description(groupTweens[i].id).trans==groupTweens[i].trans)
				descriptionMatchCount++;
		}

		while (LeanTween.tweensRunning<groupTweens.Length)
			yield return null;

		LeanTest.expect( descriptionMatchCount==groupTweens.Length, "GROUP IDS MATCH" );
		LeanTest.expect( LeanTween.maxSearch<=groupTweens.Length+5, "MAX SEARCH OPTIMIZED", "maxSearch:"+LeanTween.maxSearch );
		LeanTest.expect( LeanTween.isTweening() == true, "SOMETHING IS TWEENING" );

		// resume item before calling pause should continue item along it's way
		float previousXlt4 = cube4.transform.position.x;
		lt4 = LeanTween.moveX( cube4, 5.0f, 1.1f).setOnComplete( ()=>{
			LeanTest.expect( cube4!=null && previousXlt4!=cube4.transform.position.x, "RESUME OUT OF ORDER", "cube4:"+cube4+" previousXlt4:"+previousXlt4+" cube4.transform.position.x:"+(cube4!=null ? cube4.transform.position.x : 0));
		});
		lt4.resume();

		rotateRepeat = rotateRepeatAngle = 0;
		LeanTween.rotateAround(cube3, Vector3.forward, 360f, 0.1f).setRepeat(3).setOnComplete(rotateRepeatFinished).setOnCompleteOnRepeat(true).setDestroyOnComplete(true);
		yield return new WaitForEndOfFrame();
		LeanTween.delayedCall(0.1f*8f, rotateRepeatAllFinished);

		int countBeforeCancel = LeanTween.tweensRunning;
		lt1.cancel( cube1 );
		LeanTest.expect( countBeforeCancel==LeanTween.tweensRunning, "CANCEL AFTER RESET SHOULD FAIL", "expected "+countBeforeCancel+" but got "+LeanTween.tweensRunning);
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
		LeanTest.expect( tweenCount==groupTweens.Length, "GROUP ISTWEENING", "expected "+groupTweens.Length+" tweens but got "+tweenCount );

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
		LeanTest.expect( tweenCount==groupTweens.Length, "GROUP RESUME" );

		LeanTest.expect( LeanTween.isTweening(cube1)==false, "CANCEL TWEEN LTDESCR" );
		LeanTest.expect( LeanTween.isTweening(cube2)==false, "CANCEL TWEEN LEANTWEEN" );

		yield return new WaitForEndOfFrame();
		Time.timeScale = 0.25f;
		float tweenTime = 0.2f;
		float expectedTime = tweenTime * (1f/Time.timeScale);
		float start = Time.realtimeSinceStartup;
		bool onUpdateWasCalled = false;
		LeanTween.moveX(cube1, -5f, tweenTime).setOnUpdate( (float val)=>{
			onUpdateWasCalled = true;
		}).setOnComplete( ()=>{
			float end = Time.realtimeSinceStartup;
			float diff = end - start;
			
			LeanTest.expect( Mathf.Abs( expectedTime - diff) < 0.05f, "SCALED TIMING DIFFERENCE", "expected to complete in roughly "+expectedTime+" but completed in "+diff );
			LeanTest.expect( Mathf.Approximately(cube1.transform.position.x, -5f), "SCALED ENDING POSITION", "expected to end at -5f, but it ended at "+cube1.transform.position.x);
			LeanTest.expect( onUpdateWasCalled, "ON UPDATE FIRED" );
		});

		yield return new WaitForSeconds( expectedTime );
		Time.timeScale = 1f;

		int ltCount = 0;
		GameObject[] allGos = FindObjectsOfType(typeof(GameObject)) as GameObject[];
        foreach (GameObject go in allGos) {
            if(go.name == "~LeanTween")
		     	ltCount++;
        }
		LeanTest.expect( ltCount==1, "RESET CORRECTLY CLEANS UP" );


		lotsOfCancels();
	}

	IEnumerator lotsOfCancels(){
		yield return new WaitForEndOfFrame();

		Time.timeScale = 4f;
		int cubeCount = 10;

		LTDescr[] tweensA = new LTDescr[ cubeCount ];
		GameObject[] aGOs = new GameObject[ cubeCount ];
		for(int i = 0; i < aGOs.Length; i++){
			GameObject cube = GameObject.CreatePrimitive(PrimitiveType.Cube);
			Destroy( cube.GetComponent( typeof(BoxCollider) ) as Component );
			cube.transform.position = new Vector3(0,0,i*2f);
			cube.name = "a"+i;
			aGOs[i] = cube;
			tweensA[i] = LeanTween.move(cube, cube.transform.position + new Vector3(10f,0,0), 0.5f + 1f * (1.0f/(float)aGOs.Length) );
			LeanTween.color(cube, Color.red, 0.01f);
		}

		yield return new WaitForSeconds(1.0f);

		LTDescr[] tweensB = new LTDescr[ cubeCount ];
		GameObject[] bGOs = new GameObject[ cubeCount ];
		for(int i = 0; i < bGOs.Length; i++){
			GameObject cube = GameObject.CreatePrimitive(PrimitiveType.Cube);
			Destroy( cube.GetComponent( typeof(BoxCollider) ) as Component );
			cube.transform.position = new Vector3(0,0,i*2f);
			cube.name = "b"+i;
			bGOs[i] = cube;
			tweensB[i] = LeanTween.move(cube, cube.transform.position + new Vector3(10f,0,0), 2f);
		}

		for(int i = 0; i < aGOs.Length; i++){
			tweensA[i].cancel( aGOs[i] );
			GameObject cube = aGOs[i];
			tweensA[i] = LeanTween.move(cube, new Vector3(0,0,i*2f), 2f);
		}

		yield return new WaitForSeconds(0.5f);

		for(int i = 0; i < aGOs.Length; i++){
			tweensA[i].cancel( aGOs[i] );
			GameObject cube = aGOs[i];
			tweensA[i] = LeanTween.move(cube, new Vector3(0,0,i*2f) + new Vector3(10f,0,0), 2f );
		}

		for(int i = 0; i < bGOs.Length; i++){
			tweensB[i].cancel( bGOs[i] );
			GameObject cube = bGOs[i];
			tweensB[i] = LeanTween.move(cube, new Vector3(0,0,i*2f), 2f );
		}

		yield return new WaitForSeconds(2.1f);

		bool inFinalPlace = true;
		for(int i = 0; i < aGOs.Length; i++){
			if(Vector3.Distance( aGOs[i].transform.position, new Vector3(0,0,i*2f) + new Vector3(10f,0,0) ) > 0.1f)
				inFinalPlace = false;
		}

		for(int i = 0; i < bGOs.Length; i++){
			if(Vector3.Distance( bGOs[i].transform.position, new Vector3(0,0,i*2f) ) > 0.1f)
				inFinalPlace = false;
		}

		LeanTest.expect(inFinalPlace,"AFTER LOTS OF CANCELS");
	}

	void rotateRepeatFinished(){
		if( Mathf.Abs(cube3.transform.eulerAngles.z)<0.0001f )
			rotateRepeatAngle++;
		rotateRepeat++;
	}

	void rotateRepeatAllFinished(){
		LeanTest.expect( rotateRepeatAngle==3, "ROTATE AROUND MULTIPLE", "expected 3 times received "+rotateRepeatAngle+" times" );
		LeanTest.expect( rotateRepeat==3, "ROTATE REPEAT" );
		LeanTest.expect( cube3==null, "DESTROY ON COMPLETE", "cube3:"+cube3 );
	}

	void groupTweensFinished(){
		LeanTest.expect( groupTweensCnt==groupTweens.Length, "GROUP FINISH", "expected "+groupTweens.Length+" tweens but got "+groupTweensCnt);
	}

	void eventGameObjectCalled( LTEvent e ){
		eventGameObjectWasCalled = true;
	}

	void eventGeneralCalled( LTEvent e ){
		eventGeneralWasCalled = true;
	}

}
