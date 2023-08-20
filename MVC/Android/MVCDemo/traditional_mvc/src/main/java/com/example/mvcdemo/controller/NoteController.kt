package com.example.mvcdemo.controller

import com.example.mvcdemo.model.Note
import com.example.mvcdemo.model.NoteRepository

class NoteController(private val noteRepository: NoteRepository) {

    fun getNotes(): ArrayList<Note> {
        return  noteRepository.notes()
    }

    fun addNote(note: Note) {
        noteRepository.addNote(note)
    }

    fun deleteNote(note: Note) {
        noteRepository.deleteNote(note)
    }

}