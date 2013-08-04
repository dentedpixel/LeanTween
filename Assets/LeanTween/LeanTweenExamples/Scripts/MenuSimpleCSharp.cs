using UnityEngine;
using System.Collections;

public class MenuSimpleCSharp : MonoBehaviour {

private LTRect bRect = new LTRect( 0f, 0f, 100f, 50f );

void OnGUI(){
	if(GUI.Button(bRect.rect, "Scale")){
		LeanTween.scale( bRect, new Vector2(bRect.rect.width, bRect.rect.height) * 1.3f, 0.25f );
	}
}

}
