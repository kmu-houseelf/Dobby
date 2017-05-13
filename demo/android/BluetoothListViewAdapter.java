package kr.ac.kookmin.nlp.bluetoothclientfinal;

import android.bluetooth.BluetoothDevice;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import java.util.ArrayList;

/**
 * Created by nlp-ngh on 2017-02-14.
 */

public class BluetoothListViewAdapter extends BaseAdapter {
    private Context mContext = null;
    private ArrayList<BluetoothDevice> mListData = new ArrayList<>();

    public BluetoothListViewAdapter(Context mContext) {
        super();
        this.mContext = mContext;
    }

    @Override
    public Object getItem(int position) {
        return mListData.get(position);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        ViewHolder holder;

        if (convertView == null) {
            holder = new ViewHolder();

            LayoutInflater inflater = (LayoutInflater) mContext.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            convertView = inflater.inflate(R.layout.listview_item, null);

            holder.mText = (TextView)convertView.findViewById(R.id.list_item_text);
            convertView.setTag(holder);
        }
        else {
            holder = (ViewHolder) convertView.getTag();
        }

        BluetoothDevice mBluetoothDevice = mListData.get(position);
        holder.mText.setText(mBluetoothDevice.getName() + "\n" + mBluetoothDevice.getAddress());

        return convertView;
    }

    @Override
    public int getCount() {
        return mListData.size();
    }

    public void add(BluetoothDevice mBluetoothDevice) {
        mListData.add(mBluetoothDevice);
    }

    private class ViewHolder {
        public TextView mText;
    }
}
