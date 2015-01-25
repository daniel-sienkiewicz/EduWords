package com.project_midas.eduwords;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;
import java.lang.reflect.Type;
/**
 * Created by Michal on 2015-01-25.
 */
public class DataActivity extends Activity implements View.OnClickListener {

    private String url = "http://eduwords.project-midas.com/pl/words.json?u=sienkiewicz%40project-midas.com";
    WordList words = new WordList();
    Bundle b = new Bundle();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_data);

        View downloadButton = findViewById(R.id.button_download);
        downloadButton.setOnClickListener(this);

        View addButton = findViewById(R.id.button_add);
        addButton.setOnClickListener(this);

        View goButton = findViewById(R.id.button_go_quiz);
        goButton.setOnClickListener(this);
    }

    @Override
    public void onClick(View v) {

        switch (v.getId()) {
            case R.id.button_download:
                Toast.makeText(this, "download", Toast.LENGTH_LONG).show();
                break;
            case R.id.button_add:
                makeWord(v);
                break;
            case R.id.button_go_quiz:
                b.putParcelable("words", words);
                Intent i = new Intent(this, QuizActivity.class);
                i.putExtras(b);
                startActivity(i);
                break;
        }
    }

    public void makeWord(View v) {
        EditText word = (EditText) findViewById(R.id.edit_word);
        EditText translation = (EditText) findViewById(R.id.edit_translation);
        EditText tag = (EditText) findViewById(R.id.edit_tag);
        words.add(new Word(word.getText().toString(), translation.getText().toString(), tag.getText().toString()));
        word.setText("");
        translation.setText("");
        tag.setText("");
        Toast.makeText(this, printAllWords(), Toast.LENGTH_SHORT).show();
    }

    public String printAllWords() {
        String test = "";
        for (Word word2 : words) {
            test = test + " " + word2.getAll();
        }
        return test;
    }
}
