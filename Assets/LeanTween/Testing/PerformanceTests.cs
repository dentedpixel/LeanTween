using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PerformanceTests : MonoBehaviour {

    public class Anim : MonoBehaviour
    {
        public int animId;
    }

    public bool debug = false;

    public GameObject bulletPrefab;

    private LeanPool bulletPool = new LeanPool();

    public float shipSpeed = 1f;
    private float shipDirectionX = 1f;

	// Use this for initialization
	void Start () {

        //for (int i = 0; i < cached.Length; i++){
        //    GameObject cube = GameObject.CreatePrimitive(PrimitiveType.Cube);
        //    Destroy(cube.GetComponent(typeof(BoxCollider)) as Component);
        //    cube.name = "cube" + i;
        //}


        bulletPool.init(bulletPrefab, 80, null, true);
	}
	
	// Update is called once per frame
	void Update () {
        GameObject go = bulletPool.retrieve();
        var anim = go.GetComponent<Anim>();
        if(anim!=null){
            if(debug)
                Debug.Log("canceling id:" + anim.animId);
            
            LeanTween.cancel(anim.animId);
        }else{
            anim = go.AddComponent<Anim>();
        }
        go.transform.position = transform.position;
        anim.animId = LeanTween.moveLocalZ(go, 80f, 5f).setOnComplete(()=>{
            go.GetComponent<LeanPool.Item>().destroy();
        }).id;


        if(transform.position.x<-20f){
            shipDirectionX = 1f;
        }else if (transform.position.x > 20f){
            shipDirectionX = -1f;
        }

        var pos = transform.position;
        pos.x += shipDirectionX * Time.deltaTime * shipSpeed;
        transform.position = pos;
	}
}
