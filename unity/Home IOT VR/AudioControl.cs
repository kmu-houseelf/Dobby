using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AudioControl : MonoBehaviour {
    public AudioSource audio;
    public AudioClip[] audioclip = new AudioClip[50];
    public string[] title_list =
        {
            "Ailee_I_will_go_to_you_like_the_first_snow",
            "Ben_Just_Like_A_Dream",
            "BIGBANG_FXXK_IT",
            "Bolbbalgan4_Tell_Me_You_Love_Me",
            "Bolbbalgan4_You_and_I",
            "Bruno_Mars_That's_What_I_Like",
            "BTS_Spring_Day",
            "CHANGMO_Beautiful",
            "CHANGMO_Maestro",
            "Coldplay_Everglow",
            "Crush_Beatuiful",
            "Ed_Sheeran_Shape_Of_You",
            "Eddy_Kim_You_are_so_beautiful",
            "HaDongQn_The_MAZE_OF_REALITY",
            "HanDongGeun_Crazy",
            "Highlight_Can_You_Feel_It",
            "HuhGak_Because_of_you",
            "HYUKOH_Leather_Jacket",
            "HYUKOH_TOMBOY",
            "IU_Can\'t_Love_You_Anymore",
            "IU_Dlwlrma",
            "IU_Ending_Scene",
            "IU_Palette",
            "IU_Through_The_Night",
            "JungJoonil_The_first_snow",
            "JungSeungHwan_If_It_is_You",
            "Justin_Bieber_Love_Yourself",
            "LEE_JUK_Don't_worry_dear",
            "LIMCHANGJUNG_You_tell_me",
            "MadClown_Lost_Without_You",
            "Mamamoo_Open_Your_mind",
            "Maroon5_Sugar",
            "PSY_FACT_ASSAULT",
            "PSY_I_LUV_IT",
            "PSY_LAST_SCENE",
            "PSY_New_Face",
            "Sam_Smith_I'm_Not_The_Only_One",
            "SamKim_Who_Are_You",
            "SEENROOT_Sweet_Heart",
            "Soyou_I_Miss_You",
            "SURAN_WINE",
            "TAEYEON_Make_Me_Love_You",
            "The_Chainsmokers_Closer",
            "TWICE_KNOCK_KNOCK",
            "TWICE_SIGNAL",
            "UNNIES_Right",
            "UrbanZakapa_Wish",
            "WINNER_REALLY_REALLY",
            "YangYoSeob_I_Couldn't_Cry_Because_I'm_A_Man",
            "ZICO_She_is_a_Baby"
    };

    public string[] gnr_list =
    {
        "OST",
        "OST",
        "Rap/Hiphop",
        "Song",
        "OST",
        "POP",
        "Rap/Hiphop",
        "Song",
        "Rap/Hiphop",
        "Rock/Metal",
        "OST",
        "POP",
        "OST",
        "Rock/Metal",
        "Song",
        "Song",
        "OST",
        "Rock/Metal",
        "Song",
        "Song",
        "Song",
        "Song",
        "Song",
        "Song",
        "OST",
        "OST",
        "POP",
        "OST",
        "OST",
        "Rap/Hiphop",
        "OST",
        "Rock/Metal",
        "Rap/Hiphop",
        "Song",
        "Song",
        "Song",
        "POP",
        "OST",
        "Song",
        "OST",
        "Song",
        "Rock/Metal",
        "POP",
        "Song",
        "Song",
        "Song",
        "OST",
        "Song",
        "OST",
        "Song"
    };

	// Use this for initialization
	void Start () {

    }
	
	// Update is called once per frame
	void Update () {
		
	}

    public bool title_control(string title, bool action)
    {
        title = title.Replace("\"", "");
        Debug.Log(title);

        for (int i=0; i<title_list.Length; i++)
        {
            if (title_list[i].Contains(title))
            {
                audio.clip = audioclip[i];
                if (action)
                    audio.Play();
                else
                    audio.Stop();

                return true;
            }
        }

        // not found title
        Debug.Log("Title is wrong");
        return false;
    }

    public bool singer_control(string singer, bool action)
    {
        singer = singer.Replace("\"", "");
        Debug.Log(singer);

        List<int> index_list = new List<int>();

        for (int i = 0; i < title_list.Length; i++)
        {
            if (title_list[i].Contains(singer))
            {
                index_list.Add(i);
            }
        }

        if (index_list.Count == 0)
        {
            Debug.Log("Singer is wrong");
            return false;
        }
        else
        {
            int i = Random.Range(0, index_list.Count);
            Debug.Log(index_list[i] + " " + title_list[index_list[i]]);

            /*
            for(int j=0; j<index_list.Count; j++)
            {
                Debug.Log(audio_list[index_list[j]]);
            }
            */

            audio.clip = audioclip[index_list[i]];
            if (action)
                audio.Play();
            else
                audio.Stop();

            return true;
        }

    }

    public bool gnr_control(string gnr, bool action)
    {
        gnr = gnr.Replace("\"", "");
        Debug.Log(gnr);

        List<int> index_list = new List<int>();

        for (int i = 0; i < gnr_list.Length; i++)
        {
            
            //Debug.Log(gnr_list[i]);
            if (gnr_list[i].Contains(gnr))
            {
                index_list.Add(i);
            }
            
        }

        if (index_list.Count == 0)
        {
            Debug.Log("Gnr is wrong");
            return false;
        }
        else
        {
            int i = Random.Range(0, index_list.Count);
            Debug.Log(index_list[i] + " " + title_list[index_list[i]]);

            /*
            for(int j=0; j<index_list.Count; j++)
            {
                Debug.Log(title_list[index_list[j]]);
            }
            */

            audio.clip = audioclip[index_list[i]];
            if (action)
                audio.Play();
            else
                audio.Stop();
            return true;
        }
    }

    public void random_control(bool action)
    {
        
        if (action == false)
        {
            Debug.Log("music off");
            audio.Stop();
        }
        else
        {

            int i = Random.Range(0, title_list.Length);
            Debug.Log(i + " " + title_list[i]);

            audio.clip = audioclip[i];

            audio.Play();
        }    
    }
}
