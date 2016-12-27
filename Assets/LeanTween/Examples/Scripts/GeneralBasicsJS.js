#pragma strict
import DentedPixel;

public var prefabAvatar:GameObject;

function Start () {
	// Setup
	var avatarRotate:GameObject = GameObject.Find("AvatarRotate");
	var avatarScale:GameObject = GameObject.Find("AvatarScale");
	var avatarMove:GameObject = GameObject.Find("AvatarMove");

	// Rotate Example
	LeanTween.rotateAround( avatarRotate, Vector3.forward, 360f, 5f);

	// Scale Example
	LeanTween.scale( avatarScale, new Vector3(1.7f, 1.7f, 1.7f), 5f).setEase(LeanTweenType.easeOutBounce);
	LeanTween.moveX( avatarScale, avatarScale.transform.position.x + 5f, 5f).setEase(LeanTweenType.easeOutBounce); // Simultaneously target many different tweens on the same object 

	// Move Example
	LeanTween.move( avatarMove, avatarMove.transform.position + new Vector3(-9f, 0f, 1f), 2f).setEase(LeanTweenType.easeInQuad);

	// Delay
	LeanTween.move( avatarMove, avatarMove.transform.position + new Vector3(-6f, 0f, 1f), 2f).setDelay(3f);

	// Chain properties (delay, easing with a set repeating of type ping pong)
	LeanTween.scale( avatarScale, new Vector3(0.2f, 0.2f, 0.2f), 1f).setDelay(7f).setEase(LeanTweenType.easeInOutCirc).setRepeat(5).setLoopPingPong();

	// Call methods after a certain time period
	LeanTween.delayedCall(gameObject, 0.2f, advancedExamples);
}

// Advanced Examples
// It might be best to master the basics first, but this is included to tease the many possibilies LeanTween provides.

function advancedExamples(){
	LeanTween.delayedCall(gameObject, 14f, function(){
		for(var i:int=0; i < 10; i++){
			// Instantiate Container
			var rotator:GameObject = new GameObject("rotator"+i);
			rotator.transform.position = new Vector3(10.2f,2.85f,0f);

			// Instantiate Avatar
			var dude:GameObject = GameObject.Instantiate(prefabAvatar, Vector3.zero, prefabAvatar.transform.rotation ) as GameObject;
			dude.transform.parent = rotator.transform;
			dude.transform.localPosition = new Vector3(0f,1.5f,2.5f*i);

			// Scale, pop-in
			dude.transform.localScale = new Vector3(0f,0f,0f);
			LeanTween.scale(dude, new Vector3(0.65f,0.65f,0.65f), 1f).setDelay(i*0.2f).setEase(LeanTweenType.easeOutBack);

			// Color like the rainbow
			var period:float = LeanTween.tau/10*i;
			var red:float   = Mathf.Sin(period + LeanTween.tau*0f/3f) * 0.5f + 0.5f;
  			var green:float = Mathf.Sin(period + LeanTween.tau*1f/3f) * 0.5f + 0.5f;
  			var blue:float  = Mathf.Sin(period + LeanTween.tau*2f/3f) * 0.5f + 0.5f;
			var rainbowColor:Color = new Color(red, green, blue);
			LeanTween.color(dude, rainbowColor, 0.3f).setDelay(1.2f + i*0.4f);
			
			// Push into the wheel
			LeanTween.moveZ(dude, 0f, 0.3f).setDelay(1.2f + i*0.4f).setEase(LeanTweenType.easeSpring).setOnComplete(
				function( rot:GameObject ){
					LeanTween.rotateAround(rot, Vector3.forward, -1080f, 12f);
				}
			).setOnCompleteParam( rotator );

			// Jump Up and back down
			LeanTween.moveLocalY(dude,4f,1.2f).setDelay(5f + i*0.2f).setLoopPingPong().setRepeat(2).setEase(LeanTweenType.easeInOutQuad);
		
			// Alpha Out, and destroy
			LeanTween.alpha(dude, 0f, 0.6f).setDelay(9.2f + i*0.4f).setDestroyOnComplete(true).setOnComplete(
				function(rot:GameObject){
					Destroy( rot ); // destroying parent as well
				}
			).setOnCompleteParam( rotator );	
		}

	}).setOnCompleteOnStart(true).setRepeat(-1); // Have the OnComplete play in the beginning and have the whole group repeat endlessly
}