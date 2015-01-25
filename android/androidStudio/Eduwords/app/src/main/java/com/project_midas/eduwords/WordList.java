package com.project_midas.eduwords;

import android.os.Parcel;
import android.os.Parcelable;

import java.util.ArrayList;

/**
 * Created by Michal on 2015-01-25.
 */
public class WordList extends ArrayList<Word> implements Parcelable {

    private static final long serialVersionUID = 663585476779879096L;

    public WordList() {
    }

    public WordList(Parcel in) {
        readFromParcel(in);
    }


    @SuppressWarnings("unchecked")

    public static final Parcelable.Creator CREATOR = new Parcelable.Creator() {

        public WordList createFromParcel(Parcel in) {

            return new WordList(in);

        }


        public Object[] newArray(int arg0) {

            return null;

        }


    };


    private void readFromParcel(Parcel in) {

        this.clear();


        //First we have to read the list size

        int size = in.readInt();


        //Reading remember that we wrote first the Name and later the Phone Number.

        //Order is fundamental


        for (int i = 0; i < size; i++) {

            Word w = new Word();

            w.setWord(in.readString());

            w.setTranslation(in.readString());
            w.setTag(in.readString());

            this.add(w);

        }


    }


    public int describeContents() {

        return 0;

    }


    public void writeToParcel(Parcel dest, int flags) {

        int size = this.size();

        //We have to write the list size, we need him recreating the list

        dest.writeInt(size);

        //We decided arbitrarily to write first the Name and later the Phone Number.

        for (int i = 0; i < size; i++) {

            Word w = this.get(i);

            dest.writeString(w.getWord());

            dest.writeString(w.getTranslation());
            dest.writeString(w.getTag());

        }

    }
}
