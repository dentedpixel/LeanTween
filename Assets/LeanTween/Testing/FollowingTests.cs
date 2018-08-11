using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LeanSmooth{

    public static Vector3 damp( Vector3 curr, Vector3 dest, ref Vector3 velocity, float time){

        Vector3 diff = dest - curr;

        Vector3 diff2 = curr + velocity * time;
        float numerator = /*Mathf.Sqrt(diff.magnitude)**/0.001f;
        velocity += diff*(numerator/time);

        return curr + velocity;
    }
}

public class FollowingTests : MonoBehaviour {

    public Transform followTrans;

    public Transform cube1;
    private Vector3 cube1Velocity;

    public Transform cube2;
    private Vector3 cube2Velocity;
    private float cube2VelocityX;

    private void Start(){
        followTrans.gameObject.LeanDelayedCall(2f, moveFollow).setOnStart(moveFollow).setRepeat(-1);
    }

    private void moveFollow(){
        followTrans.LeanMove(new Vector3(Random.Range(-50f, 50f), Random.Range(-50f, 50f), 0f), 0f);
    }

    public float damping = 2f;
    public float accelDamping = 1f;

    public float dampX(float current, float target, ref float currentVelocity, float smoothTime)
    {
        float diff = target - current;

        float numR = Time.deltaTime / smoothTime * accelDamping;

        currentVelocity += diff * numR;
               
        currentVelocity *= (1f - Time.deltaTime * damping);

        float returned = current + currentVelocity;

        return returned;
    }

    // Update is called once per frame
    void Update () {
        cube1.position = Vector3.SmoothDamp(cube1.position, followTrans.position, ref cube1Velocity, 1.1f);
        // cube2.position = LeanSmooth.damp(cube2.position, followTrans.position, ref cube2Velocity, 1.1f);

        var pos = cube2.position;
        //pos.x = mySmoothDamp(cube2.position.x, followTrans.position.x, ref cube2VelocityX, 1.1f);
        pos.x = dampX(cube2.position.x, followTrans.position.x, ref cube2VelocityX, 1.1f);
        cube2.position = pos;
	}


}
