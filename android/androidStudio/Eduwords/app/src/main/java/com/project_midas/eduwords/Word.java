package com.project_midas.eduwords;

/**
 * Created by Michal on 2015-01-25.
 */
public class Word {
    private String word;
    private String translation;
    private String tag;

    public Word(){
    }

    public Word(String word, String translation, String tag) {
        this.word = word;
        this.translation = translation;
        this.tag = tag;
    }

    public String getWord() {
        return word;
    }

    public void setWord(String word) {
        this.word = word;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public String getTranslation() {
        return translation;
    }

    public void setTranslation(String translation) {
        this.translation = translation;
    }

    public String getAll(){
        return word + " " + translation + " " + tag;
    }

}
