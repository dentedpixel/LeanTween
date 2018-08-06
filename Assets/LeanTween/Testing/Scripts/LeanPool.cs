using System.Collections;
using System.Collections.Generic;
using UnityEngine;

/**
 * A Pooling System for GameObjects
*/

public class LeanPool : object {

    public class Item : MonoBehaviour
    {
        public delegate void PoolTransaction(GameObject go);
        public event PoolTransaction destroyObj;

        public void destroy()
        {
            if (destroyObj != null)
                destroyObj(this.gameObject);
        }
    }

    private GameObject[] array;

    private Queue<GameObject> oldestItems;

    private int retrieveIndex = -1;

    public GameObject[] init( GameObject prefab, int count, Transform parent = null, bool retrieveOldestItems = false){
        array = new GameObject[count];

        if(retrieveOldestItems){
            oldestItems = new Queue<GameObject>();
        }

        for (int i = 0; i < array.Length; i++)
        {
            GameObject go = GameObject.Instantiate(prefab, parent);
            go.SetActive(false);
            Item item = go.AddComponent<Item>();
            item.destroyObj += destroyItem;

            array[i] = go;
        }

        return array;
    }

    private void destroyItem(GameObject go){
        go.SetActive(false);
    }

    public GameObject retrieve()
    {
        for (int i = 0; i < array.Length; i++){
            retrieveIndex++;
            if (retrieveIndex >= array.Length)
                retrieveIndex = 0;
            
            if(array[retrieveIndex].activeSelf==false){
                GameObject returnObj = array[retrieveIndex];
                returnObj.SetActive(true);

                if (oldestItems != null)
                {
                    oldestItems.Enqueue(returnObj);
                }

                return returnObj;
            }
        }

        if (oldestItems!=null)
        {
            GameObject go = oldestItems.Dequeue();
            oldestItems.Enqueue(go);// put at the end of the queue again

            return go;
        }

        return null;
    }
}
