using UnityEngine;
using System.Collections;

public class MenuExampleCSharp : MonoBehaviour {
	public Texture2D grumpy;

	private LTRect buttonRect1;
	private LTRect buttonRect2;
	private LTRect grumpyRect;


	// Use this for initialization
	void Start () {
		buttonRect1 = new LTRect(0.25f*Screen.width, 0.75f*Screen.height, 0.2f*Screen.width, 0.2f*Screen.height );
		buttonRect2 = new LTRect(1.2f*Screen.width, 0.75f*Screen.height, 0.2f*Screen.width, 0.2f*Screen.height );
		
		grumpyRect = new LTRect(0.5f*Screen.width - grumpy.width/2.0f, 0.5f*Screen.height - grumpy.height/2.0f, grumpy.width, grumpy.height );


		Hashtable optional = new Hashtable();
		optional.Add("ease",LeanTweenType.easeOutBounce);
		LeanTween.move( buttonRect2, new Vector2(0.6f*Screen.width, buttonRect2.rect.y), 0.7f, optional);
	}
	
	// Update is called once per frame
	void OnGUI () {
		Hashtable optional;
		if(GUI.Button(buttonRect1.rect, "Scale Centered")){
			// Pass the LTRect object to many of LeanTween's standard animation functions for fun animation effects
			optional = new Hashtable();
			optional.Add("ease",LeanTweenType.easeOutQuad);
			LeanTween.scale( buttonRect1, new Vector2(buttonRect1.rect.width, buttonRect1.rect.height) * 1.2f, 0.25f, optional );
			
			optional = new Hashtable();
			optional.Add("ease",LeanTweenType.easeOutQuad);
			LeanTween.move( buttonRect1, new Vector2(buttonRect1.rect.x-buttonRect1.rect.width*0.1f, buttonRect1.rect.y-buttonRect1.rect.height*0.1f), 0.25f, optional );
		}


		if(GUI.Button(buttonRect2.rect, "Scale")){
			optional = new Hashtable();
			optional.Add("ease",LeanTweenType.easeOutBounce);
			LeanTween.scale( buttonRect2, new Vector2(buttonRect2.rect.width, buttonRect2.rect.height) * 1.2f, 0.25f, optional );
		}

		GUI.DrawTexture( grumpyRect.rect, grumpy);

		Rect staticRect = new Rect(0.1f*Screen.width, 0.1f*Screen.height, 0.2f*Screen.width, 0.2f*Screen.height);
		if(GUI.Button( staticRect, "Move Cat")){
			if(LeanTween.isTweening(grumpyRect)==false){ // Check to see if the cat is already tweening, so it doesn't freak out
				Vector2 orig = new Vector2( grumpyRect.rect.x, grumpyRect.rect.y );
				optional = new Hashtable();
				optional.Add("ease",LeanTweenType.easeOutBounce);
				LeanTween.move( grumpyRect, new Vector2( 1.0f*Screen.width - grumpy.width, 0.0f*Screen.height ), 1.0f, optional );

				optional = new Hashtable();
				optional.Add("ease",LeanTweenType.easeOutBounce);
				optional.Add("delay",1.0f);
				LeanTween.move( grumpyRect, orig, 1.0f, optional );
			}
		}
	}
}
