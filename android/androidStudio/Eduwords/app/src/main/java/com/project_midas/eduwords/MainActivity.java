package com.project_midas.eduwords;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;


public class MainActivity extends ActionBarActivity implements View.OnClickListener {

    final Context context = this;
    private Toast toast;
    private long lastBackPressTime = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        View buttonInfo = findViewById(R.id.button_info);
        buttonInfo.setOnClickListener(this);

        View buttonExit = findViewById(R.id.button_exit);
        buttonExit.setOnClickListener(this);
    }


    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.button_info:
                final Dialog dialog = new Dialog(context);
                dialog.setContentView(R.layout.about);
                dialog.setTitle(R.string.about_title);

                TextView text = (TextView) dialog.findViewById(R.id.text);
                text.setText(R.string.about_text);
                ImageView image = (ImageView) dialog.findViewById(R.id.image);
                image.setImageResource(R.drawable.ic_launcher);

                dialog.show();
                break;

            case R.id.button_exit:
                new AlertDialog.Builder(this)
                        .setMessage(R.string.exit_ask)
                        .setCancelable(false)
                        .setNegativeButton(R.string.no, null)
                        .setPositiveButton(R.string.yes,
                                new DialogInterface.OnClickListener() {
                                    public void onClick(DialogInterface dialog,
                                                        int id) {
                                        MainActivity.this.finish();
                                    }
                                }).show();
                break;
        }
    }

    @Override
    public void onBackPressed() {
        if (this.lastBackPressTime < System.currentTimeMillis() - 2000) {
            toast = Toast.makeText(this, R.string.exit_confirm,
                    Toast.LENGTH_SHORT);
            toast.show();
            this.lastBackPressTime = System.currentTimeMillis();
        } else {
            if (toast != null) {
                toast.cancel();
            }
            super.onBackPressed();
        }
    }
}
