LeanTween is an efficient tweening engine for Unity3d

Full Documentation:
http://dentedpixel.com/LeanTweenDocumentation/classes/LeanTween.html

To use the C# version unzip the file LeanTween.cs.zip and delete LeanTween.js. This is only helpful if you use your code compiled as a DLL, LeanTween is fully compatible with C#  with the LeanTween.js file.  

Examples of LeanTween's use:
http://dentedpixel.com/developer-diary/leantween-now-with-full-documentation/

LeanTween and Flash
Right now all of the Leantween functionality should be supported, you just have to make sure you create your Hashtables manually instead of using the quicker json like format ( {"ease":LeanTweenType.punch} ), the Flash compiler doesn't like this format for some reason.  So instead form the hashtable like:

var hash:Hashtable = new Hashtable();
hash.Add("ease", LeanTweenType.punch);
LeanTween.rotate( gameObject, Vector3(-40,10,0), 1.0, hash);

C# users should already be used to forming the hashtables in this way, and shouldn't have to change anything.