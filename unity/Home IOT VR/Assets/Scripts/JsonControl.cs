using SimpleJSON;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class JsonControl : MonoBehaviour {

    public List<string> nameList;
    public List<bool> stateList;
    public int deviceCount;

    private Device_Controller controller;

	// Use this for initialization
	void Start () {
        nameList = new List<string>();
        stateList = new List<bool>();
        deviceCount = 0;
        controller = GameObject.Find("GameController").GetComponent<Device_Controller>();
    }
	
	// Update is called once per frame
	void Update () {
		
	}

    public void Parse(string message)
    {
        Debug.Log("Parse");
        JSONNode n = JSON.Parse(message);
        deviceCount = n["device_count"].AsInt;
        Debug.Log("cnt: "+ deviceCount);
        for(int i=0; i < deviceCount; i++)
        {
            string name = n["device_light"][i]["name"];
            nameList.Add(name);
            bool state = n["device_light"][i]["state"];
            stateList.Add(state);
            controller.Change_light(name, state);
        }
    }
}
