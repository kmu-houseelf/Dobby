using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;
using SimpleJSON;
using UnityEngine;
using UnityEngine.UI;

public class Device_Controller : MonoBehaviour {
    Light light;
    Material material;

    string[] place = { "Room", "Bathroom", "Livingroom", "Kitchen" };

    public GameObject video_manager;
    MediaPlayerCtrl media_ctrl;

    int ch;
    float vol;
    bool mute;
    string[] media =
    {
        "YTN", "SBS", "CNN", "Soccer", "Baseball", "Basketball",
        "Music", "Ani", "Game", "Edu", "Menu"
    };

    public GameObject remote_control;
    private MeshRenderer phone_display;

    public Material phone_init;
    public Material phone_on;
    public ParticleSystem particle;

    AudioControl audio_ctrl;

    public float temperature;
    float diff;
    int diff_cnt;
    int cnt;
    bool is_hot;
    public Text t;
    public Light directional_light;

    public Text schedule_text;

    // Use this for initialization
    void Start () {
        media_ctrl = video_manager.GetComponent<MediaPlayerCtrl>();
        media_ctrl.Stop();
        ch = 10; // init channel, menu
        vol = 0.5f;
        mute = false;

        phone_display = remote_control.GetComponent<MeshRenderer>();
        phone_display.material = phone_init;

        audio_ctrl = GetComponent<AudioControl>();

        t.text = "온도: " + temperature + "℃";
        //Debug.Log(directional_light.color.r); // (0.184, 0.184, 0.184, 1.000)
        temperature = 26;
	}
     
	// Update is called once per frame
	void Update () {
        recover_Color();
    }

    public void Show_Schedule(JSONNode json)
    {
        Debug.Log(json.ToString());
        string data_list = json["Homeiot"]["Schedule"]["Date"].ToString().Replace("\"","");
        string content_list = json["Homeiot"]["Schedule"]["Content"].ToString().Replace("\"", "");

        string[] dates = data_list.Split('_');
        string[] contents = content_list.Split('_');

        schedule_text.text = "일정\n";

        for(int i=0; i<dates.Length; i++)
        {
            //Debug.Log(dates[i] + " " + contents[i]);
            string init_text = schedule_text.text;
            //Debug.Log(init_text);
            schedule_text.text = init_text + dates[i] + ": " + contents[i] + "\n";
        }
    }

    public void recover_Color()
    {
        if (cnt != 0)
        {
            //Debug.Log("t_cnt: " + cnt);
            if (is_hot)
            {
                temperature += diff / diff_cnt;
                directional_light.color = new Vector4(
                directional_light.color.r - (1.0f-0.184f) / diff_cnt,
                directional_light.color.g,
                directional_light.color.b,
                directional_light.color.a);
            }
            else
            {
                temperature -= diff / diff_cnt;
                directional_light.color = new Vector4(
                directional_light.color.r,
                directional_light.color.g,
                directional_light.color.b - (1.0f - 0.184f) / diff_cnt,
                directional_light.color.a);
            }
            //Debug.Log(directional_light.color);
            cnt--;
        }
        else
        {
            temperature = Mathf.Round(temperature);
        }
        t.text = "온도:" + string.Format("{0:N2}", temperature) + "℃";
    }

    public void Change_Temperature(int new_temp)
    {
        diff = Mathf.Abs(new_temp - temperature);
        Debug.Log(diff);

        if (is_hot)
        {
            directional_light.color = new Vector4(
                1,
                directional_light.color.g,
                directional_light.color.b,
                directional_light.color.a);
        }
        else
        {
            directional_light.color = new Vector4(
                directional_light.color.r,
                directional_light.color.g,
                1,
                directional_light.color.a);
        }

        //Debug.Log(directional_light.color);

        if (diff > 10)
            cnt = (int)(diff * 10);
        else
            cnt = (int)(diff * 100);
        diff_cnt = cnt;
        Debug.Log("cnt: " + cnt);
    }

    public void Change_Aircon(JSONNode json)
    {
        Debug.Log(json.ToString());

        if (json["Homeiot"]["Aircon"]["Action"].ToString().Contains("Null"))
        {
            Debug.Log("action is null");

            int new_temp = json["Homeiot"]["Aircon"]["Temperature"].AsInt;
            if (new_temp > (int)temperature)
            {
                Debug.Log("hot");
                is_hot = true;
            }
            else
            {
                Debug.Log("cold");
                is_hot = false;
            }
        }
        else
        {
            is_hot = json["Homeiot"]["Aircon"]["Action"].AsBool;
            if (is_hot)
                Change_Temperature((int)temperature
                    + json["Homeiot"]["Aircon"]["Temperature"].AsInt);
            else
                Change_Temperature((int)temperature
                    - json["Homeiot"]["Aircon"]["Temperature"].AsInt);
        }

        if(json["Homeiot"]["Aircon"]["Power"].ToString().Contains("Null"))
        {
            Debug.Log("Power is null");
        }
        else if(json["Homeiot"]["Aircon"]["Power"].AsBool)
        {
            Change_Temperature(json["Homeiot"]["Aircon"]["Temperature"]);
        }
        
    }

    public void Change_Music(JSONNode json)
    {
        Debug.Log(json.ToString());

        bool check = false;

        if(json["Homeiot"]["Music"]["Title"].ToString().Contains("Null"))
        {
            Debug.Log("Title is null");
        }
        else
        {
            check = audio_ctrl.title_control(
                json["Homeiot"]["Music"]["Title"].ToString(),
                json["Homeiot"]["Music"]["Action"].AsBool);
        }

        if( check == false &&
            json["Homeiot"]["Music"]["Singer"].ToString().Contains("Null"))
        {
            Debug.Log("Singer is null");
        }
        else if (check != true)
        {
           check = audio_ctrl.singer_control(
                json["Homeiot"]["Music"]["Singer"].ToString(),
                json["Homeiot"]["Music"]["Action"].AsBool
                );
        }

        if( check == false &&
            json["Homeiot"]["Music"]["Gnr"].ToString().Contains("Null"))
        {
            Debug.Log("Gnr is null");
        }
        else if (check != true)
        {
            check = audio_ctrl.gnr_control(
                json["Homeiot"]["Music"]["Gnr"].ToString(),
                json["Homeiot"]["Music"]["Action"].AsBool
                );
        }

        if (check == false)
            audio_ctrl.random_control(json["Homeiot"]["Music"]["Action"].AsBool);
            
    }

    public void Change_TV(JSONNode json)
    {
        Debug.Log(json.ToString());

        if (json["Homeiot"]["Tv"]["Volume"].ToString().Contains("Null"))
        {
            Debug.Log("Volume is null");   
        }
        else if (json["Homeiot"]["Tv"]["Volume"].AsBool == true)
        {
            Debug.Log("Loud");
            if (vol < 1)
                vol += 0.25f;
            if (mute)
                mute = false;
        }
        else if (json["Homeiot"]["Tv"]["Volume"].AsBool == false)
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

        if(json["Homeiot"]["Tv"]["Mute"].ToString().Contains("Null"))
        {
            Debug.Log("Mute is Null");
        }
        else if (json["Homeiot"]["Tv"]["Mute"].AsBool == true)
        {
            mute = true;
            media_ctrl.SetVolume(0);
        }
        else if (json["Homeiot"]["Tv"]["Mute"].AsBool == false)
        {
            mute = false;
            media_ctrl.SetVolume(vol);
        }

        if (!json["Homeiot"]["Tv"]["Channel"].ToString().Contains("Null"))
        {
            ch = json["Homeiot"]["Tv"]["Channel"].AsInt;
            if(json["Homeiot"]["Tv"]["Power"].Equals("Null"))
            {
                Debug.Log("Power is Null");
                Debug.Log("Video Load " + media[ch]);
                media_ctrl.Load(media[ch] + ".mp4");
            }
        }

        if(json["Homeiot"]["Tv"]["Power"].ToString().Contains("Null"))
        {
            Debug.Log("Power is Null");
        }
        else if (json["Homeiot"]["Tv"]["Power"].AsBool == true)
        {
            Debug.Log("Video Load " + media[ch]);
            media_ctrl.Load(media[ch] + ".mp4");
        }
        else if(json["Homeiot"]["Tv"]["Power"].AsBool == false)
        {
            Debug.Log("Video Stop");
            media_ctrl.Stop();
            media_ctrl.DeleteVideoTexture();
        }

        if(json["Homeiot"]["Tv"]["Remoteloc"].ToString().Contains("Null"))
        {
            Debug.Log("Remoteloc is Null");
            phone_display.material = phone_init;
            particle.Stop();
        }
        else if(json["Homeiot"]["Tv"]["Remoteloc"].AsBool == true)
        {
            Debug.Log("Phone_on");
            phone_display.material = phone_on;
            particle.Play();
        }
        else
        {
            Debug.Log("Phone_init");
            phone_display.material = phone_init;
            particle.Stop();
        }

    }

    public void Change_light(JSONNode json)
    {
        Debug.Log(json.ToString());
        //Debug.Log(json["Location"]);
        if (json["Homeiot"]["Light"]["Location"].ToString().Contains("All"))
        {
            Debug.Log("Change All");
            for(int i=0; i<place.Length; i++)
            {
                json["Homeiot"]["Light"]["Location"] = place[i];
                Change_light(json);
            }
        }
        else
        {
            string light_name = json["Homeiot"]["Light"]["Location"] + "_"
                + json["Homeiot"]["Light"]["Object"] + "_"
                + "light";
            string light_obj = json["Homeiot"]["Light"]["Location"] + "_"
                + json["Homeiot"]["Light"]["Object"] + "_"
                + "obj";

            Debug.Log(light_name + " " + light_obj);
            Debug.Log(json["Homeiot"]["Light"]["Brightness"]);

            light = GameObject.Find(light_name).GetComponent<Light>();
            material = GameObject.Find(light_obj).GetComponent<Renderer>().material;

            if(json["Homeiot"]["Light"]["Action"].ToString().Contains("Null"))
            {
                Debug.Log("Action is Null");
            }
            else if (json["Homeiot"]["Light"]["Action"].AsBool == true)
            {
                light.enabled = true;
                material.EnableKeyword("_EMISSION");
            }
            else if (json["Homeiot"]["Light"]["Action"].AsBool == false)
            {
                light.enabled = false;
                material.DisableKeyword("_EMISSION");
            }

            if(json["Homeiot"]["Light"]["Brightness"].ToString().Contains("Null"))
            {
                Debug.Log("Brightness is Null");
            }
            else if (json["Homeiot"]["Light"]["Brightness"].AsBool == true)
            {
                light.intensity += 25;
            }
            else if (json["Homeiot"]["Light"]["Birghtness"].AsBool == false)
            {
                light.intensity -= 25;
            }
        }
    }

}
