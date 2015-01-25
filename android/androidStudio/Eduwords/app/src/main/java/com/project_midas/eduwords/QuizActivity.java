package com.project_midas.eduwords;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import java.util.Random;

/**
 * Created by Michal on 2015-01-25.
 */
public class QuizActivity extends Activity implements View.OnClickListener {
    private WordList words;
    Random r = new Random();
    public TextView question;
    public EditText answer;
    public int points = 0;
    int randomNumber = 0;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_quiz);

        View buttonCheck = findViewById(R.id.button_check);
        buttonCheck.setOnClickListener(this);


        question = (TextView) findViewById(R.id.text_word);
        answer = (EditText) findViewById(R.id.edit_answer);


        Bundle b = getIntent().getExtras(); //Get the intent's extras

        words = b.getParcelable("words"); //get our list

        if (words.size() == 0) {
            question.setText("Pusta baza");
            buttonCheck.setVisibility(View.GONE);
            answer.setVisibility(View.GONE);
        } else {
            setQuestion();
        }

    }

    public void setQuestion() {
        answer.setText("");
        randomNumber = r.nextInt(words.size());
        question.setText(words.get(randomNumber).getWord());
    }

    public void check(){
        if(words.get(randomNumber).getTranslation().equals(answer.getText().toString())){
            points++;
            Toast.makeText(this, "dobra odpowiedz, masz " + Integer.toString(points) + " punkt", Toast.LENGTH_SHORT).show();
            setQuestion();
        } else {
            Toast.makeText(this, "zla odpowiedz", Toast.LENGTH_SHORT).show();
        }
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.button_check:
                check();
                break;
        }
    }
}