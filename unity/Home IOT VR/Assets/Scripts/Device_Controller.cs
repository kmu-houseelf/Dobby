using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;
using UnityEngine;


public class Device_Controller : MonoBehaviour {
    Light light;
    Material material;

	// Use this for initialization
	void Start () {
       
	}
	
	// Update is called once per frame
	void Update () {
        
    }

    public void Change_light(string light_name, bool state)
    {
        Debug.Log("Change Light: " + light_name + " state: " + state);
        light = GameObject.Find(light_name+"_light").GetComponent<Light>();
        material = GameObject.Find(light_name + "_obj").GetComponent<Renderer>().material;
        if (state)
        {
            light.enabled = true;
            Debug.Log("test");
            material.EnableKeyword("_EMISSION");
        }
        else
        {
            light.enabled = false;
            material.DisableKeyword("_EMISSION");
        }
    }

    public void change_position(string pos)
    {

    }
}
