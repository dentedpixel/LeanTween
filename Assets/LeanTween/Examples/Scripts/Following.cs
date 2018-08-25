using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Following : MonoBehaviour {

    public Transform followArrow;

    public Transform dude1;
    public Transform dude2;
    public Transform dude3;
    public Transform dude4;
    public Transform dude5;

    private void Start()
    {
        followArrow.gameObject.LeanDelayedCall(3f, moveFollow).setOnStart(moveFollow).setRepeat(-1);

        LeanTween.followDampY(dude1, followArrow, 1.1f);
    }

    private void moveFollow()
    {
        LeanTween.moveY(followArrow.gameObject, Random.Range(-100f, 100f), 0f);
    }
}
