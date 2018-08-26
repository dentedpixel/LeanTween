using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Following : MonoBehaviour {

    public Transform planet;

    public Transform followArrow;

    public Transform dude1;
    public Transform dude2;
    public Transform dude3;
    public Transform dude4;
    public Transform dude5;

    private void Start()
    {
        followArrow.gameObject.LeanDelayedCall(3f, moveFollow).setOnStart(moveFollow).setRepeat(-1);

        LeanTween.followLocalDampY(dude1, followArrow, 1.1f);
        LeanTween.followLocalGravityY(dude2, followArrow, 1.1f);
        LeanTween.followLocalBounceOutY(dude3, followArrow, 1.1f);
        LeanTween.followLocalQuintY(dude4, followArrow, 1.1f);
        LeanTween.followLocalLinearY(dude5, followArrow, 50f);

        var localPos = Camera.main.transform.InverseTransformPoint(planet.transform.position);
        LeanTween.rotateAround(Camera.main.gameObject, Vector3.left, 360f, 300f).setPoint(localPos).setRepeat(-1);
    }

    private void moveFollow()
    {
        LeanTween.moveLocalY(followArrow.gameObject, Random.Range(-100f, 100f), 0f);
    }
}
