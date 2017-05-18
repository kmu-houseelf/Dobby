using System.Collections;
using System.Collections.Generic;
using System.Net;
using System.Net.Sockets;
using System.Text;
using UnityEngine;

public class Server : MonoBehaviour {
    static Server singleton;

    private Socket m_Socket;
    private int m_Port = 12000;
    ArrayList m_Connections = new ArrayList();
    ArrayList m_Buffer = new ArrayList();
    ArrayList m_ByteBuffer = new ArrayList();

    private JsonControl json_control;

    void Awake()
    {
        m_Socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream,
            ProtocolType.Tcp);
        IPEndPoint ipLocal = new IPEndPoint(IPAddress.Any,
            m_Port);
        m_Socket.Bind(ipLocal);
        m_Socket.Listen(100);
        singleton = this;
    }

    // Use this for initialization
    void Start () {
        json_control = GameObject.Find("GameController").GetComponent<JsonControl>();
        Debug.Log("start listenning...");
	}

    void OnApplicationQuit()
    {
        Cleanup();
    }
    void Cleanup()
    {
        if (m_Socket != null)
            m_Socket.Close();
        m_Socket = null;
        foreach (Socket con in m_Connections)
            con.Close();
        m_Connections.Clear();
    }

    // Update is called once per frame
    void Update () {
        Listen();
    }

    void Listen()
    {
        // 연결된 리스트
        ArrayList listenList = new ArrayList();
        listenList.Add(m_Socket);
        Socket.Select(listenList, null, null, 1000);
        for (int i = 0; i < listenList.Count; i++)
        {
            Socket newSocket = ((Socket)listenList[i]).Accept();
            m_Connections.Add(newSocket);
            m_ByteBuffer.Add(new ArrayList());
            Debug.Log("Did connect");
        }

        // 연결된 호스트들로부터 데이터를 읽습니다.
        if (m_Connections.Count != 0)
        {
            ArrayList connections = new ArrayList(m_Connections);
            Socket.Select(connections, null, null, 1000);
            // 모든 연결된 소켓들로부터 들어온 데이터를 가져옵니다.
            foreach (Socket socket in connections)
            {
                byte[] receivedbytes = new byte[1024];
                ArrayList buffer =
                    (ArrayList)m_ByteBuffer[m_Connections.IndexOf(socket)];
                int read = socket.Receive(receivedbytes);

                // 이쪽이 핵심 파트
                if (read != 0)
                {
                    string Message = Encoding.Default.GetString(receivedbytes);
                    Debug.Log(Message);
                    json_control.Parse(Message);
                }

                for (int i = 0; i < read; i++)
                    buffer.Add(receivedbytes[i]);
                while (true && buffer.Count > 0)
                {
                    int length = (byte)buffer[0];
                    if (length < buffer.Count)
                    {
                        ArrayList thismsgBytes = new ArrayList(buffer);
                        thismsgBytes.RemoveRange(length + 1,
                            thismsgBytes.Count - (length + 1));
                        thismsgBytes.RemoveRange(0, 1);
                        if (thismsgBytes.Count != length)
                            Debug.Log("Bug");
                        buffer.RemoveRange(0, length + 1);
                        byte[] readbytes =
                            (byte[])thismsgBytes.ToArray(typeof(byte));
                        string readMsg = Encoding.Default.GetString(readbytes);
                        m_Buffer.Add(readMsg);
                        //Debug.Log(readMsg);

                        if (singleton != this)
                            Debug.LogError("Bug");
                    }
                    else
                        break;
                }
            }
        }
    }
}
