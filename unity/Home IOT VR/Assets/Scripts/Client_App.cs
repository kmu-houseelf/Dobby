using System;
using System.Collections;
using System.Collections.Generic;
using System.Net.Sockets;
using System.Text;
using UnityEngine;

public class Client_App : MonoBehaviour {
    public GameObject vr_cam;
    public GameObject main_cam;

    public string IPAddress = "203.246.112.77";
    public int Port = 6666;
    private Socket Socket;
    byte[] receivebytes = new byte[1024];

    private JsonControl json_control;

    private string data;
    private string pos_rotate;

    // Use this for initialization
    void Start () {
        Socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream,
            ProtocolType.Tcp);
        System.Net.IPAddress remoteIPAddress =
            System.Net.IPAddress.Parse(IPAddress);
        System.Net.IPEndPoint remoteEndPoint =
            new System.Net.IPEndPoint(remoteIPAddress, Port);

        Socket.Connect(remoteEndPoint);
        Debug.Log("Connecting");

        json_control = GameObject.Find("GameController").GetComponent<JsonControl>();

        pos_rotate = Make_string(vr_cam.transform.position,
            main_cam.transform.localRotation);
    }
	
	// Update is called once per frame
	void Update () {
        Read_Message();

        string new_pos_rotate = Make_string(vr_cam.transform.position,
            main_cam.transform.localRotation);

        if (!new_pos_rotate.Equals(pos_rotate))
        {
            pos_rotate = new_pos_rotate;
            SendData(System.Text.Encoding.UTF8.GetBytes(pos_rotate));
        }
	}

    string Make_string(Vector3 position, Quaternion rotate)
    {
        string str = position.ToString() + rotate.ToEuler() +"\n";
           
        //Debug.Log(str);
        Debug.Log("pos:"+position.ToString());
        Debug.Log("rotate:"+rotate.ToEuler());

        return str;
    }

    void Read_Message()
    {
        Socket.BeginReceive(
            receivebytes, 0, receivebytes.Length,
            SocketFlags.None,
            new AsyncCallback(ReceiveCallback), null);
        
        string new_data = Encoding.Default.GetString(receivebytes);

        if (new_data == null)
            return;
        else if (new_data.Equals(data))
            return;
        else
            data = new_data;

        Debug.Log(data);

        // json control
        if (data.Contains("{") && data.Contains("}"))
            json_control.Parse(data);

    }

    private void ReceiveCallback(IAsyncResult AR)
    {
        int received = Socket.EndReceive(AR);

        if (received <= 0)
            return;

        byte[] recData = new byte[received];
        Buffer.BlockCopy(receivebytes, 0, recData, 0, received);

        Socket.BeginReceive(
            receivebytes, 0, receivebytes.Length,
            SocketFlags.None,
            new AsyncCallback(ReceiveCallback), null);
    }

    private void SendData(byte[] data)
    {
        SocketAsyncEventArgs socketAsyncData = new SocketAsyncEventArgs();
        socketAsyncData.SetBuffer(data, 0, data.Length);
        Socket.SendAsync(socketAsyncData);
    }
}
