using UnityEngine;
using UnityEditor;
using System.Collections;

public class LeanTweenPreferencesEditor : EditorWindow
{
	bool useNameSpace = false;
	string[] fileCacheLines;

	string[] ltFiles = new string[]{ "LeanTween.cs", "LTDescr.cs", "LTDescrOptional.cs" };

	private string ltPath;

	[MenuItem ("Edit/LeanTween Preferences")]
	public static void  ShowWindow () {
		EditorWindow.GetWindow(typeof(LeanTweenPreferencesEditor));
	}

	void OnGUI () {
		ltPath = Application.platform == RuntimePlatform.WindowsEditor ? "\\Plugins\\LeanTween\\" : "/Plugins/LeanTween/";

		GUILayout.Label ("LeanTween Settings", EditorStyles.boldLabel);

		if (fileCacheLines == null) { // Initial setup of preferences
			string path = Application.dataPath + ltPath + ltFiles[0];

			fileCacheLines = System.IO.File.ReadAllLines (path);

			useNameSpace = fileCacheLines [0].IndexOf ("//") != 0;
		}

		bool useNameSpaceChanged = EditorGUILayout.Toggle( new GUIContent("Use Namespace", "Adds 'com.dentedpixel' namespace to all LeanTween files"), useNameSpace);
	
		if (useNameSpace != useNameSpaceChanged) {
			useNameSpace = useNameSpaceChanged;

			// Loop through files either turning on or off the namespace
//			Debug.Log("updating namespace...");
			for (int i = 0; i < ltFiles.Length; i++) {
				string filePath = Application.dataPath + ltPath + ltFiles[i];
				string[] lines = System.IO.File.ReadAllLines (filePath);
				lines [0] = toggleComment (lines [0], !useNameSpace);
//				Debug.Log ("new line:" + lines [0]);	
				lines [lines.Length-1] = toggleComment (lines [lines.Length-1], !useNameSpace);
				System.IO.File.WriteAllLines (filePath, lines);
			}

			AssetDatabase.Refresh ();
		}
		// LeanTween Location: Plugins/LeanTween
		// Default max tweens
		// Uses LTGUI

//		if (GUILayout.Button ("Run Tween")) {
//			GameObject box = GameObject.CreatePrimitive(PrimitiveType.Cube);
//			LeanTween.moveX (box, 100f, 2f);
//		}
	}

	private string toggleComment( string line, bool commentOut ){
		if (commentOut) { // commenting out
			return "//" + line;
		} else { // uncommenting
			return line.Replace ("//", "");
		}
	}
}
