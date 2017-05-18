using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityStandardAssets.Characters.ThirdPerson;

public class AI_Move : MonoBehaviour {

    public GameObject vr_cam;
    public GameObject ai; // ai character object
    // ai pos(0,-0.9200001,0) scale(3.5,3.5,3.5)
    private GameObject target; // target object
    // MeMyselfEye_v1 position x,z && Main Camera rotation 
    private AICharacterControl control;

	// Use this for initialization
	void Start () {
        GameObject instance = Instantiate(ai) as GameObject;
        target = GameObject.Find("WalkTarget");
        control = instance.GetComponent<AICharacterControl>();
        control.target = target.transform;
        control.transform.position = new Vector3(0, -0.9200001f, 0);
        control.transform.localScale = new Vector3(3.5f, 3.5f, 3.5f);
	}
	
	// Update is called once per frame
	void Update () {
        if (control.transform.position.x == target.transform.position.x
            && control.transform.position.z == target.transform.position.z)
        {
            Debug.Log("same pos");
            control.transform.rotation = target.transform.rotation;
        }
	}

    public void ReadTransform(Vector3 position, Quaternion rotate)
    {
        target.transform.position = 
            new Vector3(position.x, target.transform.position.y, position.z);
        target.transform.rotation = rotate;
    }
}
