//
//  ContentView.swift
//  CommentCardWriter
//
//  Created by Tummuru, Sritej (Coll) on 04/02/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var comment: Comment
    @State private var subjectPreference = 5.0
    @State private var teacherPreference = 5.0
    @State private var subject = ""
    @State private var teacher = ""
    @State private var editing = false
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 20) {
            VStack {
                Image(systemName: "pencil.circle.fill")
                Text("Editing...")
            }.disabled(editing)
            VStack {
                Image(systemName: "checkmark.seal.fill")
                Text("Saved!")
            }
            HStack {
                Text("Subject: ")
                TextField(
                    "Enter subject here...",
                    text: $subject,
                    onEditingChanged:{ _ in
                        editing.toggle()
                        comment.subject = subject
                        comment.generatePreferenceComment()
                    }
                )
                    .border(.secondary)
            }
            
            HStack {
                Text("Teacher: ")
                TextField(
                    "Enter teacher here...",
                    text: $teacher,
                    onEditingChanged:{ _ in
                        editing.toggle()
                        comment.teacher = teacher
                        comment.generatePreferenceComment()
                    }
                )
                    .border(.secondary)
            }
            
            HStack {
                Text("Subject Preference: ")
                Slider(
                    value: $subjectPreference,
                    in: 0...10,
                    onEditingChanged: { _ in
                        editing.toggle()
                        comment.subjectPreference = subjectPreference
                        comment.generatePreferenceComment()
                    }
                )
            }
            
            HStack {
                Text("Teacher Preference: ")
                Slider(
                    value: $teacherPreference,
                    in: 0...10,
                    onEditingChanged: { _ in
                        editing.toggle()
                        comment.teacherPreference = teacherPreference
                        comment.generatePreferenceComment()
                    }
                )
            }
            
            Text(comment.text)
                .padding()
                .border(.primary)
            
            Divider()
            
            Button("Copy Comment", action: {
                UIPasteboard.general.setValue(comment.text, forPasteboardType: "public.plain-text")
            })
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Comment())
    }
}
