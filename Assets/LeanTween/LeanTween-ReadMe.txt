LeanTween is an efficient tweening engine for Unity3d

Full Documentation:
http://dentedpixel.com/LeanTweenDocumentation/classes/LeanTween.html

Getting Started
	Move the contents of LeanTween/Plugins folder into the root of your project /Plugins/* (if you do not have this folder already you can just drag the actual Plugins folder to your root directory)

C# Usage
	Only use the C# version if you have to, C# code is fully compatible with the LeanTween.js version(as long as it is placed in the Plugins directory). To use the C# version unzip the file LeanTween.cs.zip and delete LeanTween.js and all of the example JS scripts.

LeanTween and Flash
	Right now all of the Leantween functionality should be supported, you just have to make sure you create your Hashtables manually instead of using the quicker json like format ( {"ease":LeanTweenType.punch} ), the Flash compiler doesn't like this format for some reason.  So instead form the hashtable like:

	var hash:Hashtable = new Hashtable();
	hash.Add("ease", LeanTweenType.punch);
	LeanTween.rotate( gameObject, Vector3(-40,10,0), 1.0, hash);

	C# users should already be used to forming the hashtables in this way, and shouldn't have to change anything.