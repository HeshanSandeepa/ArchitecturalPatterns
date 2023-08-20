package com.example.mvcdemo

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.Button
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import com.example.mvcdemo.controller.NoteController
import com.example.mvcdemo.model.Note
import com.example.mvcdemo.model.NoteRepository
import com.example.mvcdemo.ui.theme.MVCDemoTheme
import io.reactivex.rxjava3.core.Observable

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MVCDemoTheme {
                // A surface container using the 'background' color from the theme
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    val noteRepository = NoteRepository()
                    NoteScreen(NoteController(noteRepository))
                }
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun NoteScreen(noteController: NoteController, modifier: Modifier = Modifier) {

    var text by remember { mutableStateOf("") }
    NoteRepository().numbers.subscribe {
        print(it);
    }



    Column(        modifier = modifier,
        verticalArrangement = Arrangement.SpaceBetween) {
        OutlinedTextField(
            value = text,
            onValueChange = { text = it },
            label = { Text("Label") }
        )
        Button(
            onClick = { noteController.addNote(Note(1, text)) },
        ) {
            Text("Save")
        }


       // NoteList(notes = notes)

    }
}

@Composable
fun NoteList(notes: ArrayList<Note>) {
    Column(
    ) {
        notes.forEach {

            Text(text = it.note)

        }
    }
}




@Preview(showBackground = true)
@Composable
fun GreetingPreview() {
    MVCDemoTheme {
        NoteScreen(NoteController(NoteRepository()))
    }
}