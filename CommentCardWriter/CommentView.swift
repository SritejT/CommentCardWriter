//
//  CommentView.swift
//  CommentCardWriter
//
//  Created by Tummuru, Sritej (Coll) on 03/03/2023.
//

import SwiftUI

struct CommentView: View {
    @EnvironmentObject var comment: Comment
    @State private var subjectPreference = 5.0
    @State private var teacherPreference = 5.0
    @State private var subject = ""
    @State private var teacher = ""
    @State private var editing = false
    
    var body: some View {
        if editing {
            VStack {
                Image(systemName: "pencil.circle.fill")
                Text("Editing...")
            }
        } else {
            VStack {
                Image(systemName: "checkmark.seal.fill")
                Text("Saved!")
            }
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
        
        TextField(
                "Create your comment!",
                text: $comment.text)
                .frame(width: 290, alignment: .leading)
                .border(.primary)
                .padding()
                .lineLimit(5)
        
        Button("Copy Comment", action: {
            UIPasteboard.general.setValue(comment.text, forPasteboardType: "public.plain-text")
        })
    }
}


struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView()
            .environmentObject(Comment())
    }
}
