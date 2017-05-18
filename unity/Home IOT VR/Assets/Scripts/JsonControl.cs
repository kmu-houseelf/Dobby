using SimpleJSON;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class JsonControl : MonoBehaviour {

    private Device_Controller controller;

	// Use this for initialization
	void Start () {
        controller = GameObject.Find("GameController").GetComponent<Device_Controller>();
    }
	
	// Update is called once per frame
	void Update () {
		
	}

    public void Parse(string message)
    {
        Debug.Log("Parse");
        JSONNode n = JSON.Parse(message);

        //Debug.Log(n["HomeIOT"].ToString());
        JSONNode iot = JSON.Parse(n["HomeIOT"].ToString());
        //Debug.Log(iot.ToString());

        if(iot["HomeIOTType"].AsInt == 1)
        {
            Debug.Log("Light");
            controller.Change_light(JSON.Parse(iot["Light"].ToString()));
        }
        else if(iot["HomeIOTType"].AsInt == 2)
        {
            Debug.Log("TV");
            controller.Change_TV(JSON.Parse(iot["TV"].ToString()));
        }
        else
        {
            Debug.Log("Unknown");
        }
    }
}
