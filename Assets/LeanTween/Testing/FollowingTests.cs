using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FollowingTests : MonoBehaviour {

    public Transform followTrans;

    public Transform cube1;
    private Vector3 cube1Velocity;

    public Transform cube2;
    private Vector3 cube2Velocity;

    private void Start()
    {
        followTrans.LeanMove(new Vector3(0f, 2f, 0f)*10f, 0.1f).setDelay(0f);
        followTrans.LeanMove(new Vector3(2f, -2f, 0f)* 10f, 0.1f).setDelay(1f);
        followTrans.LeanMove(new Vector3(5f, 0f, 0f)* 10f, 0.1f).setDelay(2f);
        followTrans.LeanMove(new Vector3(1f, -2f, 0f)* 10f, 0.1f).setDelay(3f);
        followTrans.LeanMove(new Vector3(-4f, 2f, 0f)* 10f, 0.1f).setDelay(4f);
    }

    // Update is called once per frame
    void Update () {
        
        cube1.position = Vector3.SmoothDamp(cube1.position, followTrans.position, ref cube1Velocity, 1.1f);


	}
}
