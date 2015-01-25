package com.project_midas.eduwords;

import android.app.Activity;
import android.os.Bundle;
import android.widget.Toast;

/**
 * Created by Michal on 2015-01-25.
 */
public class QuizActivity extends Activity {
    private WordList words;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_quiz);

        Bundle b = getIntent().getExtras(); //Get the intent's extras

        words = b.getParcelable("words"); //get our list



        Toast.makeText(this, String.valueOf(words.size()), Toast.LENGTH_SHORT).show();
    }
}
