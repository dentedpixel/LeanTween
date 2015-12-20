using UnityEngine;
using System.Collections;
using NUnit.Framework;
using NSubstitute;
using System;

[TestFixture]
public class UnitTestExample
{
	private TweeningCounter counter;
	private ILeanTween tweener;
	private GameObject tweeningObject;

	[SetUp]
	public void SetUp()
	{
		// Create collaborators
		this.tweener = Substitute.For<ILeanTween>();
		this.tweeningObject = new GameObject("Tweenee");

		// Create the object under test
		this.counter = new TweeningCounter(this.tweener, this.tweeningObject);
	}
	
	[TearDown]
	public void TearDown()
	{
		// Remove the tweening object from scene after each test.
		GameObject.DestroyImmediate(this.tweeningObject);
	}

	[TestCase]
	public void CountIncreasedAfterTweenComplete()
	{
		// Program the collaborators to act in a certain way

		// When scale with given argumets is called return the substituted scale.
		var onScale = Substitute.For<LTDescr>();
		tweener.scale(Arg.Is<GameObject>(this.tweeningObject), Arg.Any<Vector3>(), Arg.Any<float>()).Returns(onScale);

		// When setOnComplete is called for onScale with any System.Action argument, automatically call
		// the given onComplete.
		onScale.When(l => l.setOnComplete(Arg.Any<Action>())).Do(x => x.Arg<Action>()());

		Assert.AreEqual(0, counter.Count);
		this.counter.Start();
		Assert.AreEqual(1, counter.Count);
		
	}

}


public class TweeningCounter
{
	private readonly ILeanTween tweener;
	private readonly GameObject tweeningObject;
	private int count;

	public TweeningCounter(ILeanTween tweener, GameObject tweeningObject)
	{
		this.tweener = tweener;
		this.tweeningObject = tweeningObject;
	}

	public int Count { get { return this.count; } }

	public void Start()
	{
		tweener.scale(tweeningObject, Vector3.one * 2, 1f)
			.setOnComplete(() => {
				count++;
			});
	}
}

