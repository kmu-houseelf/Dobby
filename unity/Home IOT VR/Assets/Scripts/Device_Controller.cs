using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;
using SimpleJSON;
using UnityEngine;


public class Device_Controller : MonoBehaviour {
    Light light;
    Material material;

    string[] place = { "Room", "Bath", "Living", "Kitchen" };

    public GameObject video_manager;
    MediaPlayerCtrl media_ctrl;

    public bool check_mobile;
    int ch;
    float vol;
    bool mute;
    string[] media =
    {
        "YTN", "SBS", "CNN", "Soccer", "Baseball", "Basketball",
        "Music", "Ani", "Game", "Edu"
    };

	// Use this for initialization
	void Start () {
        media_ctrl = video_manager.GetComponent<MediaPlayerCtrl>();
        media_ctrl.Stop();
        ch = 0; // init channel
        vol = 0.5f;
        mute = false;
	}
	
	// Update is called once per frame
	void Update () {
        
    }

    public void Change_TV(JSONNode json)
    {
        Debug.Log(json.ToString());

        if (json["Volume"].AsBool == true)
        {
            Debug.Log("Loud");
            if (vol < 1)
                vol += 0.25f;
            if (mute)
                mute = false;
        }
        else if (json["Volume"] != null
            && json["Volume"].AsBool == false)
        {
            Debug.Log("Quite");
            if (vol > 0)
                vol -= 0.25f;
            if (mute)
                mute = false;
        }

        if (!mute)
        {
            Debug.Log("Set Vol " + vol);
            media_ctrl.SetVolume(vol);
        }

        if (json["Mute"].AsBool == true)
        {
            mute = true;
            media_ctrl.SetVolume(0);
        }
        else if (json["Mute"].AsBool == false)
        {
            mute = false;
            media_ctrl.SetVolume(vol);
        }

        if (json["Channel"] != null)
        {
            ch = json["Channel"].AsInt;
            if(json["Power"] == null)
            {
                Debug.Log("Video Load " + media[ch]);
                if (check_mobile)
                    media_ctrl.SetVolume(0);
                media_ctrl.Load(media[ch] + ".mp4");
            }
        }

        if (json["Power"].AsBool == true)
        {
            Debug.Log("Video Load " + media[ch]);
            if (check_mobile)
                media_ctrl.SetVolume(0);
            media_ctrl.Load(media[ch] + ".mp4");
        }
        else if(json["Power"] != null &&
            json["Power"].AsBool == false)
        {
            Debug.Log("Video Stop");
            media_ctrl.Stop();
            media_ctrl.DeleteVideoTexture();
        }

    }

    public void Change_light(JSONNode json)
    {
        Debug.Log(json.ToString());
        //Debug.Log(json["Location"]);
        if (json["Location"].ToString().Contains("All"))
        {
            Debug.Log("Change All");
            for(int i=0; i<place.Length; i++)
            {
                json["Location"] = place[i];
                Change_light(json);
            }
        }
        else
        {
            string light_name = json["Location"] + "_"
                + json["Object"] + "_"
                + "light";
            string light_obj = json["Location"] + "_"
                + json["Object"] + "_"
                + "obj";

            Debug.Log(light_name + " " + light_obj);
            Debug.Log(json["Brightness"]);

            light = GameObject.Find(light_name).GetComponent<Light>();
            material = GameObject.Find(light_obj).GetComponent<Renderer>().material;

            if (json["Action"].AsBool == true)
            {
                light.enabled = true;
                material.EnableKeyword("_EMISSION");
            }
            else if (json["Action"] != null &&
                json["Action"].AsBool == false)
            {
                light.enabled = false;
                material.DisableKeyword("_EMISSION");
            }

            if (json["Brightness"].AsBool == true)
            {
                light.intensity += 25;
            }
            else if (json["Birghtness"] != null &&
                json["Birghtness"].AsBool == false)
            {
                light.intensity -= 25;
            }
        }
    }

}
