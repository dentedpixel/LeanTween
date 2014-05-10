LeanTween is an efficient tweening engine for Unity3d

Full Documentation:
http://dentedpixel.com/LeanTweenDocumentation/classes/LeanTween.html

Getting Started
	Move the contents of LeanTween/Plugins folder into the root of your project /Assets/Plugins/* (if you do not have this folder already you can just drag the actual Plugins folder to the Assets folder)

	There are many examples included! Look in the "LeanTweenExamples" folder to see many of the methods outlined.

LeanTween and Windows Store
	Hashtables are not supported for Windows Store publishing. So to pass optional values, make sure to do so in this format:

	LeanTween.moveX(gameObject, 1f, 1.5f).setDelay(1f).setEase(LeanTweenType.easeInOutQuad);

LeanTween and Flash
	Right now all of the Leantween functionality should be supported, you just have to make sure you create your Hashtables manually instead of using the quicker json like format ( {"ease":LeanTweenType.punch} ), the Flash compiler doesn't like this format for some reason.  So instead form the hashtable like:

	var hash:Hashtable = new Hashtable();
	hash.Add("ease", LeanTweenType.punch);
	LeanTween.rotate( gameObject, Vector3(-40,10,0), 1.0, hash);

	C# users should already be used to forming the hashtables in this way, and shouldn't have to change anything.

	Or better yet, don't use Hashtables at all, and use the above mentioned way of passing optional parameters by add-on methods

	
