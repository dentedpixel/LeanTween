LeanTween is an efficient tweening engine for Unity3d

Full Documentation:
http://dentedpixel.com/LeanTweenDocumentation/classes/LeanTween.html

Getting Started
	
	There are many examples included! Look in the “LeanTween/LeanTweenExamples" folder to see many of the methods outlined.

LeanTween and Windows Store
	Hashtables are not supported for Windows Store publishing. So to pass optional values, make sure to do so in this format:

	LeanTween.moveX(gameObject, 1f, 1.5f).setDelay(1f).setEase(LeanTweenType.easeInOutQuad);


	
