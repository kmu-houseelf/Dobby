using System;
using System.Collections;
using System.Collections.Generic;
using System.Net.Sockets;
using System.Text;
using UnityEngine;

public class Client_PC : MonoBehaviour
{
    public string IPAddress = "203.246.112.77";
    public int Port = 6666;
    private Socket Socket;
    byte[] receivebytes = new byte[1024];

    private JsonControl json_control;
    private Device_Controller device_controller;
    private AI_Move ai;

    private string data;

    // Use this for initialization
    void Start()
    {
        Socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream,
            ProtocolType.Tcp);
        System.Net.IPAddress remoteIPAddress =
            System.Net.IPAddress.Parse(IPAddress);
        System.Net.IPEndPoint remoteEndPoint =
            new System.Net.IPEndPoint(remoteIPAddress, Port);

        Socket.Connect(remoteEndPoint);
        Debug.Log("Connecting");

        json_control = GameObject.Find("GameController").GetComponent<JsonControl>();
        device_controller = GameObject.Find("GameController").GetComponent<Device_Controller>();
        ai = GameObject.Find("GameController").GetComponent<AI_Move>();
    }

    // Update is called once per frame
    void Update()
    {
        Read_Message();
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

        // position control
        if (data.Contains("(") && data.Contains(")"))
        {
            string[] pos = data.Split(',', '(', ')');

            //Debug.Log(pos.Length);
            //for(int i=0; i<pos.Length; i++)
            //  Debug.Log(pos[i]);
            // 1,2,3 is pos x,y,z 5,6,7 rotate x,y,z
            // need to 123 6
            ai.ReadTransform(
                new Vector3(
                    System.Convert.ToSingle(pos[1]),
                    System.Convert.ToSingle(pos[2]),
                    System.Convert.ToSingle(pos[3])),
                Quaternion.Euler(
                    (System.Convert.ToSingle(pos[5]) * 180.0f / (float)Math.PI),
                    (System.Convert.ToSingle(pos[6]) * 180.0f / (float)Math.PI),
                    (System.Convert.ToSingle(pos[7]) * 180.0f / (float)Math.PI)));
        }

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
