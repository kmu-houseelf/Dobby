using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HeadLookWalk : MonoBehaviour {
    public float velocity = 0.7f;
    public bool isWalking = false;

    private CharacterController controller;
    private AudioSource footsteps;

	// Use this for initialization
	void Start () {
        controller = GetComponent<CharacterController>();
        footsteps = GetComponent<AudioSource>();
	}
	
	// Update is called once per frame
	void Update () {
        if (isWalking)
        {
            if (!footsteps.isPlaying)
            {
                footsteps.Play();
            }
            controller.SimpleMove(Camera.main.transform.forward * velocity);
        } else // not walking
        {
            footsteps.Stop();
        }
	}
}
