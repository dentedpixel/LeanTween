public var grumpy:Texture2D;
public var beauty:Texture2D;

private var w:float = Screen.width;
private var h:float = Screen.height;

private var buttonRect1:LTRect;
private var buttonRect2:LTRect;
private var grumpyRect:LTRect;
private var beautyTileRect:LTRect;

function Start () {
	w = Screen.width;
	h = Screen.height;
	buttonRect1 = new LTRect(0.15*w, 0.75*h, 0.3*w, 0.2*h );
	buttonRect2 = new LTRect(1.2*w, 0.75*h, 0.3*w, 0.2*h );

	grumpyRect = new LTRect(0.5*w - grumpy.width/2.0, 0.5*h - grumpy.height/2.0, grumpy.width, grumpy.height );
	beautyTileRect = new LTRect(0,0,1,1 );

	LeanTween.move( buttonRect2, Vector2(0.55*w, buttonRect2.rect.y), 0.7, {"ease":LeanTween.easeOutQuad} );
}

function OnGUI(){
	GUI.DrawTexture( grumpyRect.rect, grumpy);

	if(GUI.Button(buttonRect1.rect, "Scale Centered")){
		LeanTween.scale( buttonRect1, Vector2(buttonRect1.rect.width, buttonRect1.rect.height) * 1.2, 0.25, {"ease":LeanTween.easeOutQuad} );
		LeanTween.move( buttonRect1, Vector2(buttonRect1.rect.x-buttonRect1.rect.width*0.1, buttonRect1.rect.y-buttonRect1.rect.height*0.1), 0.25, {"ease":LeanTween.easeOutQuad} );
	}

	if(GUI.Button(buttonRect2.rect, "Scale")){
		LeanTween.scale( buttonRect2, Vector2(buttonRect2.rect.width, buttonRect2.rect.height) * 1.2, 0.25, {"ease":LeanTween.easeOutBounce} );
	}

	var staticRect:Rect = Rect(0.0*w, 0.0*h, 0.2*w, 0.2*h);
	if(GUI.Button( staticRect, "Move Cat")){
		if(LeanTween.isTweening(grumpyRect)==false){ // Check to see if the cat is already tweening, so it doesn't freak out
			var orig:Vector2 = Vector2( grumpyRect.rect.x, grumpyRect.rect.y );
			LeanTween.move( grumpyRect, Vector2( 1.0*w - grumpy.width, 0.0*h ), 1.0, {"ease":LeanTween.easeOutBounce} );
			LeanTween.move( grumpyRect, orig, 1.0, {"ease":LeanTween.easeOutBounce, "delay":1.0} );
		}
	}

	staticRect = Rect(0.8*w, 0.0*h, 0.2*w, 0.2*h);
	if(GUI.Button( staticRect, "Flip Tile")){
		LeanTween.move( beautyTileRect, Vector2( 0, beautyTileRect.rect.y + 1 ), 1.0, {"ease":LeanTween.easeOutBounce} );
	}

	GUI.DrawTextureWithTexCoords( Rect(0.8*w, 0.5*h - beauty.height/2.0, beauty.width*0.5, beauty.height*0.5 ), beauty, beautyTileRect.rect);


}