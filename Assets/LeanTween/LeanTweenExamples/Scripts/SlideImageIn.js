#pragma strict

public var grumpy:Texture2D;

private var grumpyRect:LTRect;

function Start () {
	grumpyRect = new LTRect( -grumpy.width, 0.5*Screen.height - grumpy.height/2.0, grumpy.width, grumpy.height );

	// Slide in
	LeanTween.move(grumpyRect, new Vector2(0.5*Screen.width - grumpy.width/2.0, grumpyRect.rect.y ), 1.0, ["ease",LeanTweenType.easeOutQuad]);
}

function OnGUI(){
	GUI.DrawTexture( grumpyRect.rect, grumpy);
}