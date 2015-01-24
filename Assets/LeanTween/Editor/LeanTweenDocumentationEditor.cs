using UnityEngine;
using System.Collections;
using UnityEditor;

public class LeanTweenDocumentationEditor : Editor {

	[MenuItem ("Lean/LeanTween Documentation")]
	static void openDocumentation()
	{
		string documentationPath = "file://"+Application.dataPath + "/LeanTween/LeanTweenDocumentation/index.html";
		Application.OpenURL(documentationPath);
	}

	[MenuItem ("Lean/LeanTween Forum (ask questions)")]
	static void openForum()
	{
		Application.OpenURL("http://forum.unity3d.com/threads/leantween-a-tweening-engine-that-is-up-to-5x-faster-than-competing-engines.161113/");
	}

	[MenuItem ("Lean/LeanTween GitHub (contribute code)")]
	static void openGit()
	{
		Application.OpenURL("https://github.com/dentedpixel/LeanTween");
	}

	[MenuItem ("Lean/Dented Pixel News")]
	static void openDPNews()
	{
		Application.OpenURL("http://dentedpixel.com/category/developer-diary/");
	}
}
