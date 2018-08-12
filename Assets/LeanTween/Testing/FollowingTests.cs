using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LeanSmooth{

    public static Vector3 damp( Vector3 curr, Vector3 dest, ref Vector3 velocity, float time){

        Vector3 diff = dest - curr;

        float numerator = /*Mathf.Sqrt(diff.magnitude)**/0.001f;
        velocity += diff*(numerator/time);

        return curr + velocity;
    }


    public static float SmoothDamp(float current, float target, ref float currentVelocity, float smoothTime, float maxSpeed, float deltaTime)
    {
        smoothTime = Mathf.Max(0.0001f, smoothTime);
        float num = 2f / smoothTime;
        float num2 = num * deltaTime;
        float num3 = 1f / (1f + num2 + 0.48f * num2 * num2 + 0.235f * num2 * num2 * num2);
        float num4 = current - target;
        float num5 = target;
        float num6 = maxSpeed * smoothTime;
        num4 = Mathf.Clamp(num4, -num6, num6);
        target = current - num4;
        float num7 = (currentVelocity + num * num4) * deltaTime;
        currentVelocity = (currentVelocity - num * num7) * num3;
        float num8 = target + (num4 + num7) * num3;
        if (num5 - current > 0f == num8 > num5)
        {
            num8 = num5;
            currentVelocity = (num8 - num5) / deltaTime;
        }
        return num8;
    }
}

public class FollowingTests : MonoBehaviour {

    public Transform followTrans;

    public Transform cube1;
    private Vector3 cube1Velocity;
    private float cube1VelocityX;

    public Transform cube2;
    private float cube2VelocityX;

    public Transform cube3;
    private Vector3 cube3Velocity;
    private float cube3VelocityX;

    public Transform cube4;
    private Vector3 cube4Velocity;
    private float cube4VelocityX;

    public Transform cube5;
    private float cube5VelocityX;

    private void Start(){
        followTrans.gameObject.LeanDelayedCall(2f, moveFollow).setOnStart(moveFollow).setRepeat(-1);
    }

    private void moveFollow(){
        followTrans.LeanMoveX( Random.Range(-50f, 50f), 0f);
    }

    void Update()
    {
        var pos = cube1.position;
        pos.x = Mathf.SmoothDamp(cube1.position.x, followTrans.position.x, ref cube1VelocityX, 1.1f);
        cube1.position = pos;
        // cube2.position = LeanSmooth.damp(cube2.position, followTrans.position, ref cube2Velocity, 1.1f);

        pos = cube2.position;
        //pos.x = mySmoothDamp(cube2.position.x, followTrans.position.x, ref cube2VelocityX, 1.1f);
        pos.x = followGravity(cube2.position.x, followTrans.position.x, ref cube2VelocityX, 1.1f);
        cube2.position = pos;

        pos = cube3.position;
        pos.x = followBounceOut(cube3.position.x, followTrans.position.x, ref cube3VelocityX, 1.1f);
        cube3.position = pos;

        pos = cube4.position;
        pos.x = followQuint(cube4.position.x, followTrans.position.x, ref cube4VelocityX, 1.1f);
        cube4.position = pos;

        pos = cube5.position;
        pos.x = followLinear(cube5.position.x, followTrans.position.x, 10f);
        cube5.position = pos;
    }

    public float friction = 2f;
    public float accelDamping = 0.5f;
    public float hitDamping = 0.9f;

    public float followGravity(float current, float target, ref float currentVelocity, float smoothTime)
    {
        float diff = target - current;

        float numR = Time.deltaTime / smoothTime * accelDamping;

        currentVelocity += diff * numR;
               
        currentVelocity *= (1f - Time.deltaTime * friction);

        float returned = current + currentVelocity;

        return returned;
    }

    public float followQuint(float current, float target, ref float currentVelocity, float smoothTime)
    {
        float diff = target - current;

        currentVelocity = Time.deltaTime / smoothTime * diff;

        return current + currentVelocity;
    }

    public float followLinear(float current, float target, float moveSpeed)
    {
        bool targetGreater = (target > current);

        float currentVelocity = Time.deltaTime * moveSpeed * (targetGreater ? 1f : -1f);

        float returned = current + currentVelocity;

        float returnPassed = returned - target;
        if ((targetGreater && returnPassed > 0) || !targetGreater && returnPassed < 0) { // Has passed point, return target
            return target;
        }

        return returned;
    }

    public float followBounceOut(float current, float target, ref float currentVelocity, float smoothTime)
    {
        float diff = target - current;

        float numR = Time.deltaTime / smoothTime * accelDamping;

        currentVelocity += diff * numR;

        currentVelocity *= (1f - Time.deltaTime * friction);

        float returned = current + currentVelocity;

        bool targetGreater = (target > current);
        float returnPassed = returned - target;
        if( (targetGreater && returnPassed > 0) || !targetGreater && returnPassed < 0){ // Start a bounce
            currentVelocity = -currentVelocity*hitDamping;
            returned = current + currentVelocity;
        }

        return returned;
    }



}
