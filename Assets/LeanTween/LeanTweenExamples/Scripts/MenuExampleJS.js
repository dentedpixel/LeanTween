public var grumpy:Texture2D;
public var beauty:Texture2D;

private var w:float = Screen.width;
private var h:float = Screen.height;

private var buttonRect1:LTRect;
private var buttonRect2:LTRect;
private var buttonRect3:LTRect;
private var buttonRect4:LTRect;
private var grumpyRect:LTRect;
private var beautyTileRect:LTRect;

function Start () {
	w = Screen.width;
	h = Screen.height;
	buttonRect1 = new LTRect(0.10*w, 0.8*h, 0.25*w, 0.14*h );
	buttonRect2 = new LTRect(1.2*w, 0.8*h, 0.2*w, 0.14*h );
	buttonRect3 = new LTRect(0.35*w, 0.0*h, 0.3*w, 0.2*h );
	buttonRect4 = new LTRect(0.0*w, 0.4*h, 0.3*w, 0.2*h, 1.0, 15.0 );

	grumpyRect = new LTRect(0.5*w - grumpy.width/2.0, 0.5*h - grumpy.height/2.0, grumpy.width, grumpy.height );
	beautyTileRect = new LTRect(0,0,1,1 );

	LeanTween.move( buttonRect2, Vector2(0.55*w, buttonRect2.rect.y), 0.7f ).setEase(LeanTweenType.easeOutQuad);
}

function OnGUI(){    
	var staticRect:Rect = Rect(0.0*w, 0.0*h, 0.2*w, 0.14*h);
	if(GUI.Button( staticRect, "Move Cat")){
		if(LeanTween.isTweening(grumpyRect)==false){ // Check to see if the cat is already tweening, so it doesn't freak out
			var orig:Vector2 = Vector2( grumpyRect.rect.x, grumpyRect.rect.y );
			LeanTween.move( grumpyRect, Vector2( 1.0*w - grumpy.width, 0.0*h ), 1.0).setEase(LeanTweenType.easeOutBounce) ;
			LeanTween.move( grumpyRect, orig, 1.0 ).setEase(LeanTweenType.easeOutBounce).setDelay(1.0);
		}
	}
	GUI.DrawTexture( grumpyRect.rect, grumpy);

	if(GUI.Button(buttonRect1.rect, "Scale Centered")){
		LeanTween.scale( buttonRect1, Vector2(buttonRect1.rect.width, buttonRect1.rect.height) * 1.2, 0.25 ).setEase(LeanTweenType.easeOutQuad);
		LeanTween.move( buttonRect1, Vector2(buttonRect1.rect.x-buttonRect1.rect.width*0.1, buttonRect1.rect.y-buttonRect1.rect.height*0.1), 0.25).setEase(LeanTweenType.easeOutQuad) ;
	}

	if(GUI.Button(buttonRect2.rect, "Scale")){
		LeanTween.scale( buttonRect2, Vector2(buttonRect2.rect.width, buttonRect2.rect.height) * 1.2, 0.25 ).setEase(LeanTweenType.easeOutBounce);
	}

	staticRect = Rect(0.76*w, 0.53*h, 0.2*w, 0.14*h);
	if(GUI.Button( staticRect, "Flip Tile")){
		LeanTween.move( beautyTileRect, Vector2( 0, beautyTileRect.rect.y + 1 ), 1.0 ).setEase(LeanTweenType.easeOutBounce);
	}

	GUI.DrawTextureWithTexCoords( Rect(0.8*w, 0.5*h - beauty.height/2.0, beauty.width*0.5, beauty.height*0.5 ), beauty, beautyTileRect.rect);


	if(GUI.Button(buttonRect3.rect, "Alpha")){
		LeanTween.alpha( buttonRect3, 0.0, 1.0 ).setEase(LeanTweenType.easeOutQuad);
		LeanTween.alpha( buttonRect3, 1.0, 1.0 ).setEase(LeanTweenType.easeOutQuad).setDelay(1.0);
	}
	GUI.color.a = 1.0; // Reset to normal alpha, otherwise other gui elements will be effected

	
	if(GUI.Button(buttonRect4.rect, "Rotate")){
		LeanTween.rotate( buttonRect4, 150.0, 1.0 ).setEase(LeanTweenType.easeOutElastic);
		LeanTween.rotate( buttonRect4, 0.0, 1.0 ).setEase(LeanTweenType.easeOutElastic).setDelay(1.0);
	}
	GUI.matrix = Matrix4x4.identity; // Reset to normal rotation, otherwise other gui elements will be effected

}