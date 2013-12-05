#pragma strict

private var bRect:LTRect = new LTRect( 0, 0, 100, 50 );

function OnGUI(){
	if(GUI.Button(bRect.rect, "Scale")){
		LeanTween.scale( bRect, Vector2(bRect.rect.width, bRect.rect.height) * 1.3f, 0.25f);
	}
}