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

    private Color dude1ColorVelocity;

    public Material followMaterial;

    private void Start()
    {
        followMaterial = followArrow.GetComponent<Renderer>().material;

        followArrow.gameObject.LeanDelayedCall(3f, moveArrow).setOnStart(moveArrow).setRepeat(-1);

        // Follow Local Y Position of Arrow
        LeanTween.followDamp(dude1, followArrow, LeanProp.localY, 1.1f);
        LeanTween.followSpring(dude2, followArrow, LeanProp.localY, 1.1f);
        LeanTween.followBounceOut(dude3, followArrow, LeanProp.localY, 1.1f);
        LeanTween.followSpring(dude4, followArrow, LeanProp.localY, 1.1f, -1f, 1.5f, 0.8f);
        LeanTween.followLinear(dude5, followArrow, LeanProp.localY, 50f);

        // Follow Arrow color
        LeanTween.followDamp(dude1, followArrow, LeanProp.color, 1.1f);
        LeanTween.followSpring(dude2, followArrow, LeanProp.color, 1.1f);
        LeanTween.followBounceOut(dude3, followArrow, LeanProp.color, 1.1f);
        LeanTween.followSpring(dude4, followArrow, LeanProp.color, 1.1f, -1f, 1.5f, 0.8f);
        LeanTween.followLinear(dude5, followArrow, LeanProp.color, 0.5f);

        // Follow Arrow scale
        LeanTween.followDamp(dude1, followArrow, LeanProp.scale, 1.1f);
        LeanTween.followSpring(dude2, followArrow, LeanProp.scale, 1.1f);
        LeanTween.followBounceOut(dude3, followArrow, LeanProp.scale, 1.1f);
        LeanTween.followSpring(dude4, followArrow, LeanProp.scale, 1.1f, -1f, 1.5f, 0.8f);
        LeanTween.followLinear(dude5, followArrow, LeanProp.scale, 5f);

        // Rotate Planet
        var localPos = Camera.main.transform.InverseTransformPoint(planet.transform.position);
        LeanTween.rotateAround(Camera.main.gameObject, Vector3.left, 360f, 300f).setPoint(localPos).setRepeat(-1);
    }

    private void Update()
    {
        // dude2.GetComponent<Renderer>().material.color = LeanTween.smoothGravity(dude2.GetComponent<Renderer>().material.color, followMaterial.color, ref dude1ColorVelocity, 1.1f);
    }

	private void moveArrow()
    {
        LeanTween.moveLocalY(followArrow.gameObject, Random.Range(-100f, 100f), 0f);

        var randomCol = new Color(Random.value, Random.value, Random.value);
        LeanTween.color(followArrow.gameObject, randomCol, 0f);

        var randomVal = Random.Range(5f, 10f);
        followArrow.localScale = Vector3.one * randomVal;
    }
}
