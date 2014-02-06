#pragma strict

private var towardsRotation:Vector3;
private var turnForLength:float = 0.5f;
private var turnForIter:float = 0f;
private var fromColor:Vector3;

// It's best to make this a public enum that you use throughout your project, so every class can have access to it
public enum MyEvents{ 
	CHANGE_COLOR,
	JUMP,
	LENGTH
}

function Awake(){
	LeanTween.LISTENERS_MAX = 100; // This is the maximum of event listeners you will have added as listeners
	LeanTween.EVENTS_MAX = MyEvents.LENGTH; // The maximum amount of events you will be dispatching

	fromColor = new Vector3(renderer.material.color.r, renderer.material.color.g, renderer.material.color.b);
}

function Start () {
	// Adding Listeners, it's best to use an enum so your listeners are more descriptive but you could use an int like 0,1,2,...
	LeanTween.addListener(gameObject, MyEvents.CHANGE_COLOR, changeColor);
	LeanTween.addListener(gameObject, MyEvents.JUMP, jumpUp);
}

// ****** Event Listening Methods

function jumpUp( e:LTEvent ){
	rigidbody.AddRelativeForce(Vector3.forward * 300f);
}

function changeColor( e:LTEvent ){
	var tran:Transform = e.data as Transform;
	var distance:float = Vector3.Distance( tran.position, transform.position);
	var to:Vector3 = new Vector3(Random.Range(0f,1f),0f,Random.Range(0f,1f));
	LeanTween.value( gameObject, updateColor, fromColor, to, 0.8f ).setRepeat(2).setLoopPingPong().setDelay(distance*0.05f);
}

function updateColor( v:Vector3 ){
	renderer.material.color = new Color( v.x, v.y, v.z );
}

// ****** Physics / AI Stuff

function OnCollisionEnter(collision:Collision) {
	if(collision.gameObject.layer!=2)
		towardsRotation = new Vector3(0f, 0f, Random.Range(-180, 180));
}

 function OnCollisionStay( collision:Collision ) {
 	if(collision.gameObject.layer!=2){
 		turnForIter = 0f;
    	turnForLength = Random.Range(0.5f, 1.5f);
    }
 }

function FixedUpdate(){
	if(turnForIter < turnForLength){
		rigidbody.MoveRotation( rigidbody.rotation * Quaternion.Euler(towardsRotation * Time.deltaTime ) );
		turnForIter += Time.deltaTime;
	}

	rigidbody.AddRelativeForce(Vector3.down * 4.5f);
}

// ****** Key and clicking detection

function OnMouseDown(){
	if(Input.GetKey( KeyCode.J )){ // Are you also pressing the "j" key while clicking
		LeanTween.dispatchEvent(MyEvents.JUMP);
	}else{
		LeanTween.dispatchEvent(MyEvents.CHANGE_COLOR, transform); // with every dispatched event, you can include an object (retrieve this object with the *.data var in LTEvent)
	}
}