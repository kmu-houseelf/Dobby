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
        JSONNode iot = JSON.Parse(message);

        if (!iot["Tasktype"].ToString().Contains("Null") &&
            iot["Tasktype"].AsInt == 0)
        {
            Debug.Log("unknwon pattern catched");
            return;
        }

        if (!iot["Pattern"].ToString().Contains("Null"))
        {
            Debug.Log("Sentence is not perfect");
            return;
        }

        if(iot["Homeiot"]["Homeiottype"].AsInt == 1)
        {
            Debug.Log("Light");
            controller.Change_light(iot);
        }
        else if(iot["Homeiot"]["Homeiottype"].AsInt == 2)
        {
            Debug.Log("Tv");
            controller.Change_TV(iot);
        }
        else if(iot["Homeiot"]["Homeiottype"].AsInt == 3)
        {
            Debug.Log("Schedule");
            controller.Show_Schedule(iot);
        }
        else if(iot["Homeiot"]["Homeiottype"].AsInt == 4)
        {
            Debug.Log("Music");
            controller.Change_Music(iot);
        }
        else if(iot["Homeiot"]["Homeiottype"].AsInt == 5)
        {
            Debug.Log("Aircon");
            controller.Change_Aircon(iot);
        }
        else
        {
            Debug.Log("Unknown");
        }
    }
}
