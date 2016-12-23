using UnityEngine;
using UnityEditor;
using System.Collections;

public class LeanTweenPreferencesEditor : EditorWindow
{
	[MenuItem ("Edit/LeanTween Preferences")]

	public static void  ShowWindow () {
		EditorWindow.GetWindow(typeof(LeanTweenPreferencesEditor));
	}

	bool useNameSpace = false;
	string[] fileCacheLines;

	void OnGUI () {
		GUILayout.Label ("LeanTween Settings", EditorStyles.boldLabel);

//		if (fileCacheLines == null) {
			string path = Application.dataPath + "/Plugins/LeanTween/LeanTween.cs";

//			Debug.Log ("path:" + path);
			fileCacheLines = System.IO.File.ReadAllLines (path);
			Debug.Log ("firsts:" + fileCacheLines [0] + " lasts:"+fileCacheLines [fileCacheLines.Length-1]);

			useNameSpace = fileCacheLines [0].IndexOf ("//") != 0;
//		}

		useNameSpace = EditorGUILayout.Toggle( new GUIContent("Use name space", "Adds 'com.dentedpixel' namespace to all LeanTween files"), useNameSpace);
	
		// LeanTween Location: Plugins/LeanTween
		// Default max tweens
		// Uses LTGUI

//		if (GUILayout.Button ("Run Tween")) {
//			GameObject box = GameObject.CreatePrimitive(PrimitiveType.Cube);
//			LeanTween.moveX (box, 100f, 2f);
//		}
	}
}
