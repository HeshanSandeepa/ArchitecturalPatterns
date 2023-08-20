package com.example.mvcdemo.model

import androidx.databinding.ObservableList
import io.reactivex.rxjava3.core.Observable
import io.reactivex.rxjava3.kotlin.toObservable

class NoteRepository(private val noteList: ArrayList<Note> = ArrayList()) {

    var numbers: Observable<Note> = noteList.toObservable()

    fun notes(): ArrayList<Note> {
        return  noteList;
    }

    fun addNote(note: Note) {
        noteList.add(note)
    }

    fun deleteNote(note: Note) {
        noteList.remove(note)
    }
}